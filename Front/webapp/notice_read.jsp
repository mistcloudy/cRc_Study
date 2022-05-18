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


    <title>${article.board_title}</title>
    <script type="text/javascript">
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
                            
            <div style="margin-top: 20px;">
                <table class="table table-bordered">
                    <tr class="table-info">
                        <th style="text-align: center;">글번호</th>
                        <th style="text-align: center;">말머리</th>
                        <th colspan="5" style="text-align: center;">제목</th>
                        <th style="text-align: center;">글쓴이</th>
                        <th style="text-align: center;">작성일자</th>
                        <th style="text-align: center;">조회수</th>
                    </tr>
                    <tr>
                        <td style="text-align: center;">${article.board_no}</td>
                        <td style="text-align: center;">${article.board_category}</td>
                        <td colspan="5" style="text-align: center;">${article.board_title}</td>
                        <td style="text-align: center;">${article.board_writer}</td>
                        <td style="text-align: center;">${article.board_regdate}</td>
                        <td style="text-align: center;">${article.board_readcount}</td>
                    </tr>
                    <tr>
                        <td colspan="11" style="height: 500px;">
                             ${article.board_content}
                        </td>
                    </tr>
                    <tr style="border:none;">
                        <td colspan="11" style="border:none;">
                        <span class="rec_count"></span>
                        
                        </td>
                    </tr>
                   <%--  <c:forEach var="a" items="${abcList}">
                    <c:if test="${a.comments_step == 1}">
                    <tr class="table-light">
                      <td scope="row">${a.comments_writer }</td>
                      <td colspan="10">${a.comments_content }</td>
                    </tr>
                    </c:if>
                    <c:if test="${a.comments_step > 1}">
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
                    </c:forEach>
                    <tr>
                      <td colspan="10" style="text-align: center;">
                        <input type="text" class="form-control" placeholder="Default input" id="inputDefault">
                      </td>
                        <td colspan="1" style="text-align: center;"><button class="btn btn-primary" type="submit">댓글 쓰기</button></td>
                    </tr> --%>
                </table>
            </div>
           <c:set var="i" value="${info }"/>
            <div class="col-lg-12">
            <c:if test="${i.board_t_manager == vo.member_code }">
                <a href="" class="btn btn-outline-info" style="width: 100px;">글 삭제</a>
                <a href="update.oshi?board_type=${article.board_type}&board_no=${article.board_no}" class="btn btn-outline-info" style="width: 100px;">글 수정</a>
            </c:if>
                <a href="NoticeList.oshi" class="btn btn-outline-info"  style="width: 100px;">글 목록</a>
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