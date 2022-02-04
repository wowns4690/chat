<%@ page import = "java.lang.String.*"%>
<%@page import="java.util.Calendar"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

<title>관리자 페이지</title>
</head>
<body>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">관리자페이지</div>
            </a>


        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<div class="col-sm-2">
						<button class="btn btn-danger btn-user btn-block" onclick="location.href = '/websocket/rooms'">나가기</button>
					</div>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">통계
	                         <select class="form-control form-control-user" id="monthselect" name="month">
				                 <option value ="${nowmonth}">${nowmonth }월</option>
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
			                 <button class="btn btn-primary btn-user btn-block" onclick = "monthfind()">조회</button>
                        </h1>
		                                
	                                
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-primary text-uppercase mb-2">
                                                	${nowmonth }월 회원들이 가장 많이 먹은 음식</div>
                                            <div class="h4 mb-0 font-weight-bold text-gray-800">${menuList[0].storeName }<hr>${menuList[0].menu} </div>
                                        </div>
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                        
						<!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-warning text-uppercase mb-2">
                                                	${nowmonth }월 점심식사에 가장 돈을 많이 쓴 사람</div>
                                            <div class="h4 mb-0 font-weight-bold text-gray-800">${mberList[0].mberName }<hr>${mberList[0].mberId }</div>
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
                                            <div class="text-xl font-weight-bold text-success text-uppercase mb-4">
                                                	${nowmonth }월 회원들의 평균 점심 식대</div>
                                            <div class="h1 mb-0 font-weight-bold text-gray-800">${avgPrice.avgPrice }원</div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>

                        
                    </div>

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">${nowmonth }월 회원들이 가장 선호하는 메뉴 순위</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body font-weight-bold text-gray-800">
                                    1위. ${menuList[0].menu} ${menuList[0].menucount}회
                                    <hr>
                                    2위. ${menuList[1].menu} ${menuList[1].menucount}회 
                                    <hr>
                                    3위. ${menuList[2].menu} ${menuList[2].menucount}회
                                    <hr>
                                    4위. ${menuList[3].menu} ${menuList[3].menucount}회
                                    <hr>
                                    5위. ${menuList[4].menu} ${menuList[4].menucount}회
                                </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">${nowmonth }월 점심에 가장 지출이 큰 사람 순위</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body font-weight-bold text-gray-800">
                                    1위. ${mberList[0].mberName} 총 ${mberList[0].sumPrice}원 
                                    <hr>
                                    2위. ${mberList[1].mberName} 총 ${mberList[1].sumPrice}원
                                    <hr>
                                    3위. ${mberList[2].mberName} 총 ${mberList[2].sumPrice}원
                                </div>
                            </div>
                        </div>
                    </div>

                        </div>

                        
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        

  




</body>
<script>
function monthfind(){
	var month = $("#monthselect").val();
	location.href = "/websocket/adminpage?month="+month;
}
</script>
</html>