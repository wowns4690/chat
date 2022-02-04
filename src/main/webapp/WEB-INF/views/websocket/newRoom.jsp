<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1aad0b654456c5ddcd54c94b6a2b5a0b&libraries=services"></script>

<style>

.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:350px;}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
<title>채팅방 생성</title>
</head>
<body id="page-top">
<input type = "hidden" id = "cadress" value = "${cadress}">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                <div class="col-sm-2">
					<button class="btn btn-danger btn-user btn-block" onclick = "location.href='/websocket/rooms'">목록으로 돌아가기</button>
				</div>
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                    
                    

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-700 small">${name }</span>
                                <img class="img-profile rounded-circle"
                                    src="../resources/img/undraw_profile.svg">
                            </a>
                            
                            
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
						<button class="btn btn-info btn-user btn-block" onclick="location.href = '/websocket/mypage?startpage=newroom'">마이페이지</button>
					</div>
					<div class="col-sm-2">
						<button class="btn btn-danger btn-user btn-block" onclick="fnlogout('${mberId}')">로그아웃</button>
					</div>
                </nav>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                   



                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">지도</h6></div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="map_wrap">
										    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
										    <ul id="category"> 
										        <li id="FD6" data-order="5"> 
										            <span class="category_bg store"></span>
										            주변식당
										        </li>      
										    </ul>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">밥집 검색</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body" id="menu_wrap">
									
				                        <div class="input-group" >
				                            <input type="text" id = "keyword" class="form-control bg-light border-0 small" placeholder="식당 이름을 입력해주세요."
				                                aria-label="Search" aria-describedby="basic-addon2">
				                            <div class="input-group-append" >
				                                <button class="btn btn-primary" type="button" id = "searchstore">
				                                    <i class="fas fa-search fa-sm"></i>
				                                </button>
				                            </div>
				                        </div>
				                    <ul id="placesList"></ul>
        							<div id="pagination"></div>
								</div>
                               </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->
                    <form id="roominfo" action="newroom" method= "post" enctype = "multipart/form-data">
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">채팅방 정보</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold">음식 카테고리</h4>
                                    <select id="selectFood" name="foodCategory" class="form-control" onchange="">
										<option value="koreaFood">한식</option>
										<option value="chinaFood">중식</option> 
										<option value="americaFood">양식</option>
										<option value="japanFood">일식</option>
										<option value="etc">기타</option>
									</select>
									<hr>
                                    <h4 class="small font-weight-bold">주문 종류</h4>
                                    <select id="orderType" name="orderType" class="form-control" onchange="">
										<option value="delivery">배달</option>
										<option value="storeEat">매장식사</option> 
									</select>
									<hr>	
                                    <h4 class="small font-weight-bold">채팅방 제목 </h4>
                                    <div class="form-group">
                                        <input type="text" id="chatroomname" value="" name="nm" class="form-control form-control-user" placeholder="채팅방 이름을 입력해주세요" required autofocus maxlength="20" oninput="numberMaxLength(this);">
                                    </div>
                                    <hr>
                                    <h4 class="small font-weight-bold">식당 선택 </h4>
                                    <input type="text" value="" id="selectstore" class="form-control" placeholder="지도에서 식당을 선택해주세요." readonly>
        							<input type="hidden" value=""  id="storeinfo" name = "storeinfo">
        							<hr>
        							<div class="form-group row">
	        							<div class="col-sm-3">
						                    <button type="button" onclick="createroom()" class="btn btn-primary btn-user btn-block">채팅방 생성</button>
						                </div>
					    			</div>
                                	</div>
                            </div>

                            <!-- Color System -->
                            

                        </div>

                        <div class="col-lg-6 mb-4">

                            <!-- Illustrations -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <div class="form-group row">
                                    	<div class="col-sm-10 mb-10 mb-sm-0">
                                    		<h6 class="m-0 font-weight-bold text-primary">메뉴 입력</h6>
                                    	</div>
                                    	<div class="col-sm-2">
                                    		<button type="button" onclick="addmenu()" class="btn btn-primary btn-user btn-block">메뉴 추가</button>
                                    		
                                    	</div>
                                    </div>
                                </div>
                                <div class="card-body" id = "menudiv">
                                	  
                                </div>
                            </div>                            
							
                        </div>
                    </div>
                    </form>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            

        </div>
        <!-- End of Content Wrapper -->

