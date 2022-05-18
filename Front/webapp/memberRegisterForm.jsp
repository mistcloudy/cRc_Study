<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=utf-8");
%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <title>회원 가입</title>
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
        <div class="col-lg-3"></div>
        <div class="col-lg-6">
        <form action="memberRegisterProc.oshi" method="post" name="memberForm">
          <fieldset>
            <legend style="text-align: center;">회원가입</legend>
            <div class="form-group">
              <label for="exampleInputId">아이디</label>
              <input type="text" name="member_id" class="form-control" id="exampleInputId" placeholder="Enter ID">
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">비밀번호</label>
              <input type="password" name="member_password" class="form-control" id="exampleInputPassword" placeholder="Enter Password">
            </div>
            <div class="form-group">
              <label for="exampleInputNickname">닉네임</label>
              <input type="text" name="member_nickname" class="form-control" id="exampleInputNickname" placeholder="Enter Nickname">
            </div>
            <div class="form-group">
              <label for="exampleInputEmail1">Email</label>
              <input type="email" name="member_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
            </div>
            <div style="text-align: center;">
            <button type="button" class="btn btn-primary" style="width:100px;" onclick="inputCheck()">회원가입</button>
            <button type="reset" class="btn btn-primary" style="width:100px;">취소</button>
            </div>
          </fieldset>
          <input type="hidden" name="member_grade" value="1">
        </form>
      </div>
      <div class="col-lg-3">
        <input type="button" id="duplicateCheck" class="btn btn-primary" onclick="" value="중복확인" style="margin-top: 75px;">
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
  <script type="text/javascript" src="js/member.js" charset="utf-8"></script>
  <script type="text/javascript">
  
  let idChk = false;
  
  
  function inputCheck() {
		
		if(document.memberForm.member_id.value==""){
			alert("아이디를 입력해주세요");
			document.memberForm.member_id.focus();
			return ;
		}
		
		if(document.memberForm.member_password.value==""){
			alert("비밀번호를 입력해 주세요.");
			document.memberForm.member_password.focus();
			return ;
		}
		
		if(document.memberForm.member_nickname.value==""){
			alert("닉네임을 확인해 주세요.");
			document.memberForm.member_nickname.focus();
			return ;
		}
		
		if(document.memberForm.member_email.value==""){
			alert("이메일을 입력해 주세요.");
			document.memberForm.member_email.focus();
			return ;
		}
		

	   if (idChk) {
		   document.memberForm.submit();
	   }else{
		   alert("아이디 중복체크를 해주세요");
	   }
	  
	}
  
  
  
  
  
  
	$(document).ready(function(){
		
		
		
	    $('#duplicateCheck').click(function(){
	    	// 입력한 id 값
	    	var id = $('#exampleInputId')[0].value;
	    	
	    	$.ajax({
	    		type: 'GET', //요청 메소드 방식
	    		url:'/Oshi/duplicateCheckAJAX.jsp',
	    		dataType:'text', //서버가 요청 URL을 통해서 응답하는 내용의 타입
	    		data:{id:id},
	    		success : function(result){
	    			var ans = result.trim();
	    			
	    			//중복일 경우 (쿼리문결과가 1)
	    			if (ans > 0) {
						alert("중복된 아이디입니다.\n다른 아이디를 사용해주세요");
						idChk= false;
					}else{//중복이 아닐경우
						alert("사용가능한 아이디입니다.");
						idChk = true;
					}
	    			
	    		},
	    		error : function(a, b, c){
	    			//통신 실패시 발생하는 함수(콜백)
	    			alert(a + b + c);
	    		}
	    	});
	    	
	    	return false;
	    	
	    	
	    });
	});


  </script>
</html>