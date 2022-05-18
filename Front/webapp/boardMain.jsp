<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <title>게시판 목록</title>
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
              <table class="table table-hover">
              	<c:forEach var="board1" items="${boardTypeList}" varStatus="status">
              		<c:if test="${status.index==0}">
                <tr class="table-warning">
                  <td style="text-align: center; width: 110px;"><img src="images/goldmedal.jpg" alt="" style="height: 100px; width: 100px;"></td>
                  <td style="text-align: center; width: 110px;"><img src="upload/${board1.board_t_image}" alt="" style="height: 100px; width: 100px;"></td>
                  <td style="text-align: center; line-height: 100px; font-size:18px;"><a href="individual_board.oshi?board_type=${board1.board_t_code }" style="color:white; text-decoration:none; font-color:white;">${board1.board_t_name}</a></td>
                  <td style="text-align: center; line-height: 100px;">즐겨찾기수 : ${board1.board_t_count}</td>
                </tr>
                	</c:if>
                	<c:if test="${status.index==1}">
                <tr class="table-active">
                  <td style="text-align: center; width: 110px;"><img src="images/silvermedal.jpg" alt="" style="height: 100px; width: 100px;"></td>
                  <td style="text-align: center; width: 110px;""><img src="upload/${board1.board_t_image}" alt="" style="height: 100px; width: 100px;"></td>
                  <td style="text-align: center; line-height: 100px; font-size:18px;"><a href="individual_board.oshi?board_type=${board1.board_t_code }"" style="color:white; text-decoration:none; font-color:white;">${board1.board_t_name}</a></td>
                  <td style="text-align: center; line-height: 100px; color:white;">즐겨찾기수 : ${board1.board_t_count}</td>
                </tr>
                	</c:if>
                	<c:if test="${status.index==2}">
                <tr class="table-danger">
                  <td style="text-align: center; width: 110px;"><img src="images/bronzemedal.jpg" alt="" style="height: 100px; width: 100px;"></td>
                  <td style="text-align: center; width: 110px;""><img src="upload/${board1.board_t_image}" alt="" style="height: 100px; width: 100px;"></td>
                  <td style="text-align: center; line-height: 100px; font-size:18px;"><a href="individual_board.oshi?board_type=${board1.board_t_code }" style="color:white;text-decoration:none; font-color:white;">${board1.board_t_name}</a></td>
                  <td style="text-align: center; line-height: 100px;">즐겨찾기수 : ${board1.board_t_count}</td>
                </tr>
                	</c:if>
                </c:forEach>
              </table>
              <table class="table table-hover">
              <c:forEach var="board2" items="${boardTypeList2}" begin="0" step="1" varStatus="status">
              		<c:if test="${(status.count%3)==1}">
              			<tr>
              			<td style="width:70px; text-align: center;"><a href="individual_board.oshi?board_type=${board2.board_t_code }">${board2.board_t_name}</a>&nbsp;</td>
                  		<td style="width:70px; text-align: center;">${board2.board_t_count}</td>
              		</c:if>
              		<c:if test="${(status.count%3)==2}">
              			<td style="width:70px; text-align: center;"><a href="individual_board.oshi?board_type=${board2.board_t_code }">${board2.board_t_name}</a>&nbsp;</td>
                  		<td style="width:70px; text-align: center;">${board2.board_t_count}</td>
              		</c:if>
              		<c:if test="${(status.count%3)==0}">
              			<td style="width:70px; text-align: center;"><a href="individual_board.oshi?board_type=${board2.board_t_code }">${board2.board_t_name}</a>&nbsp;</td>
                  		<td style="width:70px; text-align: center;">${board2.board_t_count}</td>
                  		</tr>
              		</c:if>
              </c:forEach>
              </table>
            </div>
        <div class="col-lg-6" style="margin: 20px 0px;">
          <div class="card border-success mb-3" style="width:100%;height:50%;overflow: auto;">
            <div class="card-header" style="text-align:center;"><b>나의 즐겨찾기</b></div>
            <div class="card-body">
              <table class="table table-hover">
               <!-- 로그인 시 -->
                  <c:if test="${vo.member_code != null }">
                <thead>
                  <tr class="table-primary">
                    <th scope="col" colspan="3" style="text-align: center;">가수명</th>
                    <th scope="col" style="text-align: center;">즐겨찾기 수</th>
                    <th scope="col" style="text-align: center;">즐겨찾기 취소</th>
                  </tr>
                </thead>
                <tbody>
               	  <c:forEach var="fav" items="${favList }">
                  <tr class="table-light">
                    <th scope="row" colspan="3" style="text-align: center;"><a href="individual_board.oshi?board_type=${fav.board_t_code }">${fav.board_t_name }</a></th>
                    <td style="text-align: center;">${fav.board_t_count }</td>
                    <td style="text-align: center;"><a href="deleteFav.oshi?member_code=${sessionScope.member_code}&board_t_code=${fav.board_t_code}" class="btn btn-danger">X</a></td>
                  </tr>
                  </c:forEach>
                  
                  </c:if>
                  <!-- 비로그인 시 -->
                  <c:if test="${vo.member_code == null }">
                   <tr class="table-light">
                    <th scope="row" colspan="3" style="text-align: center;" colspan="2">로그인 해주세요</th>
                  </tr>
                  </c:if>
                </tbody>
              </table>
            </div>
            </div>
            
            <!-- 로그인했고 관리자인 경우에만 표시 -->
            <c:if test="${sessionScope.member_code != null && managerList != null}">
            <div class="card border-success mb-3" style="width:100%;height:50%; overflow: auto;">
              <div class="card-header" style="text-align:center;"><b>내가 관리하는 게시판</b></div>
              <div class="card-body">
                <table class="table table-hover" >
                  <thead>
                    <tr class="table-primary">
                      <th scope="col" colspan="3" style="text-align: center;">가수명</th>
                      <th scope="col" style="text-align: center;">즐겨찾기 수</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  	<c:forEach var="manager" items="${managerList}">
                    <tr class="table-light">
                      <th scope="row" colspan="3" style="text-align: center;"><a href="individual_board.oshi?board_type=${manager.board_t_code }">${manager.board_t_name }</a></th>
                      <td style="text-align: center;">${manager.board_t_count }</td>
                    </tr>
                    </c:forEach>
                   
                  </tbody>
                </table>
              </div>
              </div>
           </c:if>   
              
              
              
              
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