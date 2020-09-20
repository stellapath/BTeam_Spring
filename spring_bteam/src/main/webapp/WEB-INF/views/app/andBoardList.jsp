<%@page import="com.project.bteam.board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Gson gson = new Gson();
List<BoardVO> boardList = (List<BoardVO>) request.getAttribute("boardList");
out.println( gson.toJson(boardList) );
%>