</body>

 <script>
 function numberMaxLength(e){
     if(e.value.length > e.maxLength){
         e.value = e.value.slice(0, e.maxLength);
     }

 }
 
 
 var menuNum = 0;
 var menucount = 1;
 function test(){
	 for(var i = 1; i<menucount; i++){
		 console.log("i : "+i);
		 console.log("menuprice : "+$("#menuprice"+i).val());
	 }
 }
 function addmenu(){
	 var str = "";
	 for(var i = 0; i < menucount; i++){
	 str = "<div class='form-group row' id='menudivchild"+menucount+"' >";
	 str += "<div class='col-sm-6 mb-3 mb-sm-0'>";
	 str += "<h4 class='small font-weight-bold'>메뉴</h4>";
	 str += "<input type='text' id='menu"+menucount+"' name='menu' class='form-control form-control-user' placeholder='메뉴를 입력해주세요.' maxlength='20' oninput='numberMaxLength(this);'>";
	 str += "</div>";
	 str += "<div class = 'col-sm-4'>";
	 str += "<h4 class='small font-weight-bold'>가격</h4>";
	 str += "<input type='text' id='menuprice"+menucount+"' name='menuprice' class='form-control form-control-user' onkeyup='onlyNumber(this)' placeholder='메뉴의 가격을 입력해주세요.' maxlength = '8' >";
	 str += "</div>";
	 str += "<div class = 'col-sm-2'>";
	 str += "<h4 class='small font-weight-bold'>삭제</h4>";
	 str += "<button type='button' onclick='removemenu("+menucount+")' class='btn btn-danger btn-user btn-block'>메뉴 삭제</button>";
	 str += "</div>";
	 str += "<input type ='file' class='form-control-file border' id='upfile"+menucount+"' name ='upfilename"+menucount+"' onchange='miribogi(event)' onclick='test2("+menucount+")' accept='image/*'>";
	 str += "<div id = 'image_container"+menucount+"'>";
	 str += "</div>";
	 str += "</div>";	
	 console.log(menucount);
	 }
	 menucount ++;
	$("#menudiv").append(str);
 }

function removeimg(num){
	$("#image_container"+num).empty();
	$("#upfile"+num).val("");
}

