<%@ page import = "java.lang.String.*"%>
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


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="../resources/sockjs.min.js"></script>
<script src="../resources/jquery.ajax-cross-origin.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1aad0b654456c5ddcd54c94b6a2b5a0b&libraries=services"></script>
<title>메뉴 수정하기</title>
</head>
<body id="page-top">
<input type = "hidden" id="roomId" value="${roomId }">
    <!-- Page Wrapper -->
    <div id="wrapper">

        
        

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				<br>
               
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">메뉴 수정하기</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="menuList" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th></th>
                                            <th>메뉴</th>
                                            <th>가격(원)</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${menu }" var="menu" varStatus = "status">
                                    	<tr>
                                    	<td style = "width:1%">${status.index +1}</td>
                                    	 <c:choose>
			                        		<c:when test = "${not empty file[status.index].saveFile}">
                                            <td style = "width:20%;">
                                            <div id = "titleshow${menu.menu }" style="display:block"><h4>${menu.menu}</h4></div>
                                            <div id = "titlehide${menu.menu }" style="display:none"><input type = "text" id="${menu.menucount}" style = "width:50%" class="form-control form-control-user" value ="${menu.menu}" maxlength = "40" oninput="numberMaxLength(this);"></div>
                                            <div id ="imgdiv${menu.menu}" style="display:block">
                                            <img src = "/img/${file[status.index].saveFolder}/${file[status.index].saveFile}" style = "width:250px; height:150px;">
                                            </div>
                                            <div id = "changemiribogi${file[status.index].uploadNum}"></div>
                                            </td>
                                            </c:when>
                                            <c:otherwise>
			                        			<td>
			                        			<div id = "titleshow${menu.menu }" style="display:block"><h4>${menu.menu } [이미지 없음]</h4><div id ="imgdiv${menu.menu}" style="display:block"></div></div>
			                        			<div id = "titlehide${menu.menu }" style="display:none;"><input type = "text" id="${menu.menucount}" style = "width:30%;" class="form-control form-control-user" value ="${menu.menu}" maxlength = "20" oninput="numberMaxLength(this);"><div id ="changemiribogi${file[status.index].uploadNum }"></div></div>
			                        			</td>
			                        		</c:otherwise>
			                        	</c:choose>
                                            <td style = "width:30%;">
                                            <div id = "priceshow${menu.menu}" style="display:block"><fmt:formatNumber value="${menu.menuprice}" pattern="#,###"/>원</div>
                                            <div id = "pricehide${menu.menu}" style="display:none"><input type="text" id="menuprice${menu.menucount }" style = "width:50% ;display:inline;"  onkeyup='onlyNumber(this)' value="<fmt:formatNumber value="${menu.menuprice}" pattern="#,###"/>" class="form-control form-control-user" maxlength = "8"><span>원</span></div>
                                            <input type = "hidden" id="defaultmenuprice${menu.menucount }" value = "<fmt:formatNumber value="${menu.menuprice}" pattern="#,###"/>">
                                            </td>
			                        	<td style = "width:10%;">
                                            <button class="btn btn-primary" id="change${file[status.index].uploadNum }" onclick="fnchange('${file[status.index].saveFile }','${file[status.index].saveFolder}','${file[status.index].uploadNum}','${menu.menu }','${menu.menuprice }','${menu.menucount}')">수정</button>
                                            <button class="btn btn-danger" id="delete${menu.menu}" onclick="fndelete('${menu.menu}','${file[status.index].uploadNum }','${file[status.index].saveFile }')">메뉴 삭제</button>
                        					<div id="changediv${file[status.index].uploadNum }" style="display:none">
                        					<input type = "file" name = "imagechange" id = "imagechange${file[status.index].uploadNum }" onchange = "fnimgchange('${file[status.index].saveFile }','${file[status.index].saveFolder}','${file[status.index].uploadNum}','${menu.menu }')" >
                        					<button class="btn btn-info" onclick="fncomplete('${file[status.index].saveFile }','${file[status.index].saveFolder}','${file[status.index].uploadNum}','${menu.menu }','${menu.menucount }','${menu.menuprice }')">완료</button>
                        					</div>
                                        </td>
                                    	</tr>
                                    	<input type = "hidden" id = "menuvalue" value = "${menu.menu}">
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <hr>
                            <div class = "form-group row">
                            	<div class = "col-sm-6 mb-3 mb-sm-0">
                            		<input type = "text" id="addmenu" name = "menu" class="form-control form-control-user" placeholder="메뉴를 입력해주세요." maxlength = "40" oninput="numberMaxLength(this);">
                            	</div>
                            	<div class = "col-sm-4">
                            		<input type="text" id="menuprice" name="menuprice" onkeyup='onlyNumber(this)' class="form-control form-control-user" placeholder="메뉴의 가격을 입력해주세요." maxlength = "8" style = "width:90% ;display:inline;">원
                            	</div>
                            	<div class = "col-sm-2">
                            		<button class="btn btn-primary" id="add">메뉴 추가</button>
                            	</div>
                            </div>
                            <input type = "file" id="imageadd" name = "image" onchange = "miribogi(event)">
                        </div>
                        <div id = "image_container"></div>
                    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->


        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->


