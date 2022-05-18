<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <title>회원가입</title>
  </head>
  <body>
      <div class="container">

            <div class="row">

                <div class="col-lg-4" style="margin-top: 80px;">
                  <b>유저1</b>님 환영합니다
                </div>
                <div class="col-lg-4" style="text-align: center;">
                  <a href="#"><img src="images/oshi1.png" style="height: 200px; width:300px;"></a>
                </div>
                <div class="col-lg-2">
                  <div class="form-group">
                    <input class="form-control form-control-sm" type="text" placeholder="id" id="inputSmall" style="margin-top: 80px;">
                    <input class="form-control form-control-sm" type="text" placeholder="password" id="inputSmall" style="margin:1px;">
                  </div>
                </div>
                <div class="col-lg-2">
                  <button type="button" class="btn btn-primary btn-sm" style="margin-top: 80px; width:80px">로그인</button><br>
                  <button type="button" class="btn btn-primary btn-sm" style="margin:1px; width:80px">회원가입</button>
                </div>
                </div>

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
        <form action="registerProc.oshi" method="post">
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
            <button type="submit" class="btn btn-primary" style="width:100px; ">회원가입</button>
            <button type="reset" class="btn btn-primary" style="width:100px;">취소</button>
            </div>
          </fieldset>
          <input type="hidden" name="member_grade" value="1">
        </form>
      </div>
      <div class="col-lg-3">
        <input type="button" class="btn btn-primary" onclick="" value="중복확인" style="margin-top: 75px;">
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