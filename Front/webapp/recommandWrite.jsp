<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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

    <title>글 쓰기</title>
<script type="text/javascript">
function writeSave() {
	if(document.writeForm.singer.value==""){
		alert("!!가수를 입력하세요!!");
		document.writeForm.singer.focus();
		return false;
	}
	if(document.writeForm.title.value==""){
		alert("!!곡명을 입력하세요!!");
		document.writeForm.title.focus();
		return false;
	}
	if(document.writeForm.url.value==""){
		alert("!!유튜브 url을 입력하세요!!");
		document.writeForm.url.focus();
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
        <div class="row" style="margin-top: 50px;">
        <div class="col-lg-1"></div>
        <div class="col-lg-10">
          <div class="col-lg-10 col-md-10">
            <div>
                <form action="recommandWriteProc.oshi" method="post" name="writeForm" onsubmit="return writeSave()">
                <table class="table table-bordered">
                    <tr>
                      <th class="table-info" style="width:80px;">
                        <select class="btn-info" name="board_category">
                        <c:if test="${vo.member_grade == 0}">
                          <option value="BC05">곡추천</option>
                          <option value="BC01" selected>공지</option>
                        </c:if>
                        <c:if test="${vo.member_grade != 0}">
                          <option value="BC05" selected>곡추천</option>
                        </c:if>
                        </select>
                      </th>
                        <th class="table-info" style="text-align: center; width:100px;">가수명</th>
                        <th colspan="3" style="text-align: center; vertical-align: middle;"><input type="text" size="30" name="singer"></th>
                        <th colspan="3" class="table-info" style="text-align: center; width:100px;">곡명</th>
                      	<th colspan="3" style="text-align: center; vertical-align: middle;"><input type="text" size="68" name="title"></th>
                    </tr>
                    <tr>
                        <td class="table-info" colspan="2" style="text-align: center;">유튜브 url</td>
                        <td colspan="9" style="text-align: center; vertical-align: middle;" ><input type="text" size="120" name="url_path"></td>
                    </tr>
                    <tr class="table-info">
                        <td colspan="11" style="text-align: center;">곡소개 및 추천이유</td>
                    </tr>
                    <tr>
                        <td colspan="11"><textarea name="board_content" cols="150" rows="15"></textarea></td>
                    </tr>
                    
                 	 <tr>
                  		<td colspan="11">
                	  		<input type="submit" class="btn btn-outline-info" value="글쓰기" style="width: 100px;">
            		 		<input type="reset" class="btn btn-outline-info" value="글취소" style="width: 100px;">
           			  		<input type="button" class="btn btn-outline-info" value="목록" style="width: 100px;" onclick="window.location='recommand.oshi'">
                  		</td>
              	    </tr>
                </table>
                </form>   
            </div>
            <div class="col-lg-12">
              
          </div>
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