</body>

<script>

function numberMaxLength(e){
    if(e.value.length > e.maxLength){
        e.value = e.value.slice(0, e.maxLength);
    }

}

function miribogi(event){
	var fileForm = /(.*?)\.(jpg|jpeg|png|JPG|JPEG|PNG)$/;
	var maxSize = 5 * 1024 * 1024;
	var imgfile = $("#imageadd").val();
	if(imgfile == "" || imgfile == null){
		 $("#image_container").empty();
	}else{
		var filesize = document.getElementById("imageadd").files[0].size;
		if(!imgfile.match(fileForm)){
			alert("이미지 파일만 등록 가능 합니다.");
			$("#imageadd").val("");
			$("#image_container").empty();
		}else if(filesize>maxSize){
			alert("5MB미만 파일만 등록 가능합니다.");
			$("#imageadd").val("");
			$("#image_container").empty();
		}else{
		 var reader = new FileReader();
		 
		 reader.onload = function(event){
			 var img = document.createElement("img");
			 img.setAttribute("src",event.target.result);
			 img.setAttribute("class", "col-lg-6");
			 img.setAttribute("style", "width:250px; height:150px;");
			 $("#image_container").empty();
			 document.querySelector("div#image_container").appendChild(img);
		 };
		 
		 reader.readAsDataURL(event.target.files[0]);
		}	
	}
	
}

$("#addmenu").focus();

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

function fnReplace(val) {
	var ret = 0;
	if(typeof val != "undefined" && val != null && val != ""){
		ret = Number(val.replace(/,/gi,''));
	}
	return ret;		
}