function test2(num){
	menuNum = num;
}
 
 function miribogi(event){
	var fileForm = /(.*?)\.(jpg|jpeg|png|JPG|JPEG|PNG)$/;
	var maxSize = 5 * 1024 * 1024;
	var imgfile = $("#upfile"+menuNum).val();
	if(imgfile == "" || imgfile == null){
		$("#image_container"+menuNum).empty();	
	}else{
		var filesize = document.getElementById("upfile"+menuNum).files[0].size;
		if(!imgfile.match(fileForm)){
			alert("이미지 파일만 등록 가능 합니다.");
			$("#upfile"+menuNum).val("");
			$("#image_container"+menuNum).empty();
		}else if(filesize>maxSize){
			alert("5MB미만 파일만 등록 가능합니다.");
			$("#upfile"+menuNum).val("");
			$("#image_container"+menuNum).empty();
		}else{
			var reader = new FileReader();
			 
			 reader.onload = function(event){
				 console.log("menuNum : "+menuNum);
				 var img = document.createElement("img");
				 img.setAttribute("src",event.target.result);
				 img.setAttribute("class", "col-lg-6");
				 $("#image_container"+menuNum).empty();
				 document.querySelector("div#image_container"+menuNum).appendChild(img);
			 };
			 
			 reader.readAsDataURL(event.target.files[0]);
			
		}
	}
 }

 function onlyNumber(obj) {
	 obj.value = comma(uncomma(obj.value));
	    $(obj).keyup(function(){
	        $(this).val($(this).val().replace(/[^0-9,]/g,""));
	    });
	}
 
 function comma(str) {
     str = String(str);
     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
 }

 function uncomma(str) {
     str = String(str);
     return str.replace(/[^\d]+/g, '');
 }
 
 function removemenu(num){
	 $("#menudivchild"+num).remove();
	 menucount --;
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

 function fnReplace(val) {
		var ret = 0;
		if(typeof val != "undefined" && val != null && val != ""){
			ret = Number(val.replace(/,/gi,''));
		}
		return ret;		
	}
 


function createroom(){
	 var fileForm = /(.*?)\.(jpg|jpeg|png|JPG|JPEG|PNG)$/;
	 var maxSize = 5 * 1024 * 1024;
	 var fileSize = [];
	 var imgarr = [];
	 var imgFile = $("input[name=upfile]").val();
	 var num = 0;
	 var imgnum = 0;
	 var menuarr = [];
	 for(var i = 0; i<menucount-1; i++){
		 a = i+1;
		 menuarr[i] = $("#menu"+a).val();
	 }
	 if($("#selectFood").val() == "" || $("#selectFood").val() == null){
		 alert("음식 카테고리를 설정해주세요.");
	 }else if($("#orderType").val() == "" || $("#orderType").val() == null){
		 alert("주문 종류를 선택해주세요.");
	 }else if($("#chatroomname").val() == "" || $("#chatroomname").val() == null){
		 alert("채팅방 제목을 입력해주세요.");
		 $("#chatroomname").focus();
	 }else if($("#selectstore").val() == "" || $("#selectstore").val() == null){
		 alert("식당을 선택해 주세요.");
		 $("#selectstore").focus();
	 }else if(!(imgFile =="" || imgFile ==null)) {		 
		 
		 var filestatus = false;
		 var imgstatus = false;
		 for(var a = 1; a<menucount; a++){
			fileSize[a] = document.getElementById("upfile"+a).files[0].size;
			imgarr[a] = $("#upfile"+a).val();
		 }
		 for(var d = 1; d<imgarr.length; d++ ){
			 var imgval = imgarr[d];
			 if(!imgval.match(fileForm)){
				 alert("이미지 파일(jpg,jpeg,png)만 업로드 해주세요.");
				 imgstatus = false;
				 imgval = null;
				 imgnum ++;
			 }else if(imgnum == 0){
				 imgstatus = true;
			 }
		 }
		 for(var c = 0; c<fileSize.length; c++){
			 if(fileSize[c] > maxSize){
			 alert("최대 5MB까지 등록 가능합니다.")
			 filestatus = false;
			 num ++;
		 	}else if(num == 0){
		 		filestatus = true;
		 	}
		 }
		 for(var i = 1; i<menucount; i++){
			 $("#menuprice"+i).val(fnReplace($("#menuprice"+i).val()));
			 var menu = $("#menu"+i).val();
			 menu = menu.replace(/^\s+|\s+$/gm,'').replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
			 $("#menu"+i).val(menu)
			 console.log($("#menu"+i).val());
		 }
		 fileSize = [];
		 if(filestatus == true && imgstatus == true){
			 filestatus = false;
			 imgstatus = false;
			 imgnum = 0;
			 num = 0;
			 var qwer = "fail";
			 var zxcv = "fail";
			 var asdf = "fail";
			 for(var i = 1; i<menucount; i++){
				 var nm = document.getElementById("upfile"+i).files[0].name + "|" + i;  
				 document.getElementById("upfile"+i).files[0].name = nm;
				 console.log(document.getElementById("upfile"+i).files);
			 }
			 var chatroomname = $("#chatroomname").val();
			 chatroomname = chatroomname.replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
			 $("#chatroomname").val(chatroomname);
			 var strmenu = menuarr[0];
			 for(var i = 0; i<menucount-1; i++){
				 if(menuarr[i] == "" || menuarr[i] == null || menuarr[i].indexOf("<") !== -1 || menuarr[i].indexOf(">") !== -1){
					 alert("메뉴를 입력해주세요. <>문자는 사용할 수 없습니다.");
					 var menu_num = i+1;
					 $("#menu"+menu_num).val("");
					 for(var a = 1; a<menucount; a++){
						 $("#menuprice"+a).val("");
					 }
					 $("#menu"+menu_num).focus();
					 qwer = "fail";
					 return false;
				 }else{
					 qwer = "success";
				 }
			 }
			 for(var i = 1; i<menucount; i++){
				 if($("#menuprice"+i).val() == "" || $("#menuprice"+i).val() == null){
					 for(var a = 1; a<menucount; a++){
						 $("#menuprice"+a).val("");
					 }
					 alert("메뉴 가격을 입력해주세요. 0원은 입력이 불가능합니다.");
					 var menuprice_num = i;
					 $("#menuprice"+menuprice_num).focus();
					 zxcv = "fail";
					 return false;
				 }else{
					 zxcv = "success";
				 }
			 }
			 for(var i = 0; i<menucount-1; i++){
				 if(menuarr.indexOf(menuarr[i]) === menuarr.lastIndexOf(menuarr[i])){
					 asdf = "success";
				 }else{
					 alert("중복된 메뉴는 입력할 수 없습니다.");
					 var menu_num = i+1;
					 $("#menu"+menu_num).focus();
					 asdf = "fail";
					 return false;
				 }
			 }
			 if(qwer === "success" && asdf === "success" && zxcv === "success"){
				$("#roominfo").attr('action','newroom').submit();
			 }
		 }
	 }else{
		 var qwer = "fail";
		 var zxcv = "fail";
		 var asdf = "fail";
		 for(var i = 1; i<menucount; i++){
			 $("#menuprice"+i).val(fnReplace($("#menuprice"+i).val()));
			 var menu = $("#menu"+i).val();
			 menu = menu.replace(/^\s+|\s+$/gm,'').replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
			 $("#menu"+i).val(menu)
		 }
		 var chatroomname = $("#chatroomname").val();
		 chatroomname = chatroomname.replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
		 $("#chatroomname").val(chatroomname);
		 for(var i = 0; i<menucount-1; i++){
			 if(menuarr[i] == "" || menuarr[i] == null || menuarr[i].indexOf("<") !== -1 || menuarr[i].indexOf(">") !== -1){
				 alert("메뉴를 입력해주세요. <> 문자는 사용할 수 없습니다.");
				 var menu_num = i+1;
				 $("#menu"+menu_num).val("");
				 for(var a = 1; a<menucount; a++){
					 $("#menuprice"+a).val("");
				 }
				 $("#menu"+menu_num).focus();
				 qwer = "fail";
				 return false;
			 }else{
				 qwer = "success";
			 }
		 }
		 for(var i = 1; i<menucount; i++){
			 if($("#menuprice"+i).val() == "" || $("#menuprice"+i).val() == null || $("#menuprice"+i).val() == 0){
				 
				 alert("메뉴 가격을 입력해주세요. 0원은 입력이 불가능합니다.");
				 for(var a = 1; a<menucount; a++){
					 $("#menuprice"+a).val("");
				 }
				 var menuprice_num = i;
				 $("#menuprice"+menuprice_num).focus();
				 zxcv = "fail";
				 return false;
			 }else{
				 zxcv = "success";
			 }
		 }
		 for(var i = 0; i<menucount-1; i++){
			 if(menuarr.indexOf(menuarr[i]) === menuarr.lastIndexOf(menuarr[i])){
				 asdf = "success";
			 }else{
				 alert("중복된 메뉴는 입력할 수 없습니다.");
				 var menu_num = i+1;
				 $("#menu"+menu_num).focus();
				 asdf = "fail";
				 return false;
			 }
		 }
		 if(qwer === "success" && asdf === "success" && zxcv === "success"){
			$("#roominfo").attr('action','newroom').submit();
		 }
		 
	 }
}

















 
 
 
 
$("#keyword").on("click", function(){
	$("#keyword").val("");
})
 
 $(document).ready(function(){
		$("#keyword").keydown(function(keynum){
			if(keynum.which == 13){
				$("#searchstore").click();
			}	
		})
 })
 
<%---------------------------------------------------------------주변밥집부분 --------------------------------------------------------------------------------------%> 

var geocoder = new kakao.maps.services.Geocoder();
var adress = $("#cadress").val()

geocoder.addressSearch(adress, function(result, status){
	var coords = new kakao.maps.LatLng(result[0].x, result[0].y);
	var x = coords.La;
	var y = coords.Ma;

var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
markers = [], // 마커를 담을 배열입니다
currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(x, y), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 


//장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map); 

//지도에 idle 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', searchPlaces);

//커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

//커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
//지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

//커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

//각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

//엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
if (target.addEventListener) {
    target.addEventListener(type, callback);
} else {
    target.attachEvent('on' + type, callback);
}
}

//카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
if (!currCategory) {
    return;
}

// 커스텀 오버레이를 숨깁니다 
placeOverlay.setMap(null);

// 지도에 표시되고 있는 마커를 제거합니다
removeMarker();

ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
if (status === kakao.maps.services.Status.OK) {

    // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
    displayPlaces(data);
    console.log(data);
} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
    // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

} else if (status === kakao.maps.services.Status.ERROR) {
    // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
    
}
}

