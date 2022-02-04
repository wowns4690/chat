<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
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


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="../resources/sockjs.min.js"></script>
<script src="../resources/jquery.ajax-cross-origin.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1aad0b654456c5ddcd54c94b6a2b5a0b&libraries=services"></script>
<title>채팅방</title>
</head>
<body id="page-top">

<form id = "roomvalues" method="POST">
<div id="hiddenvalue" style="float:left; width:25%">
<input type ="hidden" id="id" name = "rmd" value="${room.rmd }">
<input type ="hidden" id="roommasterId" name = "roommasterId" value="${room.roomMasterId }">
<input type ="hidden" id="roomname" value="${room.nm }">
<input type = "hidden" id="nickname" name="mberName" value = "${name}">
<input type = "hidden" id="rank" name="mberRank" value = "${rank}">
<input type = "hidden" id="mberid" name="mberId" value = "${mberId}">
<input type = "hidden" id="menu" name="menu" value = "">
<input type = "hidden" id="url" name="url" value = "${room.storeUrl }">
<input type = "hidden" id="storeName" name="storeName" value = "${room.storeName }">
</div>
</form>

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="rooms">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">채팅방</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="rooms">
                    
                    <span>채팅방 목록으로 돌아가기</span></a>
            </li>
            
            <hr class="sidebar-divider">
            
             <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="false" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>채팅방 정보</span>
                </a>
                <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item">방장 : ${room.roomMaster}</a>
                        <a class="collapse-item">주문 종류 : <c:if test="${room.orderType eq 'delivery'}">
							배달
						</c:if>
						<c:if test="${room.orderType eq 'storeEat'}">
							매장식사	
						</c:if></a>
						<a class="collapse-item">음식 종류 : <c:if test="${room.foodCategory eq 'koreaFood'}">
								한식	
							</c:if>
							
							<c:if test="${room.foodCategory eq 'chinaFood'}">
								중식	
							</c:if>
							
							<c:if test="${room.foodCategory eq 'americaFood'}">
								양식
							</c:if>
							
							<c:if test="${room.foodCategory eq 'japanFood'}">
								일식
							</c:if>
							
							<c:if test="${room.foodCategory eq 'etc'}">
								기타
							</c:if></a>
                    </div>
                </div>
            </li>
            
			<hr class="sidebar-divider">
            
             <li class="nav-item">
                <a class="nav-link collapsed" href="javascript:void(0)" onclick = "javascript:storeinfor('${room.storeUrl}')" data-toggle="collapse" data-target="#collapsethree"
                    aria-expanded="true" aria-controls="collapsethree">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>가게 상세 정보</span>
                </a>
            </li>
            <hr class="sidebar-divider">
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
            <a class="nav-link">
                    <i class="fas fa-fw fa-table"></i>
                    <span>접속중인 유저 목록</span></a>
				<div id="userlist" class="bg-white py-1 collapse-inner rounded" style = "width:210px;">
				</div>
            </li>         
        </ul>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                <span class="mr-2 d-none d-lg-inline text-gray-700 ">            
                	채팅방 이름 : ${room.nm }
                	</span>
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#"  id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-700 small">
                                ${name }
                                </span>
                                <img class="img-profile rounded-circle"
                                    src="../resources/img/undraw_profile.svg">
                            </a>
                            
                            
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <c:if test="${room.roomMaster eq name}">
                                </c:if>
                                <a class="dropdown-item" href="javascript:void(0)" onclick = "javascript:gomypage('${room.rmd}')">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    	마이페이지
                                </a>
                                <div class="dropdown-divider"></div>
                                <button class="btn btn-danger btn-user btn-block" onclick="fnlogout('${mberId}')">로그아웃</button>
                            </div>
                        </li>

                    </ul>
                    <c:if test="${room.roomMaster eq name}">
					<div class="col-sm-2">
						<button class="btn btn-success btn-user btn-block" onclick="menuupdate('${room.rmd}')">메뉴 수정</button>
					</div>
					</c:if>
					<c:if test = "${mberId ne 'webmaster' }">
                    <div class="col-sm-2">
						<button class="btn btn-info btn-user btn-block" onclick="gomypage('${room.rmd}')">마이페이지</button>
					</div>
					</c:if>
					<c:if test = "${mberId eq 'webmaster' }">
                    <div class="col-sm-2">
						<button class="btn btn-info btn-user btn-block" onclick="location.href = '/websocket/adminpage'">관리자페이지</button>
					</div>
					</c:if>
					<div class="col-sm-2">
						<button class="btn btn-danger btn-user btn-block" onclick="fnlogout('${mberId}')">로그아웃</button>
					</div>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                  

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-4 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">채팅창</h6>                                   
                                </div>
                                <!-- Card Body -->
                                <div class="card-body" id="chatroom" style="overflow:auto; width:550px; height:353px;">
                                </div>
                                <hr>
                                <div class="form-group row">
                                	<div class="col-sm-10 mb-3 mb-sm-0">
                                		<input type = "text" class="form-control form-control-user" id = "message"  maxlength = "80" placeholder="채팅 내용을 입력하세요" autofocus oninput="numberMaxLength(this);">
									</div>
									<div class = "col-sm-2">
										<button class = "btn btn-primary" id = "send">전송</button>
									</div>
								</div>
                            </div>
                        </div>
                        
                        <div class="col-xl-6 col-lg-4">
	                        <div class="card shadow mb-4">
		                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">메뉴</h6>
								</div>
								<div class="card-body">
									<div  style = "overflow:auto; height:400px;">
				                        <table class = "table table-striped text-gray-900" id = "imagetable">
					                        <thead>
					                        	<tr>
					                        		<th></th>
					                        		<th>메뉴</th>
					                        		<th>가격(원)</th>
					                        		<th>메뉴 선택</th>
					                        		<th>다운로드 </th>
					                        	</tr>
					                        </thead>
					                        <tbody>
					                        <c:forEach items="${file}" var="fileList"  varStatus = "status">
					                        
					                        <tr>
					                        	<td>
					                        		${status.index+1}
					                        	</td>
					                        	<td>
					                        	<c:choose>
					                        		<c:when test = "${not empty file[status.index].saveFile}">
					                        			<img src = "/img/${file[status.index].saveFolder}/${file[status.index].saveFile}" style = "width:250px; height:150px;">${file[status.index].menu } 
					                        		</c:when>
					                        		<c:otherwise>
					                        			<h4>[이미지 없음]</h4>${file[status.index].menu } 
					                        		</c:otherwise>
					                        	</c:choose>
					                        	</td>
					                        	<td>
					                        		<fmt:formatNumber value="${menu[status.index].menuprice}" pattern="#,###"/>원
					                        	</td>
					                        	<td>
					                        		<button class = "btn btn-info" id = "choice${menu[status.index].menu}" onclick = "choice('${menu[status.index].menu}','${menu[status.index].menuprice }')">메뉴 선택</button>
					                        	</td>
					                        	<td>
					                        	<c:if test = "${not empty file[status.index].saveFile}">
					                        		<button class = "btn btn-primary" id = "download" onclick = "fndownload('${file[status.index].saveFile}')">다운로드</button>
					                        	</c:if>
					                        	
					                        	</td>
					                        </tr>
					                        </c:forEach>
					                        </tbody>
				                       	</table>
			                       	</div>
		                       	</div>
	                       	</div>
                       	</div>

                       
                        <div class="col-xl-2 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">선택한 메뉴</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div id = "chatmenu" style = "overflow:auto; height:400px; ">
										<c:forEach items="${orderSheet}" var="orderSheet" varStatus = "status">
											<div class="col-20">
												<div class="alert alert-secondary">
													<b>[${orderSheet.mberRank}]${orderSheet.mberName} : ${orderSheet.menu } ${orderSheet.ordercount }개</b>
												</div>
												<div>
													<c:if test = "${orderSheet.mberId eq mberId}">
													<input type = "hidden" id = "plusmenu" value ="${orderSheet.menu }">
													<button class = "btn btn-secondary" id = "menuplus" name="ordercount" onclick = "orderplus('${orderSheet.menu}','${orderSheet.menuprice }')">+</button>
													<button class = "btn btn-secondary" id = "menuminus" name="ordercount" onclick = "orderminus('${orderSheet.menu}')">-</button>
													<button class = "btn btn-danger" id = "menudelete" name="test" onclick = "orderDelete('${orderSheet.menu}')">메뉴 삭제</button>
													</c:if>
												</div>
												<hr>
											</div>
										</c:forEach>
										</div>
                                </div>
                            </div>
                        </div>                         
                        
                        
                        <div class="col-xl-12 col-lg-2">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">주문서</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div id = "menucount" class="" style = "overflow:auto; height:150px;">
                                    
									</div>
                                </div>
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">합계 금액</h6>
                                    	<div id = "total">
                                    	
										</div>
                                </div>
                            </div>
                        </div>
                       
                       
                       	
                       	
                    </div>
					
						
                    <!-- Content Row -->
                    

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

          

        </div>
        <!-- End of Content Wrapper -->