$("#menuprice").keydown(function(keynum){
	if(keynum.which == 13){
		$("#add").click();
	}
})

	var sockJs = new SockJS("/stomp/chat");
	var stomp = Stomp.over(sockJs);
	var roomId = $("#roomId").val();
		
			$("#add").on("click", function(e){
				var roomId = $("#roomId").val();
				var menu = $("#addmenu").val().replace(/^\s+|\s+$/gm,'');
				$("#menuprice").val(fnReplace($("#menuprice").val()))
				var menuprice = $("#menuprice").val();
				var fileForm = /(.*?)\.(jpg|jpeg|png|JPG|JPEG|PNG)$/;
				var maxSize = 5 * 1024 * 1024;
				
				if(menu.replace(/\s|/gi, "").length == 0){
					alert("메뉴를 입력해주세요.");
					$("#addmenu").focus();
					$("#addmenu").val("");
					$("#menuprice").val("");
				}else if($("#menuprice").val() == "" || $("#menuprice").val() == null || $("#menuprice").val() == 0){
					alert("메뉴 가격을 입력해주세요.");
					$("#menuprice").val("");
					$("#menuprice").focus();
				}else if(menu.indexOf("<") !== -1 || menu.indexOf(">") !== -1){
					alert("<> 문자는 사용할 수 없습니다.");
					$("#addmenu").focus();
					$("#addmenu").val("");
					$("#menuprice").val("");
				}else if($("#imageadd").val() == "" || $("#imageadd").val() == null){
					if(confirm("이미지파일을 선택하지 않으셨습니다. 이미지 없이 메뉴를 등록하시겠습니까?")==true){
					menu = menu.replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');	
					var formData = new FormData();
					formData.append("roomId",roomId);
					formData.append("menu",menu);
					formData.append("menuprice",menuprice);
					$.ajax({
						type : "POST",
						url : "addmenu",
						data : formData,
						processData : false,
						contentType : false,
						success : function(res){
							if(res === "success"){
							$("#menuList").load(location.href + " #menuList");
							$("#addmenu").val("");
							$("#menuprice").val("");
							$("#addmenu").focus();
							$("#imageadd").val("");
							$("#image_container").empty();
							stomp.send('/pub/chat/menuselect', {}, JSON.stringify({chatRoomId : roomId}));
							alert(menu+"를 추가완료했습니다.");
							}else{
								$("#addmenu").val("");
								$("#menuprice").val("");
								$("#addmenu").focus();
								$("#imageadd").val("");
								$("#image_container").empty();
								alert("중복된 메뉴 이름은 사용할 수 없습니다.")
							}
						},
						error : function(XMLHttpRequest, textStatus, errorThrown){
							alert("메뉴명을 다시 확인해주세요.");
						}
					});
					}else{
						alert("메뉴 등록을 취소하였습니다.")
					}
				}else{
					var imgfile = $("#imageadd").val();
					var filesize = document.getElementById("imageadd").files[0].size;
					if(!imgfile.match(fileForm)){
						alert("이미지 파일만 등록 가능 합니다.");
						$("#imageadd").val("");
						$("#image_container").empty();
					}else if(filesize>maxSize){
						alert("5MB미만 파일만 등록 가능합니다.");
						$("#imageadd").val("");
						$("#image_container").empty();
					}else{
						var formData = new FormData();
						menu = menu.replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
						formData.append("imageadd",$("#imageadd")[0].files[0]);
						formData.append("roomId",roomId);
						formData.append("menu",menu);
						formData.append("menuprice",menuprice);
						$.ajax({
							type : "POST",
							url : "addmenu",
							data : formData,
							
							processData : false,
							contentType : false,
							
							success : function(res){
								if(res === "success"){
								$("#menuList").load(location.href + " #menuList");
								$("#addmenu").val("");
								$("#menuprice").val("");
								$("#addmenu").focus();
								$("#imageadd").val("");
								$("#image_container").empty();
								stomp.send('/pub/chat/menuselect', {}, JSON.stringify({chatRoomId : roomId}));
								alert(menu+"를 추가완료했습니다.");
								}else{
									$("#addmenu").val("");
									$("#menuprice").val("");
									$("#addmenu").focus();
									$("#imageadd").val("");
									$("#image_container").empty();
									alert("중복된 메뉴이름은 사용할 수 없습니다.");
								}
							},
							error : function(XMLHttpRequest, textStatus, errorThrown){
								alert("메뉴명을 다시 확인해주세요.");
							}
						});
					}
				}
			});
			
			function fndelete(menu,uploadNum,saveFile){
				var menu = menu.replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
				if(confirm(menu+"를 삭제하시겠습니까?")){
				$.ajax({
					type : "POST",
					url : "deletemenu",
					data : {roomId : roomId,
							menu : menu,
							uploadNum : uploadNum,
							saveFile : saveFile },
					async : false,
					success : function(data){
						if(data === "success"){
							$("#menuList").load(location.href + " #menuList");
							stomp.send('/pub/chat/menuselect', {}, JSON.stringify({chatRoomId : roomId}));
							alert(menu+"를 삭제완료했습니다.");	
						}else{
							alert("메뉴가 반드시 한개 이상은 있어야합니다.")
						}
					},
					error : function(error){
						alert("통신실패");
					}
				});
				}
				
			}
			
			function fncomplete(saveFile,saveFolder,uploadNum,originmenu,menucount,originmenuprice){
				var changemenu = document.getElementById(menucount).value.replace(/^\s+|\s+$/gm,'');
				$("#menuprice"+menucount).val(fnReplace($("#menuprice"+menucount).val()));
				console.log($("#menuprice"+menucount).val());
				var menuprice = $("#menuprice"+menucount).val();
				var fileForm = /(.*?)\.(jpg|jpeg|png|JPG|JPEG|PNG)$/;
				var maxSize = 5 * 1024 * 1024;
				var imgfile = $("#imagechange"+uploadNum).val();
				if(changemenu.replace(/\s|/gi, "").length == 0){
					alert("메뉴를 입력해주세요.");
					$("#"+menucount).focus();
					$("#"+menucount).val("");
					$("#menuprice"+menucount).val("");
				}else if(menuprice == 0 || menuprice == null){
					alert("가격을 입력해주세요.");
					$("#menuprice"+menucount).focus();
					$("#menuprice"+menucount).val("");
				}else if(changemenu.indexOf("<") !== -1 || changemenu.indexOf(">") !== -1){
					alert("< > 문자는 사용할 수 없습니다.");
					$("#"+menucount).focus();
					$("#"+menucount).val("");
					$("#menuprice"+menucount).val("");
				}else if(imgfile == "" || imgfile == null){
					if(confirm("이미지파일을 선택하지 않으시면 기존의 이미지로 등록됩니다. 수정하시겠습니까?")==true){
					originmenu = originmenu.replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
					changemenu = changemenu.replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
					
					$.ajax({
						type : "post",
						url : "menuchange",
						data : {roomId : $("#roomId").val(),
								menu : originmenu,
								changemenu : changemenu,
								menuprice : menuprice,
								originmenuprice : originmenuprice},					
						success : function(data){
								$("#menuList").load(location.href + " #menuList");
								stomp.send('/pub/chat/menuselect', {}, JSON.stringify({chatRoomId : roomId}));
								alert("성공적으로 수정되었습니다.");
						},
						error : function(error){
							
						}
					});
					}else{
						alert("수정이 취소되었습니다.");
					}
				}else{
					var filesize = document.getElementById("imagechange"+uploadNum).files[0].size;
					
					if(!imgfile.match(fileForm)){
						alert("이미지 파일만 업로드 해주세요.");
						$("#imagechange"+uploadNum).val("");
					}else if(filesize>maxSize){
						alert("5MB미만 파일만 등록 가능 합니다.")
						$("#imagechange"+uploadNum).val("");
					}else{
					if(confirm("수정하시면 되돌릴수 없습니다. 수정하시겠습니까?") == true){
					originmenu = originmenu.replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
					changemenu = changemenu.replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
					var formData = new FormData();
					formData.append("file",$("#imagechange"+uploadNum)[0].files[0]);
					formData.append("roomId",$("#roomId").val());
					formData.append("saveFile",saveFile);
					formData.append("saveFolder",saveFolder);
					formData.append("uploadNum",uploadNum);
					formData.append("menu",originmenu);
					formData.append("changemenu",changemenu);
					formData.append("menuprice",menuprice);
					formData.append("originmenuprice",originmenuprice);
					
					
					$.ajax({
						type : "post",
						url : "imagechange",
						data : formData,
						
						processData : false,
						contentType : false,
						
						success : function(data){
							if(data === "success"){
								$("#menuList").load(location.href + " #menuList");
								stomp.send('/pub/chat/menuselect', {}, JSON.stringify({chatRoomId : roomId}));
							}
						},
						error : function(error){
							
						}
					});	
					}else{
						alert("변경을 취소하였습니다.");
						$("#imagechange"+uploadNum).val("");
						$("#changemiribogi"+uploadNum).empty();
						}
					}
				}
			}
			
			
			
			function fnchange(saveFile,saveFolder,uploadNum,menu,menuprice,menucount){
				var titleshow = document.getElementById("titleshow"+menu);
				var titlehide = document.getElementById("titlehide"+menu);
				var priceshow = document.getElementById("priceshow"+menu);
				var pricehide = document.getElementById("pricehide"+menu);
				var changediv = document.getElementById("changediv"+uploadNum);
				const changename = document.getElementById("change"+uploadNum);
				var imgdiv = document.getElementById("imgdiv"+menu);
				var defaultmenuprice = $("#defaultmenuprice"+menucount).val();
				
				if(titleshow.style.display=='block'){
					titleshow.style.display = 'none';
					priceshow.style.display = 'none';
					changediv.style.display = 'block';
					titlehide.style.display = 'block';
					pricehide.style.display = 'block';
					$("#"+menucount).focus();
					changename.innerText = '수정취소';
				}else{
					titleshow.style.display = 'block';
					priceshow.style.display = 'block';
					changediv.style.display = 'none';
					titlehide.style.display = 'none';
					pricehide.style.display = 'none';
					changename.innerText = '수정';
					imgdiv.style.display = 'block';
					$("#changemiribogi"+uploadNum).empty();
					$("#imagechange"+uploadNum).val("");
					$("#"+menucount).val(menu);
					$("#menuprice"+menucount).val(defaultmenuprice);
					
					
				}
				
			}
			
			
			
			function fnimgchange(saveFile,saveFolder,uploadNum,menu){
				var imgdiv = document.getElementById("imgdiv"+menu);
				var fileForm = /(.*?)\.(jpg|jpeg|png|JPG|JPEG|PNG)$/;
				var maxSize = 5 * 1024 * 1024;
				var imgfile = $("#imagechange"+uploadNum).val();
				if(imgfile == "" || imgfile == null){
					$("#changemiribogi"+uploadNum).empty();
				}else{
					var filesize = document.getElementById("imagechange"+uploadNum).files[0].size;
					if(!imgfile.match(fileForm)){
						alert("이미지 파일만 업로드 해주세요.");
						$("#imagechange"+uploadNum).val("");
					}else if(filesize>maxSize){
						alert("5MB미만 파일만 등록 가능 합니다.")
						$("#imagechange"+uploadNum).val("");
					}else{
						var reader = new FileReader();
				 
						reader.onload = function(event){
					 	var img = document.createElement("img");
					 	img.setAttribute("src",event.target.result);
					 	img.setAttribute("class", "col-lg-6");
					 	img.setAttribute("style", "width:250px; height:150px;");
					 	$("#changemiribogi"+uploadNum).empty();
					 	document.querySelector("div#changemiribogi"+uploadNum).appendChild(img);
				 };
				 		imgdiv.style.display = 'none';
				 		reader.readAsDataURL(event.target.files[0]);
				 		
					}	
				}
			}
		


</script>
</html>