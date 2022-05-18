<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    

<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <title>유투버 신청자 목록</title>

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
          
            <div class="collapse navbar-collapse" id="navbarColor01" style="margin-left: 15%; margin-right: 20%;">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="main.oshi">Home
                    <span class="sr-only">(current)</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="boardMain.oshi?member_code=${vo.member_code}">게시판 메인</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="recommand.oshi?member_code=${vo.member_code}">곡 추천 게시판</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="boardRegisterBoard.oshi?member_code=${vo.member_code}">게시판 개설 </a>
                </li>
              </ul>
            </div>
         </nav>
         </div>
      <div class="container">
        <div class="row">
          

          <div class="col-lg-10">
          
          
            <div class="container">
                <div class="row">
              
              <div>
                  <table class="table table-bordered">
                      <tr class="table-info">
                          <th style="text-align: center;">번호</th>
                          <th style="text-align: center;">신청한 게시판</th>
                          <th style="text-align: center;">신청한 게시판의 관리자</th>
                          <th style="text-align: center;">신청한 게시판의 유투버</th>
                          <th style="text-align: center;">게시판 코드</th>
                          <th style="text-align: center;">신청자 닉네임</th>
                          <th style="text-align: center;">유투버 신청자 코드</th>
                          <th style="text-align: center;">결정하기</th>
                          <th style="text-align: center;">승인여부(승인:1)</th>
                          
                      </tr>
                      
                       <c:forEach var="a" items="${getYoutuberRegisterInfo}">
                      <tr>
                          <td>${a.admin_r_no}</td>
                          <td>${a.board_t_name}</td>
                          <td>${a.board_t_manager}</td>
                          <td>${a.board_t_youtuber}</td>
                          <td>${a.admin_r_board}</td>
                          <td>${a.member_nickname}</td>
                          <td>${a.admin_r_requester}</td>
                          <td>
                          	<!-- Proc에서 승인 / 거절에 대한 결과를 실행합니다. -->
		                     <form action="/Oshi/youtuberRegisterProc.oshi?board_t_name=${a.admin_r_board}&admin_r_requester=${a.admin_r_requester}" method="post" name="info"
		                     onsubmit="return check()">
		                    <select class="custom-select" style="width: 100px;" name="how" >
		                      <option value="ok">승인</option>
		                      <option value="no">거절</option>
		                    </select>
		                    <button type="submit" class="btn btn-info" >결정</button>
		                    </form> 
                    </td>
                          <td>${a.admin_r_approved}</td>
                      </tr>
                </c:forEach>
                  </table>
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
    </div>
    </div>
    </div>
  </body>
</html>