<iframe id = "fileDown" style="visibility:hidden" src="" width="0" height="0"></iframe>
    </div>

    
</body>
 <script type="text/javascript">

 function numberMaxLength(e){
     if(e.value.length > e.maxLength){
         e.value = e.value.slice(0, e.maxLength);
     }

 }
 
 function fndownload(filename){
	 var url = "http://localhost/websocket/download?filename="+filename;
	 document.getElementById('fileDown').src = url;
	 //location.href = "http://localhost/websocket/download?filename="+filename;
 }
 
 function storeinfor(url){
	 window.open(url,"",'width=910, height=800');
 }
 
 function menuupdate(roomId){
	 	var url="/websocket/menuupdate?roomId="+roomId;
		var name = "menuupdate";
		var option = "width = 1800, height = 780, top = 100, left = 200, location = no";
		window.open(url, name, option);
 }
 	
		
			var roomName = $("#roomname").val();
			var roomId = $("#id").val();
			var username = $("#nickname").val();
			var rank = $("#rank").val();
			var mberid = $("#mberid").val();
			var sockJs = new SockJS("/stomp/chat");
			var stomp = Stomp.over(sockJs);
			
			
			stomp.connect({}, function(){
				stomp.subscribe("/sub/chat/room/" + roomId, function(chat){
					var content = JSON.parse(chat.body);
					var writer = content.writer;
					var message = content.message;
					var type = content.type;
					var str = "";
					
					if(type === "Enter"){
						
						str = "<div class='col-11'>";
						str += "<div class='alert alert-success'>";
						str += "<b>" + message + "</b>";
						str += "</div></div>";
						$("#chatroom").append(str);
						$("#chatroom").scrollTop($("#chatroom")[0].scrollHeight);
						$.ajax({
							type : "POST",
							url : "userQuit",
							data : {chatRoomId : roomId,
									mberId : mberid,
									rank : rank},
							async : false,		
							success : function(res){
								var results = res;
								var i = res.length;
								
								var str = "<tr>";
								$.each(results, function(i){
									str += '<td>' +'['+ results[i].rank +']'+ '</td><td>' + results[i].writer + '</td>';
									str += '</tr>';
								});
								$("#userlist").empty();
								$("#userlist").append(str);
							},
							error : function(XMLHttpRequest, textStatus, errorThrown){
								alert("통신실패");
							}
						});
						$.ajax({
							type : "POST",
							url : "menuCount",
							data : {roomId : roomId},
							async : false,
							success : function(res){
								var total = 0;
								var results = res;
								var i = res.length;
								var str = "";
								$.each(results, function(i){
									str +="<div class='col-12'>";
									str +="<div class = 'alert alert-secondary'>";
									str += "<b>"+ results[i].menu +':'+ results[i].ordercount +'개'+"</b>";
									str += '</div>';
									str += '</div>';
									total = total + (results[i].ordercount * results[i].menuprice);
								});
								$("#menucount").empty();
								$("#menucount").append(str);
								$("#total").empty();
								$("#total").append(total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원");
							},
							error : function(XMLHttpRequest, textStatus, errorThrown){
								alert("통신실패");
							}
						});
					}else if(type === "Quit"){
						
						str = "<div class='col-11'>";
						str += "<div class='alert alert-danger'>";
						str += "<b>" + message + "</b>";
						str += "</div></div>";
						$.ajax({
							type : "POST",
							url : "userQuit",
							data : {chatRoomId : roomId,
									mberId : mberid,
									rank : rank},
							async : false,		
							success : function(res){
								var results = res;
								var i = res.length;
								
								var str = '<tr>';
								$.each(results, function(i){
									str += '<td>' +'['+ results[i].rank +']'+ '</td><td>' + results[i].writer + '</td>';
									str += '</tr>';
								});
								$("#userlist").empty();
								$("#userlist").append(str);
							},
							error : function(XMLHttpRequest, textStatus, errorThrown){
								alert("통신실패");
							}
						});
						$("#chatroom").append(str);
						$("#chatroom").scrollTop($("#chatroom")[0].scrollHeight);
					}else if(type === "Talk"){
						if(writer === username){
							str = "<div class='col-11'>";
							str += "<div class='alert alert-info'>";
							str += "<b>"+ message + "</b>";
							str += "</div></div>";
							$("#chatroom").append(str);
							$("#chatroom").scrollTop($("#chatroom")[0].scrollHeight);
							
						}
						else{
							str = "<div class='col-11'>";
							str += "<div class='alert alert-warning'>";
							str += "<b>"+ message + "</b>";
							str += "</div></div>";
							$("#chatroom").append(str);
							$("#chatroom").scrollTop($("#chatroom")[0].scrollHeight);
						}
					}else if(type === "Select"){
						$("#chatmenu").load(location.href + " #chatmenu");
						$("#menuR").load(location.href + " #menuR");
						$("#imagetable").load(location.href + " #imagetable");
							$.ajax({
								type : "POST",
								url : "menuCount",
								data : {roomId : roomId},
								async : false,
								success : function(res){
									var total=0;
									var results = res;
									var i = res.length;
									console.log(res);
									var str = "";
									$.each(results, function(i){
										str +="<div class='col-12'>";
										str +="<div class = 'alert alert-secondary'>";
										str += "<b>"+ results[i].menu +':'+ results[i].ordercount +'개'+"</b>";
										str += '</div>';
										str += '</div>';
										total = total + (results[i].ordercount * results[i].menuprice);
									});
									$("#menucount").empty();
									$("#menucount").append(str);
									$("#total").empty();
									$("#total").append(total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원");
									$("#chatmenu").load(location.href + " #chatmenu");
									
								},
								error : function(XMLHttpRequest, textStatus, errorThrown){
									alert("통신실패");
								}
							});
					}else if(type === "Delete"){
						$("#chatmenu").load(location.href + " #chatmenu");
						
						$.ajax({
							type : "POST",
							url : "menuCount",
							data : {roomId : roomId},
							async : false,
							success : function(res){
								var total=0;
								var results = res;
								var i = res.length;
								console.log(res);
								var str = "";
								$.each(results, function(i){
									str +="<div class='col-12'>";
									str +="<div class = 'alert alert-secondary'>";
									str += "<b>"+ results[i].menu +':'+ results[i].ordercount +'개'+"</b>";
									str += '</div>';
									str += '</div>';
									total = total + (results[i].ordercount * results[i].menuprice);
								});
								$("#menucount").empty();
								$("#menucount").append(str);
								$("#total").empty();
								$("#total").append(total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원");
								
							},
							error : function(XMLHttpRequest, textStatus, errorThrown){
								alert("통신실패");
							}
						});
						
					}
				});
				stomp.send('/pub/chat/enter', {}, JSON.stringify({chatRoomId : roomId, writer : username, rank : rank, mberId : mberid }));
			});
			
			$("#send").on("click", function(e){
				var msg = document.getElementById("message");
				var check = msg.value;
				if(check.replace(/\s|/gi, "").length == 0){
					alert("메세지를 입력해주세요.");
				}else{
					check = check.replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
					stomp.send('/pub/chat/message', {}, JSON.stringify({chatRoomId : roomId, message : check, writer : username, rank : rank, mberId : mberid }));	
				}
				msg.value = '';
				$("#message").val('').focus();
			});
				
			
			function choice(menu,menuprice){
				var storeName = $("#storeName").val();
				menu = menu.replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
				var roomname = $("#roomname").val();
				var params = {
						roomId : roomId,
						mberId : mberid,
						mberName : username,
						mberRank : rank,
						menu : menu,
						ordercount : 1,
						storeName : storeName,
						menuprice : menuprice,
						chatroomname : roomname
					}
				
				$("#menu").val(menu);
				$.ajax({
					type : "POST",
					url : "insertorderSheet",
					data : params,
					async : false,
					success : function(res){
						
					},
					error : function(XMLHttpRequest, textStatus, errorThrown){
						
					}
				});
				stomp.send('/pub/chat/menuselect', {}, JSON.stringify({chatRoomId : roomId, message : menu, writer : username, mberId : mberid, rank : rank }));
				
				msg = '';
			}
			
			
			$(document).on("click","#menuplus", function(){
				stomp.send('/pub/chat/menuselect', {}, JSON.stringify({chatRoomId : roomId}));
			})
			
			$(document).on("click","#menuminus",function(){
				stomp.send('/pub/chat/menudelete', {},JSON.stringify({chatRoomId : roomId }));
			})
			
			
			$(document).on("click","#menudelete",function(){
				stomp.send('/pub/chat/menudelete', {},JSON.stringify({chatRoomId : roomId }));
			})
			
			
			
			
			$("#back").on("click", function(){	
				setTimeout(function(){
					location.href = "/websocket/rooms";
				}, 500);
			});
			
			
			window.onbeforeunload = function() {
				return stomp.send('/pub/chat/quit', {}, JSON.stringify({chatRoomId : roomId, writer : username, rank : rank, mberId : mberid}));
			}
			
			
			
			function gomypage(){
				if(confirm("채팅방이 나가집니다. 마이페이지로 이동 하시겠습니까?") == true){
					$.ajax({
						type : "POST",
						url : "/websocket/mypage",
						success : function(res){
							stomp.send('/pub/chat/quit', {}, JSON.stringify({chatRoomId : roomId, writer : username, rank : rank, mberId : mberid}));
							location.href = "/websocket/mypage";
						},
						error : function(XMLHttpRequest, textStatus, errorThrown){
							alert("로그아웃 실패");
						}
					});
				}else{
					alert("이동을 취소하였습니다.");
				}
			}
			
			
		
			
				
		$(document).ready(function(){
			$("#menuText").keydown(function(keynum){
				if(keynum.which == 13){
					$("#choice").click();
					$("#menuText").val("");
				}	
			})
			
			$("#message").keydown(function(keynum){
				if(keynum.which == 13){
					$("#send").click();
				}
				
			})
			
			
		})
		
			function orderDelete(menu){
				var roomId = $("#id").val();
				var mberId = $("#mberid").val()
				menu = menu.replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
					$.ajax({
						type : "POST",
						url : "deleteorderSheet",
						data : {menu : menu,
								roomId : roomId,
								mberId : mberId},
						async : false,
						success : function(res){
							$("#chatmenu").load(location.href + " #chatmenu");
						},
						error : function(XMLHttpRequest, textStatus, errorThrown){
							alert("통신실패");
						}
					});
				
				
			}
		
		function orderplus(menu,menuprice){
			var roomId = $("#id").val();
			var mberId = $("#mberid").val()
			var mberName = $("#nickname").val();
			var storeName = $("#storeName").val();
			var rank = $("#rank").val();
			var roomname = $("#roomname").val();
			menu = menu.replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
				$.ajax({
					type : "POST",
					url : "insertorderSheet",
					data : {
						roomId : roomId,
						menu : menu,
						mberName : mberName,
						mberRank : rank,
						mberId : mberId,
						storeName : storeName,
						menuprice : menuprice,
						chatroomname : roomname
							},
					async : false,
					success : function(res){
						$("#chatmenu").load(location.href + " #chatmenu");
					},
					error : function(XMLHttpRequest, textStatus, errorThrown){
						
					}
				})
		}
		
		
		function orderminus(menu){
			var roomId = $("#id").val();
			var mberId = $("#mberid").val()
			menu = menu.replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
				$.ajax({
					type : "POST",
					url : "orderminus",
					data : {menu : menu,
							roomId : roomId,
							mberId : mberId},
					async : false,
					success : function(res){
						$("#chatmenu").load(location.href + " #chatmenu");
					},
					error : function(XMLHttpRequest, textStatus, errorThrown){
						alert("통신실패");
					}
				});	
		}
		
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
		function gomypage(roomId){
			if(confirm("채팅방이 나가집니다. 이동하시겠습니까?") == true){
				location.href = "/websocket/mypage?startpage=room&roomId="+roomId;
			}else{
				alert("이동을 취소하였습니다.");
			}
		}
		
		
    </script>
</html>