//지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {

// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
var order = document.getElementById(currCategory).getAttribute('data-order');



for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

        // 마커와 검색결과 항목을 클릭 했을 때
        // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
        (function(marker, place) {
            kakao.maps.event.addListener(marker, 'click', function() {
                displayPlaceInfo(place);
                var storeinfo = JSON.stringify(place.place_name);
                $("#storeinfo").val(JSON.stringify(place));
                $("#selectstore").val(storeinfo);
                console.log(JSON.stringify(place));
            });
        })(marker, places[i]);
}
}

//마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
    imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
    imgOptions =  {
        spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
        spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
        offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
    },
    markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
        marker = new kakao.maps.Marker({
        position: position, // 마커의 위치
        image: markerImage 
    });

marker.setMap(map); // 지도 위에 마커를 표출합니다
markers.push(marker);  // 배열에 생성된 마커를 추가합니다

return marker;
}

//지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
for ( var i = 0; i < markers.length; i++ ) {
    markers[i].setMap(null);
}   
markers = [];
}

//클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
var content = '<div class="placeinfo">' +
                '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

if (place.road_address_name) {
    content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
}  else {
    content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
}                

content += '    <span class="tel">' + place.phone + '</span>' + 
            '</div>' + 
            '<div class="after"></div>';

