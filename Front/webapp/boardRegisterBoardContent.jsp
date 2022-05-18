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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>${content.board_r_title }</title>
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
          <div class="col-lg-1">
          </div>
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
                  <tr>
                    <td style="text-align: center;">
	                    <c:if test="${content.board_r_approved == 0 }">
	                   	 <span style="color: red;">심사중</span>
	                    </c:if>
	                    <c:if test="${content.board_r_approved != 0}">
	                   	<span style="color: red;"> 심사완료</span>
	                    </c:if>
                    </td>
                    <td style="text-align: center;">${content.board_r_no }</td>
                    <td style="text-align: center;">게시판 개설 신청</td>
                    <td colspan="5" style="text-align: center; width:400px;">${content.board_r_title }</td>
                    <td style="text-align: center;">${content.board_r_writer } </td>
                    <td style="text-align: center;">${content.board_r_regdate }</td>
                    <td style="text-align: center;">${content.board_r_readcount }</td>
                    <td style="text-align: center;">${content.board_r_recommand }</td>
                  </tr>
                  <tr>
                    <td colspan="2" class="table-info" style="text-align: center; width:25%;">유튜버 또는 채널이름</td>
                    <td colspan="3" style="width: 25%; text-align: center;">${content.board_r_title }</td>
                    <td colspan="2" class="table-info" style="text-align: center; width: 15%;">유튜브 url</td>
                    <td colspan="6" style="width: 35%;"><a href="${content.board_r_url }">${content.board_r_url }</a></td>
                </tr>
                <tr>
                  <td colspan="3" style="text-align: center;" class="table-info">게시판 프로필 이미지</td>
                  <td colspan="9" style="text-align: center;" class="table-info">유튜버 또는 채널 소개</td>
              	</tr>
              <tr>
                  <td colspan="3" align="center"><img alt="" src="upload/${content.board_r_profile_image }" style="width:200px; height: 150px; "></td>
                  <td colspan="9" align="center"><p>${content.board_r_profile_desc }</p></td>
              </tr>
              <tr>
                  <td colspan="12" style="text-align: center;" class="table-info" align="center">개설 신청이유</td>
              </tr>
              <tr>
                  <td colspan="12" align="center">
                  	
                  	<p>${content.board_r_content }</p>
                  </td>
              </tr>
                  <tr style="border:none;">
                      <td colspan="12" style="border:none;">
                      		
                      	  <!-- <a href="#" class="btn btn-secondary"  style="width: 100px; float: left;">신고</a> -->
                      	  
                      	  <!-- 관리자 계정일 때 만 삭제,수정 버튼 활성화 -->
                      	  <c:if test="${vo.member_grade == 0 }">
                      	  <button class="btn btn-success"  style="width: 100px; float:left;" id="modBtn">수정</button>
                      	  <button class="btn btn-secondary"  style="width: 100px; float:left;" id="delBtn">삭제</button>
                      	  </c:if>
                      	  
                      	  
                      	  <a href="boardRegisterBoard.oshi" class="btn btn-warning"  style="width: 100px; float: right;">글목록</a> 
                          <button class="btn btn-info"  style="width: 100px; float:right;" id="recBtn">추천</button>
                          
                      </td>
                  </tr>
                  
                  
                  
                  
                  <c:forEach var="comment0" items="${commentsList0 }" varStatus="status">
                  <!-- 비삭제 댓글 -->
				  <c:if test="${comment0.register_b_c_step == 0 }">
                  <!-- 0차 댓글 -->
                  <tr class="table-light coment" >
                    <th scope="row">${comment0.register_b_c_member_id }</th>
                    <td colspan="7" class="forDrop">${comment0.register_b_c_content }</td>
                    <td colspan="5"  align="right">
                    <!-- 댓글 작성자일 경우 //관리자일 경우 -->
                    <c:if test="${comment0.register_b_c_member_code eq sessionScope.member_code}">
                    	<button class="commentDel btn btn-secondary">X</button>
                    </c:if>
                    ${comment0.register_b_c_regdate}</td>
                    <input type="hidden" value="${comment0.register_b_c_code }">
                  </tr>
                  </c:if>
                  <!-- end 비삭제 댓글  -->
                  
                  <!-- 삭제된 댓글 -->
                  <c:if test="${comment0.register_b_c_step != 0 }">
                  <tr class="table-light" >
                    <th scope="row"> </th>
                    <td colspan="7" class="">삭제된 댓글입니다</td>
                    <td colspan="5"  align="right">
                    <!-- 댓글 작성자일 경우 //관리자일 경우 -->
                    <c:if test="${comment0.register_b_c_member_code eq sessionScope.member_code}">
                    	<button class="commentDel btn btn-secondary">X</button>
                    </c:if>
                    </td>
                    <input type="hidden" value="${comment0.register_b_c_code }">
                  </tr>
                  </c:if>
				  <!-- end 삭제된 댓글 -->                 
                  
                  <!-- 대댓글 입력창 -->
                  	<c:if test="${sessionScope.member_code != null }">
                  	<tr style="display:none;">
                  	<form action="boardRegisterBoardContentCommentProc.oshi?board_r_no=${content.board_r_no }&board_c_depth=1&board_c_ref=${comment0.register_b_c_code}" method="post">
                    <td colspan="9" style="text-align: center;">
                      <input type="text" class="form-control" placeholder="댓글 달아봐 ㅋㅋ" name="register_b_c_content"  id="inputDefault">
                    </td>
                    <td colspan="3" style="text-align: center;">
                    	<button class="btn btn-primary" type="submit">댓글 쓰기</button>
                    </td>
                    </form>
                  	</tr>
                  	</c:if>
                  	<c:if test="${sessionScope.member_code == null }">
                  	<tr style="display:none;">
                    <td colspan="11" style="text-align: center;">
                      <input type="text" class="form-control" placeholder="댓글 달려면 로그인 하세요^^" name="register_b_c_content"  id="inputDefault">
                    </td>
                    <td colspan="1" style="text-align: center;">
                    	<button class="btn btn-primary" type="submit" disabled="disabled">댓글 쓰기</button>
                    </td>
                  	</tr>
                  	</c:if>
                  
                  
                  
                  
                  
                  
                  
                  
				  <c:forEach var="comment1" items="${commentsList1 }" varStatus="status">
				  
				  
				  
				  <!-- 1차 댓글 -->
				  <c:if test="${comment0.register_b_c_code == comment1.register_b_c_ref }">
				  
				  
				  <!-- 비삭제 댓글 -->
				  <c:if test="${comment1.register_b_c_step == 0 }">
				  <tr class="table-light cocoment">
                    <th scope="row"><img src="images/댓글.png" style="height:15px; width:15px;">${comment1.register_b_c_member_id }</th>
                    <td colspan="7">${comment1.register_b_c_content	 }</td>
                    <td colspan="5" align="right">
                    <!-- 댓글 작성자일 경우 // 관리자일 경우-->
                    <c:if test="${(comment1.register_b_c_member_code == sessionScope.member_code)  || vo.member_grade == 0}">
                    	<button class="commentDel btn btn-secondary">X</button>
                    </c:if>
                    ${comment1.register_b_c_regdate}</td>
                    <input type="hidden" value="${comment1.register_b_c_code }">
                  </tr>
                  </c:if>
				  <!-- end 비삭제 댓글 -->
				  
				  
				  
				  
				  
                  
                  
				  </c:if>
				  <!-- end 1차 댓글  -->
				  
				  
				  
				  
				  
				  
				  
				  </c:forEach>            
                  
                  
                  
                  
                  
                  
                  
                  
                  </c:forEach>
                  
                  
         
                  
                  
                  
                  
                  
                  <!-- 댓글입력 -->
                  <c:if test="${sessionScope.member_code != null }">
                  <tr>
                  	<form action="boardRegisterBoardContentCommentProc.oshi?board_r_no=${content.board_r_no }&board_c_depth=0" method="post">
                    <td colspan="9" style="text-align: center;">
                      <input type="text" class="form-control" placeholder="댓글 달아봐 ㅋㅋ" name="register_b_c_content" id="inputDefault">
                    </td>
                      <td colspan="3" style="text-align: center;"><button class="btn btn-secondary" type="submit">댓글 쓰기</button></td>
                    </form>
                  </tr>
                  </c:if>
                  <c:if test="${sessionScope.member_code == null }">
                  	<tr >
                    <td colspan="9" style="text-align: center;">
                      <input type="text" class="form-control" placeholder="댓글 달려면 로그인 하세요^^" name="register_b_c_content"  id="inputDefault">
                    </td>
                    <td colspan="3" style="text-align: center;">
                    	<button class="btn btn-secondary" type="submit" disabled="disabled">댓글 쓰기</button>
                    </td>
                  	</tr>
                  	</c:if>
                  	
              </table>
              
              
              
              <!-- 페이징 -->
			<ul class="pagination" style="  width: 300px; margin-left: auto; margin-right: auto;" >
			  <li class="page-item">
			    <a class="page-link" href="boardRegisterBoardContent.oshi?board_r_no=${board_r_no }&curPage=${blockStartNum-1 == 0 ? 1 : blockStartNum-1 }">&laquo;</a>
			  </li>
			  
			  <c:forEach var="pageNum" begin="${blockStartNum }" end="${blockEndNum }" step="1">
			  <li class="page-item">
			    <a class="page-link" href="boardRegisterBoardContent.oshi?board_r_no=${board_r_no }&curPage=${pageNum }">${pageNum }</a>
			  </li>					
			  </c:forEach>
			  
			  <li class="page-item">
			    <a class="page-link" href="boardRegisterBoardContent.oshi?board_r_no=${board_r_no }&curPage=${blockEndNum+1 > lastPageNum ? lastPageNum : blockEndNum+1 }">&raquo;</a>
			  </li>
			</ul>
			<!-- end 페이징  --> 
              
               
              
              
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
  /* Jquery */
  $(function(){
	  
	  //댓글 depth 0인 애들은 클릭시 대댓글 창이 생성됨
	  $(".forDrop").click(function () {
		
		  var target = $(this).parent().next();
		  
		  if (target.css('display') === "none") {
			target.show();
		  }else {
			target.hide();
	      }
		  
		  
		  
	  });
	  
	  //추천 기능
	  $("#recBtn").click(function(){
			  
	  	var recChk = confirm("추천은 아이디 당 1번만 가능합니다");
	  
	  	var board_r_no = "${board_r_no }";
	  	if(recChk){
	  		location.href="boardRegisterBoardRecommendProc.oshi?board_r_no=" + board_r_no;
	  	}
	  	
	  	
	  
 	  });
	  
	  
	  //삭제 기능
	  $("#delBtn").click(function(){
			  
	  	var delChk = confirm("삭제 넣을게~");
	  
	  	var board_r_no = "${board_r_no }";
	  	if(delChk){
	  		location.href="boardRegisterBoardDeleteProc.oshi?board_r_no=" + board_r_no;
	  	}
	  	
	  	
	  
 	  });
	  
	  
	  //수정 기능
	  $("#modBtn").click(function(){
			  
	  	
	  	location.href="boardRegisterBoardModify.oshi?board_r_no=" + ${board_r_no };
	  	
	  	
	  	
	  
 	  });
	  
	  
	  //댓글 삭제
	  $(".commentDel").click(function(){
		//삭제할 댓글 코드
		var code = $(this).parent().next()[0].value;
		
		var delChk = confirm("진짜 삭제함?");
		if(delChk)
			location.href="boardRegisterBoardContentCommentDeleteProc.oshi?register_b_c_code=" + code + "&board_r_no=${board_r_no }";
		
		  
	  });
	  
	  
  });
  
  </script>
  
</html>