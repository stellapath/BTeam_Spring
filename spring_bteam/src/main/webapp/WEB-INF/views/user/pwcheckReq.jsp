<%@page import="com.project.bteam.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
UserVO vo = (UserVO) session.getAttribute("pwcheck_info");
pageContext.setAttribute("vo", vo);
%>
${vo.user_email}
${vo.user_nickname}
