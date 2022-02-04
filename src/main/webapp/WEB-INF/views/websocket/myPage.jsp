<%@ page import = "java.lang.String.*"%>
<%@page import="java.util.Calendar"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script src="../resources/vendor/jquery/jquery.min.js"></script>
<script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="../resources/js/sb-admin-2.min.js"></script>
<!-- Page level plugins -->
<style>
/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
padding-top: 1em;
padding-left: 1em;
padding-right: 1em;
}
</style>

<title>마이 페이지</title>
</head>
<body>
<body id="page-top">
<input type = "hidden" id = "startpage" value="${startpage }">
<input type = "hidden" id = "roomId" value="${roomId }">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="rooms">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">회원 페이지</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>회원 정보 수정</span>
                </a>
                <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">회원 정보 수정하기</h6>
                        <a class="collapse-item" href="/login/checkpasswordView?startpage=${startpage }&roomId=${roomId}">회원 정보 수정</a>
                        <a class="collapse-item" href="/login/updatepasswordView?startpage=${startpage}&roomId=${roomId}">비밀번호 수정</a>
                        <a class="collapse-item" href="/login/deletememberView?startpage=${startpage}&roomId=${roomId}">회원 탈퇴</a>
                    </div>
                </div>
                <hr class="sidebar-divider">
            </li>

           

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

 			<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">                                
                                <span class="mr-2 d-none d-lg-inline text-gray-700 small">${mberName }</span>
                                <img class="img-profile rounded-circle"
                                    src="../resources/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="/websocket/mypage">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    	마이페이지
                                </a>
                                <div class="dropdown-divider"></div>
                                <button class="btn btn-danger btn-user btn-block" onclick="fnlogout('${mberId}')">로그아웃</button>
                            </div>
                        </li>
						
                    </ul>
                    <div class="col-sm-2">
                    	<c:if test = "${startpage eq 'rooms' }">
						<button class="btn btn-info btn-user btn-block" onclick="location.href='/websocket/rooms';">돌아가기</button>
						</c:if>
						<c:if test = "${startpage eq 'room' }">
						<button class="btn btn-info btn-user btn-block" onclick="location.href='/websocket/room?id=${roomId}';">돌아가기</button>
						</c:if>
						<c:if test = "${startpage eq 'newroom' }">
						<button class="btn btn-info btn-user btn-block" onclick="location.href='/websocket/new';">돌아가기</button>
						</c:if>
					</div>
					<div class="col-sm-2">
						<button class="btn btn-danger btn-user btn-block" onclick="fnlogout('${mberId}')">로그아웃</button>
					</div>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                   

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-lg font-weight-bold text-primary text-uppercase mb-3">
                                                	${nowmonth }월 가장 자주 먹은 음식 </div>
                                                	
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${storeName} 에서<hr>${famenu} ${menucount }번</div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-lg font-weight-bold text-success text-uppercase mb-3">
                                                	${nowmonth }월 식사 비용</div>
                                            <div class="h1 mb-4 font-weight-bold text-gray-800"> <fmt:formatNumber value="${monthprice}" pattern="#,###"/>원 </div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-lg font-weight-bold text-warning text-uppercase mb-3">
                                                	${nowmonth }월 점심 식사 비용 평균</div>
                                            <div class="h1 mb-4 font-weight-bold text-gray-800"><fmt:formatNumber value="${avgPrice}" pattern="#,###"/>원</div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                    </div>

                    <!-- Content Row -->

                    <div class="row" id = "monthList">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">식사 내역</h6>
                                    <div class = "form-group row ">
	                                    <div class = "col-sm-8 mb-3 mb-sm-0">
		                                    <select class="form-control form-control-user" id="monthselect" name="month">
		                                    	<!-- <option value ="${nowmonth}">${nowmonth }월</option> -->
			                                    <option value="1">1월</option>
			                                    <option value="2">2월</option>
			                                    <option value="3">3월</option>
			                                    <option value="4">4월</option>
			                                    <option value="5">5월</option>
			                                    <option value="6">6월</option>
			                                    <option value="7">7월</option>
			                                    <option value="8">8월</option>
			                                    <option value="9">9월</option>
			                                    <option value="10">10월</option>
			                                    <option value="11">11월</option>
			                                    <option value="12">12월</option>
		                                    </select>
	                                    </div>
	                                    <div class = "col-sm-6">
		                                    <button class="btn btn-primary btn-user btn-block" onclick = "monthfind()">조회</button>
		                                </div>
	                                </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body font-weight-bold text-gray-800" style="overflow:auto; height:400px;" id = "menuList">
                                        <c:forEach items="${test}" var="menuList"  varStatus = "status">
                                        ${test[status.index].orderDate}일<br>
                                         ${test[status.index].storeName} 에서 ${test[status.index].menu } <fmt:formatNumber value="${test[status.index].menuprice}" pattern="#,###"/>원 ${test[status.index].ordercount }개             채팅방 : ${test[status.index].chatroomname}<br>
                                         <fmt:formatNumber value="${test[status.index].menuprice * test[status.index].ordercount  }" pattern="#,###"/>원
                                        <hr>
	                            		</c:forEach>
                                </div>
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" id="monthtotal" >
                               		<h6 class="m-0 font-weight-bold text-primary"></h6>
                               		<div class = "col-sm-3">
                               		<button class="btn btn-primary btn-user btn-block" id="Exceldownload">엑셀 다운로드</button>
                               		</div>
                                </div>
                            </div>
                        </div>
                              
                            </div>
                        </div>
                    </div>



</body>
<script>
function fnlogout(id){
	$.ajax({
		type : "POST",
		url : "/login/logout",
		data : {id : id},
		success : function(res){
			location.href = "/login/loginView";
		},
		error : function(XMLHttpRequest, textStatus, errorThrown){
			alert("로그아웃 실패");
		}
	});
	}
<%--
function monthfind(){
	var month = $("#monthselect").val();
	$.ajax({
		type : "POST",
		url : "/websocket/monthchange",
		data : {month : month},
		success : function(res){
			console.log(res);
			var results = res;
			var i = res.length;
			
			var str = '';
			$.each(results, function(i){
				str += results[i].orderDate+'일'+'<br>';
				str += results[i].storeName+' 에서 '+results[i].menu+" "+results[i].menuprice+'원 '+results[i].ordercount+'개'+'<br>';
				str += results[i].menuprice*results[i].ordercount+'원';
				str += '<hr>';
			});
			$("#menuList").empty();
			$("#menuList").append(str);
		},
		error : function(XMLHttpRequest, textStatus, errorThrown){
			
		}
	});
	
	$.ajax({
		type : "POST",
		url : "/websocket/monthresult",
		data : {month : month},
		success : function(res){
			var str = "<h6 class='m-0 font-weight-bold text-primary'>가장 자주 먹은 음식 : "+res.storeName+"에서 "+res.famenu+" "+res.menucount+"번 "+"<br><br>"+"식사 비용 : "+res.monthprice+"원";
			$("#monthtotal").empty();
			$("#monthtotal").append(str);
		},
		error : function(XMLHttpRequest, textStatus, errorThrown){
			
		}
	});
}
--%>
function monthfind(){
	var month = $("#monthselect").val();
	var startpage = $("#startpage").val();
	var roomId = $("#roomId").val();
	if(startpage === "rooms"){
	location.href = "/websocket/mypage?startpage="+startpage+"&month="+month;
	}else if(startpage === "room"){
		location.href = "/websocket/mypage?startpage="+startpage+"&roomId="+roomId+"&month="+month;
	}
}
</script>
</html>