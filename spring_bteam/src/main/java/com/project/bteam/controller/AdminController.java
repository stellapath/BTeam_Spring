package com.project.bteam.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.bteam.board.BoardPage;
import com.project.bteam.common.CommonService;
import com.project.bteam.order.OrderServiceImpl;
import com.project.bteam.order.OrderVO;
import com.project.bteam.user.UserServiceImpl;
import com.project.bteam.user.UserVO;

@Controller
public class AdminController {
	@Autowired private UserServiceImpl user;
	@Autowired private BoardPage page; 
	@Autowired private OrderServiceImpl order;
	@Autowired private CommonService common;
	
	// 등록제품 수정처리 요청
	@RequestMapping("/productUpdate")
	public String productUpdate(OrderVO vo, String attach_default, String attach_detail, 
								Model model, HttpSession session,
								MultipartFile p_up_defaultImage, MultipartFile p_up_detailImage) {
		OrderVO product = order.productDetail(vo.getP_num());
		String uuid_default = session.getServletContext().getRealPath("resources") + product.getP_defaultimage_path();
		String uuid_detail = session.getServletContext().getRealPath("resources") + product.getP_detailimage_path();
		
		//대표이미지 수정
		if(!p_up_defaultImage.isEmpty()) {
			//기존 이미지 세팅
			vo.setP_defaultimage_name(p_up_defaultImage.getOriginalFilename());
			vo.setP_defaultimage_path(common.upload("product", p_up_defaultImage, session));
			//이미지 삭제
			if(product.getP_defaultimage_name() != null) {
				File f = new File(uuid_default);
				if(f.exists()) f.delete();
			}
		}else {
			//이미지 
			if(attach_default.isEmpty()) {
				if(product.getP_defaultimage_name() != null) {
					File f = new File(uuid_default);
					if(f.exists()) f.delete();
				}	
			}else {
				vo.setP_defaultimage_name(product.getP_defaultimage_name());
				vo.setP_defaultimage_path(product.getP_defaultimage_path());
			}	
		}
		
		//상세이미지수정
		if(!p_up_detailImage.isEmpty()) {

			vo.setP_detailimage_name(p_up_detailImage.getOriginalFilename());
			vo.setP_detailimage_path(common.upload("product", p_up_detailImage, session));

			if(product.getP_detailimage_name() != null) {
				File f = new File(uuid_detail);
				if(f.exists()) f.delete();
			}
		}else {
			if(attach_detail.isEmpty()) {
				if(product.getP_detailimage_name() != null) {
					File f = new File(uuid_detail);
					if(f.exists()) f.delete();
				}	
			}else {
				vo.setP_detailimage_name(product.getP_detailimage_name());
				vo.setP_detailimage_path(product.getP_detailimage_path());
			}	
		}
		
		order.productUpdate(vo);
		return "redirect:productList";
	}
	
	// 등록제품 수정버튼 클릭시 등록제품정보요청
	@ResponseBody @RequestMapping("/productUpdateInfo")
	public OrderVO productUpdateInfo(String p_num, Model model) {
		return order.productDetail(p_num);
	}
 	
	// 등록제품 삭제처리 요청
	@ResponseBody @RequestMapping("/productDelete")
	public void productDelete(String p_num) {
		order.productDelete(p_num);
	}
	
	// 판매제품 등록처리 요청
	@RequestMapping("/productAdd")
	public String productAdd(OrderVO vo, MultipartFile p_defaultImage, MultipartFile p_detailImage, HttpSession session) {
		if(! p_defaultImage.isEmpty()) {
			vo.setP_defaultimage_name(p_defaultImage.getOriginalFilename());
			vo.setP_defaultimage_path(common.upload("product", p_defaultImage, session));
		}
		if(! p_detailImage.isEmpty()) {
			vo.setP_detailimage_name(p_detailImage.getOriginalFilename());
			vo.setP_detailimage_path(common.upload("product", p_detailImage, session));
		}
		
		order.productAdd(vo);
		return "redirect:productList";
	}
	
	// 판매제품관리 페이지 요청
	@RequestMapping("/productList")
	public String productList(Model model, HttpSession session) {
		session.setAttribute("mypage", "productList");
		model.addAttribute("product", order.productList());
		return "admin/productList";
	}
	
	// 주문취소 처리요청
	
	// 주문관리 페이지 요청
	@RequestMapping("/orderList")
	public String orderList(Model model, HttpSession session,
							@RequestParam(defaultValue="all") String orderStatus,
							String keyword,
							@RequestParam(defaultValue="10") int pageList,
							@RequestParam(defaultValue="1") int curPage) {
		
		session.setAttribute("mypage", "orderList");
		
		page.setOrderStatus(orderStatus);
		page.setKeyword(keyword);
		page.setCurPage(curPage);
		page.setPageList(pageList);
		
		model.addAttribute("page", order.orderAdminList(page));
		return "admin/orderList";
	}
		
	// 회원정보 페이지 요청
	@RequestMapping("/userInfo")
	public String userInfo(String user_email, Model model, HttpSession session) {
		session.setAttribute("mypage", "userInfo");
		UserVO vo = user.userDetail(user_email);
		model.addAttribute("vo", vo);
		return "admin/userInfo";
	}
	
	// 회원관리 페이지 요청
	@RequestMapping("/userList")
	public String userList(Model model, HttpSession session) {
		session.setAttribute("mypage", "userList");
		List<UserVO> list = user.userList();
		model.addAttribute("list", list);
		return "admin/userList";
	}
	
	// 관리자페이지 요청
	@RequestMapping("/adminPage")
	public String adminPage(HttpSession session) {
		session.setAttribute("menu", "admin");
		return "admin/adminPage";
	}

}