contentNode.innerHTML = content;
placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
placeOverlay.setMap(map);  
}


//각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
var category = document.getElementById('category'),
    children = category.children;

for (var i=0; i<children.length; i++) {
    children[i].onclick = onClickCategory;
}
}

//카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
var id = this.id,
    className = this.className;

placeOverlay.setMap(null);

if (className === 'on') {
    currCategory = '';
    changeCategoryClass();
    removeMarker();
} else {
    currCategory = id;
    changeCategoryClass(this);
    searchPlaces();
}
}

//클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
var category = document.getElementById('category'),
    children = category.children,
    i;

for ( i=0; i<children.length; i++ ) {
    children[i].className = '';
}

if (el) {
    el.className = 'on';
} 
}
<%----------------------------------------------------------- 검색부분 자바스크립트 ---------------------------------------------------%>

var ps2 = new kakao.maps.services.Places(map);
var infowindow = new kakao.maps.InfoWindow({zIndex:1});
$("#searchstore").on("click", function(){
	var id2 = this.id2,
    className2 = this.className;

	placeOverlay.setMap(null);
	currCategory = id2;
    changeCategoryClass(this);
    searchPlaces();
	
	 var keyword = document.getElementById("keyword").value;
	 
	 if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }

	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps2.keywordSearch( keyword, placesSearchCB2); 
 
})
 
 function placesSearchCB2(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces2(data);
	        console.log(data);
	        displayPagination2(pagination);

	}
 }
 
function displayPlaces2(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
	removeAllChildNods(listEl);
    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker2(placePosition, i),
            itemEl = getListItem2(i, places[i]); // 검색 결과 항목 Element를 생성합니다
            
            

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다

        
        (function(marker, place , title) {
        	var count = 0;
            kakao.maps.event.addListener(marker, 'click', function() {
                displayPlaceInfo2(place);
                var storeinfo = JSON.stringify(place.place_name);
                $("#storeinfo").val(JSON.stringify(place));
                $("#selectstore").val(storeinfo);
                console.log(JSON.stringify(place));
            });
            
            itemEl.onclick = function(){
            	count++;
            	if(count == 1){
            		var storeinfo = JSON.stringify(place.place_name);
            		var x = place.x;
            		var y = place.y;
                    $("#storeinfo").val(JSON.stringify(place));
                    $("#selectstore").val(storeinfo);
                    console.log(JSON.stringify(place));
            		displayPlaceInfo3(place,count);            
            		panTo(x,y)
            		
            	}else{
            		count = 0;
            		displayPlaceInfo3(place,count);
            		
            	}
        	};
            
        })(marker, places[i]);
        (marker, places[i].place_name);
        fragment.appendChild(itemEl);

    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

function getListItem2(index, places) {
    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';
    return el;
}

function addMarker2(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

function displayPagination2(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

function displayPlaceInfo2 (place) {
	var content = '<div class="placeinfo">' +
	                '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '" onclick="">' + place.place_name + '</a>';   

	if (place.road_address_name) {
	    content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
	                '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
	}  else {
	    content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
	}                

	content += '    <span class="tel">' + place.phone + '</span>' + 
	            '</div>' + 
	            '<div class="after"></div>';

	contentNode.innerHTML = content;
	placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
	placeOverlay.setMap(map);  
	}

	
function displayPlaceInfo3 (place,count) {
	if(count == 1){
		
		var content = '<div class="placeinfo">' +
		                '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   
	
		if (place.road_address_name) {
		    content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
		                '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
		}  else {
		    content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
		}                
	
		content += '    <span class="tel">' + place.phone + '</span>' + 
		            '</div>' + 
		            '<div class="after"></div>';
	
		contentNode.innerHTML = content;
		placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
		placeOverlay.setMap(map);	
		}else{
			$(".placeinfo").hide();
		}
	}
	
function panTo(x,y) {
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(y, x);
    
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);  
}

});
 </script>
</html>