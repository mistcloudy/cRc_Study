<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.ReportsDAO" %>
<%@ page import="vo.ReportsVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${chk != 1 }">
<script type="text/javascript">
   alert('실패');
   window.close();
</script>
</c:if>
<c:if test="${chk==1 }">
<script type="text/javascript">
   alert('성공');
   window.close();
</script>
</c:if>
</body>
</html>