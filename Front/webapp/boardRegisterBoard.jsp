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
    <title>게시판 개설 신청 목록</title>
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
                          <th style="text-align: center;">상태</th>
                          <th style="text-align: center;">글번호</th>
                          <th style="text-align: center;">말머리</th>
                          <th colspan="5" style="text-align: center;">제목</th>
                          <th style="text-align: center;">글쓴이</th>
                          <th style="text-align: center;">작성일자</th>
                          <th style="text-align: center;">조회수</th>
                          <th style="text-align: center;">추천수</th>
                      </tr>
                      
                    <!-- 공지 파트 -->  
                    
                    <c:forEach var="i" items="${announceList }">
                    <tr class="table-active">
                        <td style="text-align: center;"></td>
                        <td>${i.board_r_no }</td>
                        
                        <td>운영</td>
                        <td colspan="5"><a href="boardRegisterBoardContent.oshi?board_r_no=${i.board_r_no }">${i.board_r_title}</a></td>
                        <td>운영자</td>
                        <td>${i.board_r_regdate }</td>
                        <td>${i.board_r_readcount }</td>
                        <td>${i.board_r_recommand }</td>
                    </tr>
                    </c:forEach>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    <!-- 일반 글 파트 -->
                    
                    
                    <c:forEach var="i" items="${arrList }">
                    <!-- 심사중인 글만 표시 -->
                    
                    <tr>
                    	<c:if test="${i.board_r_announce == 0 }">
                    	<c:if test="${i.board_r_approved == 0 }">
                        <td style="text-align: center;">
                        	<span style="color: red;">
                        			<%-- <img alt="" src="/Oshi/upload/${i.board_r_profile_image }"> --%>
                        			<%-- <a href="/Oshi/upload/${i.board_r_profile_image }">이미지확인</a> --%>
                        			심사중
                        	</span>
                        </td>
                        </c:if>
                        <c:if test="${i.board_r_approved == 1 }">
                        <td style="text-align: center;">
                        	<span style="color: blue;">
                        			<%-- <img alt="" src="/Oshi/upload/${i.board_r_profile_image }"> --%>
                        			<%-- <a href="/Oshi/upload/${i.board_r_profile_image }">이미지확인</a> --%>
                        			승인
                        	</span>
                        </td>
                        </c:if>
                        
                        <c:if test="${i.board_r_approved == 2 }">
                        <td style="text-align: center;">
                        	<span style="color: blue;">
                        			<%-- <img alt="" src="/Oshi/upload/${i.board_r_profile_image }"> --%>
                        			<%-- <a href="/Oshi/upload/${i.board_r_profile_image }">이미지확인</a> --%>
                        			각하
                        	</span>
                        </td>
                        </c:if>
                        </c:if>
                        <td>${i.board_r_no }</td>
                        <td>게시판 신청</td>
                        <td colspan="5"><a href="boardRegisterBoardContent.oshi?board_r_no=${i.board_r_no }">${i.board_r_title}</a></td>
                        <td>${i.board_r_writer }</td>
                        <td>${i.board_r_regdate }</td>
                        <td>${i.board_r_readcount }</td>
                        <td>${i.board_r_recommand }</td>
                    </tr>
                    </c:forEach>
                    
                  </table>
              </div>
              <div class="col-lg-1"></div>
            </div>
          </div>
              <div class="col-lg-12" style="text-align: center;">
                <div style="display: inline-block;">
                
                <!-- 페이징 -->
                  <ul class="pagination">
                    <li class="page-item">
                      <a class="page-link" href="boardRegisterBoard.oshi?curPage=${blockStartNum-1 == 0 ? 1 : blockStartNum-1 }&tag=${param.tag == null ? dummy : param.tag }&kwd=${param.kwd }">&laquo;</a>
                    </li>
                    
                    <c:forEach var="pageNum" begin="${blockStartNum }" end="${blockEndNum }" step="1">
                    <li class="page-item">
                      <a class="page-link" href="boardRegisterBoard.oshi?curPage=${pageNum }&tag=${param.tag == null ? dummy : param.tag  }&kwd=${param.kwd }">${pageNum }</a>
                    </li>
                    </c:forEach>
                    
                    <li class="page-item">
                      <a class="page-link" href="boardRegisterBoard.oshi?curPage=${blockEndNum+1 > lastPageNum ? lastPageNum : blockEndNum+1 }&tag=${param.tag == null ? dummy : param.tag  }&kwd=${param.kwd }">&raquo;</a>
                    </li>
                  </ul>
                <!-- end 페이징  -->  
                  
                  
                </div>
                <div>
                
                  <form action="boardRegisterBoard.oshi" method="get">
                  <div class="form-group" style="text-align: center;">
                    <select class="custom-select" style="width: 100px;" name="tag">
                      <option value="member_id">작성자</option>
                      <option value="board_r_content">글내용</option>
                      <option value="board_r_title">글제목</option>
                    </select>
                    <input type="text" class="form-control" placeholder="입력" id="inputDefault" name ="kwd"style="width: 300px; display: inline;">
                    <button class="btn btn-info">검색</button>
                  </div>
                  </form>
                </div>
              </div>
              <div class="container">
                <div class="row">
                  <div class="col-lg-1"></div>
                  <div class="col-lg-10" style="text-align: right;">
                    <c:if test="${vo.member_code != null }">
                    <a href="boardRegisterBoardForm.oshi" class="btn btn-outline-info" style="width: 150px; text-align:center; vertical-align:middle">게시판 개설 신청</a>
                    </c:if>
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
</html>