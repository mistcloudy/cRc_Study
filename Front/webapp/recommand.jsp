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

    <title>추천곡 게시판</title>
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
          <div class="col-lg-1"></div>
          <div class="col-lg-10">
            <div class="container">
                <div class="row">
                  <div class="col-lg-6" name="dailyReference" style="margin-top: 20px;">
                      <table class="table table-bordered" style="text-align: center;">
                          <tr class="table-warning"><th style="text-align: center;">일간 인기게시물</th></tr>
                          <c:forEach var="a" items="${daily}">
                                 <tr>
                                    <td>${a.board_title}</td>
                                 </tr>
                           </c:forEach>
                      </table>
                  </div>
                  <div class="col-lg-6" name="weeklyReference" style="margin-top: 20px;">
                      <table class="table table-bordered" style="text-align: center;"> 
                          <tr class="table-warning"><th style="text-align: center;">주간 인기게시물</th></tr>
                          <c:forEach var="b" items="${weekly}">
                                 <tr>
                                    <td>${b.board_title}</td>
                                 </tr>
                          </c:forEach>
                      </table>
                  </div>
                </div>
              </div>

               <!-- 게시판 글 목록 -->
              <div>
                  <c:if test="${count > 0 }">
              <div>
                  <table class="table table-bordered" style="text-align:center;">
                      <tr class="table-info">
                          <th style="text-align: center;">글번호</th>
                          <th style="text-align: center;">말머리</th>
                          <th colspan="5" style="text-align: center; width:150px;">제목</th>
                          <th style="text-align: center;">글쓴이</th>
                          <th style="text-align: center;">작성일자</th>
                          <th style="text-align: center;">조회수</th>
                          <th style="text-align: center;">추천수</th>
                      </tr>
                      
                       <c:forEach var="n" items="${noticeArticleList}">
                      <tr class="table-active">
                          <td>${n.board_no}</td>
                          <td>${n.board_category}</td>
                          <td colspan="5" style="width:150px;"><a href="recommandRead.oshi?board_type=${n.board_type}&board_no=${n.board_no}" style="text-decoration: none">${n.board_title}</a></td>
                          <td>${n.board_writer}</td>
                          <td>${n.board_regdate}</td>
                          <td>${n.board_readcount}</td>
                          <td>${n.board_recommand}</td>
                      </tr>
                      </c:forEach>
                      
                       <c:forEach var="a" items="${articleList}">
                      <tr>
                          <td>${a.board_no}</td>
                          <td>${a.board_category}</td>
                          <td colspan="5" style="width:150px;"><a href="recommandRead.oshi?board_type=${a.board_type}&board_no=${a.board_no}" style="text-decoration: none;">${a.board_title}</a></td>
                          <td>${a.board_writer}</td>
                          <td>${a.board_regdate}</td>
                          <td>${a.board_readcount}</td>
                          <td>${a.board_recommand}</td>
                      </tr>
                      </c:forEach>
                  </table>
              </div>
               </c:if>
              </div>
              
              <!-- 페이징 -->
             <div class="col-lg-12" style="text-align: center;"> 
                <div style="display: inline-block;">
                <c:if test="${count > 0 }">
                
                <c:set var="pageBlock" value="${5}" />
               <c:set var="imsi" value="${count % pageSize == 0 ? 0 : 1 }" />
              <c:set var="pageCount" value="${count / pageSize + imsi }" />
              
              <fmt:parseNumber var="result"
               value="${(currentPage - 1) / pageBlock}" integerOnly="true" />
               
               <c:set var="startPage" value="${result * pageBlock +1 }" />
                <c:set var="endPage" value="${startPage + pageBlock -1 }" />
                 
                 <c:if test="${endPage > pageCount }">
               <c:set var="endPage" value="${pageCount }" />
                </c:if>
                  <ul class="pagination">
                    <li class="page-item">
                    
                    <!-- 이전 버튼 -->         
                    <c:if test="${startPage > pageBlock }">           
                      <a class="page-link" href="recommand.oshi?board_type=${board_type}&find_box=${find_box}&pageNum=${startPage - pageBlock}">
                      &laquo;</a>
                      </c:if>
                    </li>
                    
                    <!-- 숫자 버튼 -->
                    <c:forEach var="i" begin="${startPage }" end="${endPage}">
                    <li class="page-item">
                      <a class="page-link" href="recommand.oshi?pageNum=${i}&find_box=${find_box}&find=${find}" >${i}</a>
                    </li>
                    </c:forEach>
                    
                    <!-- 다음 버튼 -->
                    <li class="page-item">
                    <c:if test="${endPage < pageCount }">
                      <a class="page-link" href="recommand.oshi?board_type=${board_type}&find_box=${find_box}&pageNum=${startPage + pageBlock}">&raquo;</a>
                      </c:if>
                    </li>
                  </ul>
                  </c:if>
                </div>
                
                <!-- 검색 -->
                <div>
                  <div class="form-group" style="text-align: center;">
                    <form action="recommand.oshi?board_type=${board_type }" method="post" name="find_frm">
                    <select class="custom-select" style="width: 100px;" name="find">
                      <option selected="">구분</option>
                      <option value="board_title">글제목</option>
                      <option value="board_writer">작성자</option>
                      <option value="board_content">글내용</option>
                    </select>
                    <input type="text" class="form-control" placeholder="입력" id="inputDefault" name="find_box" style="width: 300px; display: inline;">
                    <input class="btn btn-info" type="submit" value="검색">
                    </form>
                  </div>
                </div>
              </div>
              
              
              <div class="col-lg-12" style="text-align: center;">
                <span><input type="button" class="btn btn-outline-info" style="width: 150px; height: 50px;" value="글쓰기" onclick="window.location='recommandWrite.oshi'"></span>
              </div>
          </div>
          <div class="col-lg-1"></div>
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