package com.project.bteam.common;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CommonService {

	// 파일 업로드
	public String upload(String category, MultipartFile file, HttpSession session) {
		String resources = session.getServletContext().getRealPath("resources");
		String upload = resources + "/upload";
		String folder = upload + "/" + category + "/" + new SimpleDateFormat("yyyy/MM/dd").format(new Date());
		File f = new File(folder);
		if (!f.exists()) f.mkdirs();
		String uuid = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		try {
			file.transferTo(new File(folder, uuid));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return folder.substring(resources.length()) + "/" + uuid;
	}
	
	// 파일 다운로드
	public File download(String board_filename, String board_filepath, HttpSession session, HttpServletResponse response) {
		File file = new File(session.getServletContext().getRealPath("resources") + board_filepath);
		String mime = session.getServletContext().getMimeType(board_filename);
		response.setContentType(mime);
		try {
			board_filename = URLEncoder.encode(board_filename, "utf-8").replaceAll("\\+", "%20");
			response.setHeader("content-disposition", "attachment; filename=" + board_filename);
			ServletOutputStream out = response.getOutputStream();
			FileCopyUtils.copy(new FileInputStream(file), out);
			out.flush();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return file;
	}
	
}
