<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="main.oshi">Oshi Home으로</a>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">게시판 개설 신청</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                                	掲示板
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                	게시판 개설 신청 리스트
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
				                    <tr class="table-info">
				                        <th style="text-align: center;">상태</th>
				                        <th style="text-align: center;">글번호</th>
				                        <th style="text-align: center;">말머리</th>
				                        <th colspan="5" style="text-align: center;">게시판 이름</th>
				                        <th style="text-align: center;">신청자</th>
				                        <th style="text-align: center;">신청일자</th>
				                        <th style="text-align: center;">승인/각하</th>
				                        <th style="text-align: center;">신청 삭제</th>
				                    </tr>
                                    </thead>
                                    <!-- <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </tfoot> -->
                                    <tbody>
                                    	<!-- 일반 글 파트 -->
					                    <c:forEach var="i" items="${arrList }">
					                    <tr>
					                    	<c:if test="${i.board_r_announce == 0 }">
					                        <td style="text-align: center;">
					                        	<span style="color: red;">
					                        			<%-- <img alt="" src="/Oshi/upload/${i.board_r_profile_image }"> --%>
					                        			<%-- <a href="/Oshi/upload/${i.board_r_profile_image }">이미지확인</a> --%>
					                        			심사중
					                        	</span>
					                        </td>
					                        </c:if>
					                        <c:if test="${i.board_r_announce != 0 }">
					                        	<td style="text-align: center;">
					                        	<span style="color: red;">
					                        			심사완료
					                        	</span>
					                        </td>
					                        </c:if>
					                        <td>${i.board_r_no }</td>
					                        <td>게시판 신청</td>
					                        <td colspan="5"><a href="boardRegisterBoardContent.oshi?board_r_no=${i.board_r_no }">${i.board_r_title}</a></td>
					                        <td>${i.board_r_writer }</td>
					                        <td>${i.board_r_regdate }</td>
					                        <td style="text-align: center;">
					                        <!-- 미심사 상태라면  -->
					                        <c:if test="${i.board_r_approved == 0 }">
					                        	<a href="adminBoardRegisterProc.oshi?board_r_no=${i.board_r_no }&board_r_approved=1" class="btn btn-success" style="width:90px;">승인</a>
					                        	<a href="adminBoardRegisterProc.oshi?board_r_no=${i.board_r_no }&board_r_approved=2" class="btn btn-danger" style="width:90px;">각하</a>
					                        </c:if>
					                        
					                        <!-- 승인 상태라면 -->
					                        <c:if test="${i.board_r_approved == 1 }">
					                        	<span style="color: blue;">승인</span>
					                        </c:if>
					                        
					                         <!-- 각하 상태라면 -->
					                        <c:if test="${i.board_r_approved == 2 }">
					                        	<span style="color: red;">거부</span>
					                        </c:if>
					                        </td>
					                        <td style="text-align: center;"><a href="boardRegisterBoardDeleteProc.oshi?board_r_no=${i.board_r_no }&chkPage=1" class="btn btn-danger">X</a></td>
					                    </tr>
					                    </c:forEach>
                                        
                                    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
    