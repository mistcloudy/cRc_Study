<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <title>Oshi</title>
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
          <div class="row">
            <div class="col-lg-6" style="margin: 20px 0px;">
              <div class="card border-success mb-3" style="width:100%;height:100%;">
                <div class="card-header" style="text-align:center;"><b><a href="NoticeList.oshi">공지사항</a></b></div>
                <div class="card-body">
                  <table class="table table-hover">
                    <thead>
                      <tr class="table-info">
                        <th scope="col" colspan="3" style="text-align: center;">제목</th>
                        <th scope="col" style="text-align: center;">작성자</th>
                      </tr>
                    </thead>
                    <tbody>
		                     <c:forEach var="n" items="${getMainNoticeArticles}">
		                  <tr class="table-light">
		                  <!-- 보드타입 가져와야함 - 메인디에이오 액션 수정 필요함 -->
		                    <th scope="row" colspan="3" style="text-align: center;"><a href="NoticeRead.oshi?board_type=A00&board_no=${n.board_no}" style="text-decoration: none">${n.board_title}</a></th>
		                    <td style="text-align: center;">${n.board_writer}</td>
		                  </tr>
		                 	 </c:forEach>
                    </tbody>
                  </table>
                </div>
                </div>
              </div>
                  <!-- 인덱스 인기글 출력부 -->
        <div class="col-lg-6" style="margin: 20px 0px;">
          <div class="card border-success mb-3" style="width:100%;height:100%;">
            <div class="card-header" style="text-align:center;"><b>인기 게시물</b></div>
            <div class="card-body">
              <table class="table table-hover">
                <thead>
                  <tr class="table-info">
                    <th scope="col" colspan="3" style="text-align: center;">제목</th>
                    <th scope="col" style="text-align: center;">추천수</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="a" items="${getMainBestArticles}">
                  <tr class="table-light">
                  <!-- 보드타입 가져와야함 - 메인디에이오 액션 수정 필요함 -->
                    <th scope="row" colspan="3" style="text-align: center;"><a href="individual_read.oshi?board_type=${a.board_type}&board_no=${a.board_no}" style="text-decoration: none">${a.board_title}</a></th>
                    <td style="text-align: center;">${a.board_recommand}</td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
            </div>
          </div> 
            
        </div>       
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <div class="card border-success mb-3" style="width:100%;height:100%;">
              <div class="card-header" style="text-align:center;"><b>인기 추천곡</b></div>
              <div class="card-body" style="text-align: center;">
                <h4 class="card-title"><a href="recommandRead.oshi?board_no=${favRecommandBoardNo }">${favRecommandBoardTitle}</a></h4>
                <iframe width="530" height="315" src="${favRecommandUrl}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="card border-success mb-3" style="width:100%;height:100%;">
              <div class="card-header" style="text-align:center;"><b>신규 추천곡</b></div>
              <div class="card-body" style="text-align: center;">
                <h4 class="card-title"><a href="recommandRead.oshi?board_no=${newRecommandBoardNo}">${newRecommandBoardTitle}</a></h4>
                <iframe width="530" height="315" src="${newRecommandUrl}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
              </div>
            </div> 
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
  </body>
</html>