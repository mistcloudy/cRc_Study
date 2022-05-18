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

    <title>수정하기</title>
    <script type="text/javascript">
    function writeSave() {
    	
	
    	if(document.writeForm.subject.value==""){
    		alert("제목을 입력해라!!!");
    		document.writeForm.subject.focus();
    		return false;
    	}
    	
    	if(document.writeForm.content.value==""){
    		alert("내용을 입력해라!!!");
    		document.writeForm.content.focus();
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
                  <a href="#"><img src="images/oshi1.png" style="height: 200px; width:300px;"></a>
                </div>
                <c:if test="${vo.member_code == null }">
                <div class="col-lg-2">
                <form action="loginProc.oshi" method="post">
                  <div class="form-group">
                    <input class="form-control form-control-sm" type="text" placeholder="id" id="member_id" style="margin-top: 80px;">
                    <input class="form-control form-control-sm" type="text" placeholder="password" id="member_password" style="margin:1px;">
                  </div>
                </div>
                <div class="col-lg-2">
                  <button type="submit" class="btn btn-primary btn-sm" style="margin-top: 80px; width:80px" >로그인</button><br>
                   <a href="memberRegister.oshi" type="button" class="btn btn-primary btn-sm" style="margin:1px; width:80px">회원가입</a>
                </div>
                </div>
                </form>
                   </c:if>
                   <input type="hidden" name="board_type">
                    <input type="hidden" name="board_announce">
                   
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
            
            
          <div class="col-lg-10">
            <form action="updateProc.oshi?board_type=${board_type}&board_no=${board_no}&board_category=${board_category}&member_code=${sessionScope.member_code}" method="post" name="writeForm" onsubmit="return writeSave()">                
            <div style="margin-top: 20px;">
                <table class="table table-bordered">
                    <tr class="table-info">
                        <th>
                            <select class="btn-info" name="board_category">
                            
                              <option value="${param.board_category }" selected>잡담</option>
                              <option value="${param.board_category }">이벤트</option>
                              <option value="${param.board_category}">공지</option>
                            </select>
                        </th>
                        <th colspan="10" style="text-align: center; vertical-align: middle;"><input type="text" size="130" name="Board_title" value="${a.board_title }"></th>
                    </tr>
                    <tr>
                      <td colspan="11"><textarea name="Board_content" id="" cols="150" rows="30">${a.board_content }</textarea></td>
                  </tr>
                  <tr>
                      <td colspan="11">
                        <div class="form-group">
                        <div class="input-group mb-3">
                          <div class="custom-file">
                            <input type="file" class="custom-file-input" id="inputGroupFile02">
                            <label class="custom-file-label" for="inputGroupFile02">Choose file</label>
                          </div>
                          <div class="input-group-append">
                            <span class="input-group-text">Upload</span>
                          </div>
                        </div>
                      </div>
                    </td>
                  </tr>
                </table>
            </div>
            
            <div class="col-lg-12">
                <input type="submit" class="btn btn-outline-info" value="글수정" style="width: 100px;">
                <input type="reset" class="btn btn-outline-info" value="글취소" style="width: 100px;">
                <input type="button" class="btn btn-outline-info" value="목록" style="width: 100px;" onclick="window.location='/jaewan/individual_board.oshi'">
            </div>
        </div>
         
          </div>
         </form>
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