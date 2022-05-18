<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDAO dao = BoardDAO.getInstance();
	String board_type = request.getParameter("board_type");
	String member_code = request.getParameter("member_code");
    System.out.println(board_type);
    System.out.println(member_code);
	int chk = dao.YoutuberCheck(board_type, member_code);
	 
%>
<%=chk %>