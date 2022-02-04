<%@ page import = "java.lang.String.*"%>
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
<title>채팅방 목록</title>
</head>
<body>
<div class = "container" id="container">
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
                                <a class="dropdown-item" href="/websocket/mypage?startpage=rooms">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    	마이페이지
                                </a>
                                <div class="dropdown-divider"></div>
                                <button class="btn btn-danger btn-user btn-block" onclick="fnlogout('${id}')">로그아웃</button>
                            </div>
                        </li>

                    </ul>
                    <c:if test = "${id ne 'webmaster'}">
                    <div class="col-sm-2">
						<button class="btn btn-info btn-user btn-block" onclick="location.href = '/websocket/mypage?startpage=rooms'">마이페이지</button>
					</div>
					</c:if>
					<c:if test = "${id eq 'webmaster'}">
                    <div class="col-sm-2">
						<button class="btn btn-info btn-user btn-block" onclick="location.href = '/websocket/adminpage'">관리자페이지</button>
					</div>
					</c:if>
					<div class="col-sm-2">
						<button class="btn btn-danger btn-user btn-block" onclick="fnlogout('${id}')">로그아웃</button>
					</div>
                </nav>
    <table class = "table table-striped text-gray-900">
        <thead>
        <tr>
        	<th>음식 카테고리</th>
        	<th>주문 종류</th>
        	<th>방장</th>
            <th>방 이름</th>
            <th>입장</th>
            <th>삭제</th>
        </tr>
        </thead>
        <tbody>
        
        <c:forEach items="${rooms }" var="rooms" varStatus = "status">
        <tr>
        	<td>
        	<c:if test="${rooms.foodCategory eq 'koreaFood'}">
			<h4>[한식]</h4>	
			</c:if>
			<c:if test="${rooms.foodCategory eq 'chinaFood'}">
			<h4>[중식]</h4>	
			</c:if>
			<c:if test="${rooms.foodCategory eq 'americaFood'}">
			<h4>[양식]</h4>	
			</c:if>
			<c:if test="${rooms.foodCategory eq 'japanFood'}">
			<h4>[일식]</h4>	
			</c:if>
			<c:if test="${rooms.foodCategory eq 'etc'}">
			<h4>[기타]</h4>	
			</c:if>
        	</td>
        	<td>
        	<c:if test="${rooms.orderType eq 'delivery'}">
			<h4>[배달]</h4>	
			</c:if>
			<c:if test="${rooms.orderType eq 'storeEat'}">
			<h4>[매장 식사]</h4>	
			</c:if>
        	</td>
        	<td><h4>${rooms.roomMaster }</h4></td>
        	<td><h4>${rooms.nm}</h4></td>
        	<td>
                <a class = "btn btn-primary" href="/websocket/room?id=${rooms.rmd}">입장하기</a>
            </td>
            <td>
            	<c:if test = "${id eq rooms.roomMasterId || id eq 'webmaster'}">
            	<button class="btn btn-danger" id="delete" onclick = "fndelete('${rooms.rmd},${rooms.roomMasterId}')">채팅방 삭제하기</button>
            	</c:if>        	
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <input type = "hidden" id="sessionid" value="${id}">
    <button class="btn btn-primary" onclick = "location.href='/websocket/new'">채팅방 만들기</button>
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

	function fndelete(roomId){
		var roomId;
		var str = ",";
		var array = roomId.split(str);
		var sessionid =array[0]+","+$("#sessionid").val()
		var params = {
				id : array[0]
		}
		var session = $("#sessionid").val();
		if(roomId === sessionid || session === 'webmaster'){
			if(confirm("정말 삭제하시겠습니까?")){
				$.ajax({
					type : "POST",
					url : "/websocket/delete",
					data: params,
					success : function(res){
						$("#container").load("/websocket/rooms #container");
						alert("삭제 완료");
					},
					error : function(XMLHttpRequest, textStatus, errorThrown){ 
		                alert("통신 실패.");
		            },
				});
			}else{
				
			}
		}else{
			alert("방장만 삭제할수 있습니다.");
		}
	};

</script>
</html>