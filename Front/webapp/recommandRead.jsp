<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    

<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <title>${board_title}</title>
  </head>
  <body>
      <div class="container">

            <div class="row">
				<div class="col-lg-4" style="margin-top: 80px;">
                  <c:if test="${vo.member_code != null }">
                  <b>${vo.member_nickname }</b>님 환영합니다
                  </c:if>
                  <c:if test="${vo.member_grade == 0 }">
                      <a href="adminMain.oshi" type="button" class="btn btn-primary btn-sm" style="margin:1px; width:120px">관리자 페이지</a>
                  </c:if>
                </div>
                <div class="col-lg-4" style="text-align: center;">
                  <a href="main.oshi"><img src="images/oshi1.png" style="height: 200px; width:300px;"></a>
                </div>
                <c:if test="${vo.member_code == null }">
                
                <div class="col-lg-2">
                  <form action="loginProc.oshi" method="post">
                  <div class="form-group">
                    <input class="form-control form-control-sm" name="member_id" type="text" placeholder="id" id="inputSmall" style="margin-top: 80px;">
                    <input class="form-control form-control-sm" name="member_password" type="password" placeholder="password" id="inputSmall" style="margin:1px;">
                  </div>
                </div>
                <div class="col-lg-2">
                  <button type="submit" class="btn btn-primary btn-sm" style="margin-top: 80px; width:80px" >로그인</button><br>
                  <a href="memberRegister.oshi" type="button" class="btn btn-primary btn-sm" style="margin:1px; width:80px">회원가입</a>
                </div>
                </form>
                
                </c:if>
                
                <c:if test="${vo.member_code != null }">
                <div class="col-lg-4">
                  <a href="logoutProc.oshi" class="btn btn-primary btn-sm" style="margin-top: 80px;">로그 아웃</a>
                  <a href="memberModify.oshi" class="btn btn-primary btn-sm" style="margin-top: 80px;">정보 수정</a>
                  <a href="memberDelete.oshi" class="btn btn-primary btn-sm" style="margin-top: 80px;">회원 탈퇴</a>
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
          <div class="row" style="margin-top: 50px;">
          <div class="col-lg-1"></div>
          <div class="col-lg-10">

              <div style="margin: auto;">
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
                    <td style="text-align: center;">${board_no}</td>
                    <td style="text-align: center;">${board_category}</td>
                    <td colspan="5" style="text-align: center;">${board_title}</td>
                    <td style="text-align: center;">${board_writer}</td>
                    <td style="text-align: center;">${board_regdate}</td>
                    <td style="text-align: center;">${board_readcount}</td>
                    <td style="text-align: center;">${board_recommand}</td>
                  </tr>
                <tr>
                  <td colspan="11" style="text-align: center;">영상</td>
              </tr>
              <tr>
                  <td colspan="11" style="text-align: center;"><iframe width="560" height="315" src="${url}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
              </tr>
              <tr>
                  <td colspan="11" style="text-align: center;">곡소개 및 추천이유</td>
              </tr>
              <tr>
                  <td colspan="11"><p>${board_content}</p></textarea></td>
              </tr>
                  <tr style="border: none;">
						<td colspan="11" style="border: none;"><span
							class="rec_count"></span>
							<form
								action="likeCheck.oshi?board_no=${board_no}&pageNum=${currentPage}&board_type=${board_type}"
								method="post">
								<input type="submit" class="btn btn-info" value="추천"
									style="width: 100px; float: right;"> <input
									type="button" class="btn btn-danger" value="신고"
									style="width: 100px; float: right;"
									onclick="window.open('declaration.oshi?board_writer=${board_writer}&board_no=${board_no}','신고하기','width=500,height=600')">
							</form></td>
					</tr>
					
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
									action="recommandCommentsProc.oshi?comments_writer=${sessionScope.member_code}&comments_board_no=${board_no}&comments_ref=${comment0.comments_code}&comments_depth=1&board_no=${board_no}&board_type=${board_type}"
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
							action="recommandCommentsProc.oshi?comments_writer=${sessionScope.member_code}&comments_board_no=${board_no}&comments_depth=0&board_no=${board_no}&board_type=${board_type}"
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
              <div class="col-lg-12">
              	<c:if test="${board_writer == member_code}">
                <input type="button" class="btn btn-outline-info" value="글 삭제" style="width: 100px;" onclick="window.location='recommandDelete.oshi?board_no=${board_no}'">
                <input type="button" class="btn btn-outline-info" value="글 수정" style="width: 100px;" onclick="window.location='recommandUpdate.oshi?board_no=${board_no}'">
                </c:if>
                <input type="button" class="btn btn-outline-info" value="글 목록" style="width: 100px;" onclick="window.location='recommand.oshi'">
            	</div>
              </div>
              <div class="col-lg-1"></div>
            </div>
          </div>
              
          </div>
 
      
                      
      
    <div class="jumbotron text-center mt-2 mb-1"> 
      <h3 class="text-secondary">footer</h3> 
      <p>This Homepage is powered by 
        <span class="text-primary">Team JSC</span> 
        / Designed by 
        <span class="text-primary">Team JSC</span>
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
								var board_type = "${board_type}";
								var board_no = "${board_no}";

								var delChk = confirm("삭제하냐?");
								if (delChk)
									location.href = "recommandDeleteCommentsProc.oshi?comments_code="
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