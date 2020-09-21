<%@page import="com.google.gson.Gson"%>
<%@page import="com.project.bteam.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardVO vo = (BoardVO) request.getAttribute("vo");
Gson gson = new Gson();
out.println(gson.toJson(vo));
%>