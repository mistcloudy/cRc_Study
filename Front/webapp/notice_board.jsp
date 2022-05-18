<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=utf-8");
%>

<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <c:set var="i" value="${info }"/>
    <title>공지사항</title>
    
<script type="text/javascript">
function check() {
   if(document.find_frm.find_box.value==""){
      alert("검색어를 입력해주세요.");
      return false;
   }
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
			  <!-- 게시판 글 목록 -->
          		<div style="margin-top:20px">
                  <table class="table table-bordered">
                      <tr class="table-info">
                          <th style="text-align: center;">글번호</th>
                          <th style="text-align: center;">말머리</th>
                          <th colspan="5" style="text-align: center;">제목</th>
                          <th style="text-align: center;">글쓴이</th>
                          <th style="text-align: center;">작성일자</th>
                          <th style="text-align: center;">조회수</th>
                      </tr>
                      
                      <!-- 검색 결과가 없을 때 -->
                      <c:if test="${count == 0 }">
                      <tr class="table-active">
                          <td>COUNT = ${count }</td>
                          <td>결과가 없습니다.</td>
                          <td></td>
                      </tr>
              			</c:if>
              			<c:if test="${count > 0 }">
                       <c:forEach var="a" items="${articleList}">
                      <tr>
                          <td>${a.board_no}</td>
                          <td>${a.board_category}</td>
                          <td colspan="5"><a href="NoticeRead.oshi?board_type=${a.board_type}&board_no=${a.board_no}" style="text-decoration: none">${a.board_title}</a></td>
                          <td>${a.board_writer}</td>
                          <td>${a.board_regdate}</td>
                          <td>${a.board_readcount}</td>
                      </tr>
                      </c:forEach>
                       </c:if>
                  </table>
              </div>
              
              </div>
              <div class="col-lg-12" style="text-align: center;">
              
              <!-- 페이징 -->
                <div style="display: inline-block;">
                <c:if test="${count > 0 }">
                
                <c:set var="pageBlock" value="${5}" />
               <c:set var="imsi" value="${count % pageSize == 0 ? 0 : 1 }" />
              <c:set var="pageCount" value="${count / pageSize + imsi }" />
              
              <fmt:parseNumber var="result"
               value="${(currentPage - 1) / pageBlock }" integerOnly="true" />
               
               <c:set var="startPage" value="${result * pageBlock +1 }" />
                <c:set var="endPage" value="${startPage + pageBlock -1 }" />
                 
                 <c:if test="${endPage > pageCount }">
               <c:set var="endPage" value="${pageCount }" />
                </c:if>
                  <ul class="pagination">
                    <li class="page-item">
                    
                    <!-- 이전 버튼 -->         
                    <c:if test="${startPage > pageBlock }">           
                      <a class="page-link" href="NoticeList.oshi?board_type=B00&find_box=${find_box}&find=${find}&pageNum=${startPage - pageBlock}">
                      &laquo;</a>
                      </c:if>
                    </li>
                    
                    <!-- 숫자 버튼 -->
                    <c:forEach var="i" begin="${startPage }" end="${endPage}">
                    <li class="page-item">
                      <a class="page-link" href="NoticeList.oshi?board_type=B00&find_box=${find_box}&find=${find}&pageNum=${i}" >${i}</a>
                    </li>
                    </c:forEach>
                    
                    <!-- 다음 버튼 -->
                    <li class="page-item">
                    <c:if test="${endPage < pageCount }">
                      <a class="page-link" href="NoticeList.oshi?board_type=B00&find_box=${find_box}&find=${find}&pageNum=${startPage + pageBlock}">&raquo;</a>
                      </c:if>
                    </li>
                  </ul>
                  </c:if>
                </div>
                
                
                
                <!-- 검색 -->
                <div>
                  <div class="form-group" style="text-align: center;">
                  <form action="" method="post" name="i_frm">
                   <input type="hidden" name="find_box" value="${find_box }">
                 <input type="hidden" name="find" value="${find }">
                    </form>
                    <form action="NoticeList.oshi?board_type=B00" method="post" name="find_frm"
                     onsubmit="return check()">
                    <select class="custom-select" style="width: 100px;" name="find">
                     	<option value="board_title">글제목</option>
                      <option value="board_writer">작성자</option>
                      <option value="board_content">글내용</option>
                    </select>
                    <input type="text" class="form-control" placeholder="입력" id="inputDefault" name="find_box" style="width: 300px; display: inline;">
                    <button class="btn btn-info">검색</button>
                    </form>
                  </div>
                </div>
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
  </body>
  <script type="text/javascript">

// 검색어 입력이 없으면
function check() {
   if(document.find_frm.find_box.value==""){
      alert("검색어를 입력해주세요.");
      return false;
   }
}
</script>
</html>