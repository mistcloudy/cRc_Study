<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	alert("실패");
	history.go(-1);
</script>
<c:if test="${chk == 1 }">
	<script type="text/javascript">
		alert("성공");
		history.go(-1);
	</script>
</c:if>
</c:if>
</body>
</html>