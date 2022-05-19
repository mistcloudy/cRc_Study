<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<title>TopMenu</title>
</head>
<body>
	<div class="container">

		<div class="row">
			<div class="col-lg-4" style="margin-top: 80px;">
				<c:if test="<%-- ${vo.member_code != null } --%>">
					<b> <%-- ${vo.member_nickname } --%>
					</b>님 환영합니다
                  </c:if>
				<c:if test="<%-- ${vo.member_grade == 0 } --%>">
					<a href="adminMain.oshi" type="button"
						class="btn btn-primary btn-sm" style="margin: 1px; width: 120px">관리자
						페이지</a>
				</c:if>
			</div>
			<div class="col-lg-4" style="text-align: center;">
				<a href="main.oshi"><img src="images/oshi1.png"
					style="height: 200px; width: 300px;"></a>
			</div>
			<c:if test="<%-- ${vo.member_code == null } --%>">

				<div class="col-lg-2">
					<!--   <form action="loginProc.oshi" method="post"> -->
					<div class="form-group">
						<input class="form-control form-control-sm" name="member_id"
							type="text" placeholder="id" id="inputSmall"
							style="margin-top: 80px;"> <input
							class="form-control form-control-sm" name="member_password"
							type="password" placeholder="password" id="inputSmall"
							style="margin: 1px;">
					</div>
				</div>
				<div class="col-lg-2">
					<button type="submit" class="btn btn-primary btn-sm"
						style="margin-top: 80px; width: 80px">로그인</button>
					<br> <a href="memberRegister.oshi" type="button"
						class="btn btn-primary btn-sm" style="margin: 1px; width: 80px">회원가입</a>
				</div>
				<!--   </form> -->

			</c:if>

			<c:if test="<%-- ${vo.member_code != null } --%>">
				<div class="col-lg-4">
					<a href="logoutProc.oshi" class="btn btn-primary btn-sm"
						style="margin-top: 80px;">로그 아웃</a> <a href="memberModify.oshi"
						class="btn btn-primary btn-sm" style="margin-top: 80px;">정보 수정</a>
					<a href="memberDelete.oshi" class="btn btn-primary btn-sm"
						style="margin-top: 80px;">회원 탈퇴</a>
				</div>
			</c:if>
		</div>
	</div>

	<div class="col-lg-12">
		<nav class="navbar navbar-expand-md navbar-dark bg-primary">
			<div class="container">
				<div class="collapse navbar-collapse" id="navbarColor01">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a class="nav-link"
							href="main.oshi">Home <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="boardMain.oshi">게시판 메인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="recommand.oshi">곡 추천 게시판</a></li>
						<li class="nav-item"><a class="nav-link"
							href="boardRegisterBoard.oshi">게시판 개설 </a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>

</body>
</html>