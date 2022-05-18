<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<title>${article.board_title}</title>
<script type="text/javascript">
	function likeCheck() {
		location.href = "likeCheck.jsp";
	}
</script>
</head>
<body>
	<div class="container">

		<div class="row">
			<div class="col-lg-4" style="margin-top: 80px;">
				<c:if test="${vo.member_code != null }">
					<b>${vo.member_nickname }</b>님 환영합니다
                  </c:if>
				<c:if test="${vo.member_grade == 0 }">
					<a href="adminMain.oshi" type="button"
						class="btn btn-primary btn-sm" style="margin: 1px; width: 120px">관리자
						페이지</a>
				</c:if>
			</div>
			<div class="col-lg-4" style="text-align: center;">
				<a href="main.oshi"><img src="images/oshi1.png"
					style="height: 200px; width: 300px;"></a>
			</div>
			<c:if test="${vo.member_code == null }">

				<div class="col-lg-2">
					<form action="loginProc.oshi" method="post">
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
				</form>

			</c:if>

			<c:if test="${vo.member_code != null }">
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
                <li class="nav-item active">
                  <a class="nav-link" href="main.oshi">Home
                    <span class="sr-only">(current)</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="boardMain.oshi">게시판 메인</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="recommand.oshi">곡 추천 게시판</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="boardRegisterBoard.oshi">게시판 개설 </a>
                </li>
              </ul>
            </div>
            </div>
         </nav>
         </div>
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
				<c:set var="i" value="${info }" />
				<div class="card mb-3" style="margin-top: 100px;">
					<h3 class="card-header" style="text-align: center;">${i.board_t_name }</h3>
					<div class="card-body">
						<h5 class="card-title">${i.board_t_desc }</h5>
					</div>
					<img alt="" src="upload/${i.board_t_image }"
						style="height: 150px; width: 100%">
					<div class="card-body"></div>
					<div class="card-body">
						<a href="${i.board_t_url }" class="card-link">유튜브 링크</a>
					</div>
					<div class="card-footer text-muted">
						<h5>&nbsp;유투버 : ${YoutuberNickname.youtuber_nickname }</h5>
						<h5>&nbsp;관리자 : ${ManagerNickname.manager_nickname }</h5>
					</div>
					<div style="text-align: center;">
						<form
							action="favoriteCheck.oshi?fav_board=${board_type}&fav_user=${sessionScope.member_code}"
							method="post">
							<button type="submit" class="btn btn-secondary btn-lg"
								style="margin-top: 50px;">즐겨 찾기</button>
							<input type="hidden" value="${i.board_t_code}"
								name="board_t_code"> <input type="hidden"
								value="${sessionScope.member_code}" name="member_code">
						</form>
					</div>
					<div>
						<!-- 게시판 관리자면 유투버 정보 변경할수있게 -->
						<c:if test="${i.board_t_manager == vo.member_code }">
							<a href="BoardInfoUpdate.oshi?board_type=${param.board_type}"
								type="button" class="btn btn-primary btn-sm"
								style="margin: 1px; width: 120px">정보 수정</a>
						</c:if>
					</div>
				</div>
			</div>
		

		<div class="col-lg-10">

			<div style="margin-top: 20px;">
				<table class="table table-bordered">
					<tr class="table-info">
						<th style="text-align: center;">글번호</th>
						<th style="text-align: center;">말머리</th>
						<th colspan="5" style="text-align: center;">제목</th>
						<th style="text-align: center;">글쓴이</th>
						<th style="text-align: center;">작성일자</th>
						<th style="text-align: center;">조회수</th>
						<th style="text-align: center;">추천수</th>
					</tr>
					<tr>
						<td style="text-align: center;">${article.board_no}</td>
						<td style="text-align: center;">${article.board_category}</td>
						<td colspan="5" style="text-align: center;">${article.board_title}</td>
						<td style="text-align: center;">${article.member_nickname}</td>
						<td style="text-align: center;">${article.board_regdate}</td>
						<td style="text-align: center;">${article.board_readcount}</td>
						<td style="text-align: center;">${article.board_recommand}</td>
					</tr>
					<tr>
						<td colspan="11" style="height: 500px;">
							${article.board_content}</td>
					</tr>
					<tr style="border: none;">
						<td colspan="11" style="border: none;"><span
							class="rec_count"></span>
							<form
								action="likeCheck.oshi?board_no=${article.board_no}&pageNum=${currentPage}&board_type=${article.board_type}"
								method="post">
								<input type="submit" class="btn btn-info" value="추천"
									style="width: 100px; float: right;"> <input
									type="button" class="btn btn-danger" value="신고"
									style="width: 100px; float: right;"
									onclick="window.open('declaration.oshi?board_writer=${article.board_writer}&board_no=${article.board_no}','신고하기','width=500,height=600')">
							</form></td>
					</tr>
					<%-- <c:forEach var="a" items="${abcList}">
                    <c:if test="${a.comments_step == 1}">
                    <tr class="table-light">
                      <td scope="row">${a.comments_writer }</td>
                      <td colspan="10">${a.comments_content }</td>
                    </tr>
                    </c:if>
                    <c:if test="${a.comments_step == 2}">
                    <tr class="table-light">
                      <td scope="row"><img src="images/댓글.png" style="height:15px; width:15px;">${a.comments_writer }</td>
                      <td colspan="10">${a.comments_content }</td>
                    </tr>
                    </c:if>
                    <c:if test="${a.comments_step == 0 }">
                       <tr class="table-light">
                      <td scope="row">없음</td>
                      <td colspan="10">없음</td>
                    </tr>
                    </c:if>
                    </c:forEach> --%>
					<c:forEach var="comment0" items="${abcList0 }" varStatus="status">

						<!-- 0차 댓글 -->
						<tr class="table-light">
							<th scope="row">${comment0.commenter }</th>
							<td colspan="9" class="forDrop">${comment0.comments_content }</td>
							<td colspan="2" align="right"><c:if
									test="${(comment0.comments_writer == sessionScope.member_code) || vo.member_grade == 0 }">
									<button class="commentDel btn btn-secondary">X</button>
								</c:if> ${comment0.comments_regdate}</td>
							<input type="hidden" value=${comment0.comments_code }>
							

						</tr>
						<!-- 대댓글 입력창 -->
						<c:if test="${sessionScope.member_code != null }">
							<tr style="display: none">
								<form
									action="insertCommentsCheck.oshi?comments_writer=${sessionScope.member_code}&comments_board_no=${article.board_no}&comments_ref=${comment0.comments_code}&comments_depth=1&board_no=${article.board_no}&board_type=${article.board_type}"
									method="post">
									<td colspan="10" style="text-align: center;"><input
										type="text" class="form-control" placeholder="댓글 달아봐 ㅋㅋ"
										id="inputDefault" name="comments_content"></td>
									<td colspan="1" style="text-align: center;">
										<button class="btn btn-primary" type="submit">댓글 쓰기</button>
									</td>
								</form>
							</tr>
						</c:if>
						<c:forEach var="comment1" items="${abcList1 }" varStatus="status">

							<c:if test="${comment0.comments_code == comment1.comments_ref }">

								<!-- 1차 댓글 -->
								<tr class="table-light">
									<th scope="row"><img src="images/댓글.png"
										style="height: 15px; width: 15px;">${comment1.commenter }</th>
									<td colspan="9">${comment1.comments_content    }</td>
									<td colspan="2" align="right"><c:if
											test="${(comment1.comments_writer == sessionScope.member_code) || vo.member_grade == 0 }">
											<button class="commentDel btn btn-secondary">X</button>
										</c:if> ${comment1.comments_regdate}</td>
									<input type="hidden" value=${comment1.comments_code }>
								</tr>
							</c:if>


						</c:forEach>
					</c:forEach>
					<tr>
						<form
							action="insertCommentsCheck.oshi?comments_writer=${sessionScope.member_code}&comments_board_no=${article.board_no}&comments_depth=0&board_no=${article.board_no}&board_type=${article.board_type}"
							method="post">
							<td colspan="10" style="text-align: center;"><input
								type="text" class="form-control" placeholder="Default input"
								id="inputDefault" name="comments_content"></td>
							<td colspan="1" style="text-align: center;">
								<button class="btn btn-primary" type="submit">댓글 쓰기</button>
							</td>
						</form>
					</tr>
				</table>
			</div>
			<div class="col-lg-12">
			<c:if test="${article.board_writer == sessionScope.member_code}">
				<a href="delete.oshi?board_no=${article.board_no}&member_code=${sessionScope.member_code}&board_type=${article.board_type}" class="btn btn-outline-info" style="width: 100px;">글 삭제</a>
                <a href="update.oshi?board_type=${article.board_type}&board_no=${article.board_no}&member_code=${sessionScope.member_code}" class="btn btn-outline-info" style="width: 100px;">글 수정</a>
                </c:if>
                <a href="individual_board.oshi?board_type=${article.board_type }" class="btn btn-outline-info"  style="width: 100px;">글 목록</a>
			</div>
		</div>

	</div>
	</div>
</div>



	<div class="jumbotron text-center mt-2 mb-1">
		<h3 class="text-secondary">footer</h3>
		<p>
			This Homepage is powered by <span class="text-primary">Team
				JSC</span> / Designed by <span class="text-primary">Team JSC</span>
		</p>
	</div>
	<script type="text/javascript">
		/* Jquery */
		$(function() {
			

			//댓글 depth 0인 애들은 클릭시 대댓글 창이 생성됨
			$(".forDrop").click(function() {

				var target = $(this).parent().next();

				if (target.css('display') === "none") {
					target.show();
				} else {
					target.hide();
				}

			});
			
			
			$(".commentDel")
					.click(
							function() {
								var code = $(this).parent().next()[0].value;
								var board_type = "${article.board_type}";
								var board_no = "${article.board_no}";

								var delChk = confirm("삭제하냐?");
								if (delChk)
									location.href = "deleteCommentsProc.oshi?comments_code="
											+ code
											+ "&board_type="
											+ board_type
											+ "&board_no="
											+ board_no;
							});

		});
	</script>
</body>
</html>