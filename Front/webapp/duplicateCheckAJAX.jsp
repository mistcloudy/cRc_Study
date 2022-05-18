<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO dao = MemberDAO.getInstance();
	String id = request.getParameter("id");
	int chk = dao.idDuplicateCheck(id);
%>
<%=chk %>