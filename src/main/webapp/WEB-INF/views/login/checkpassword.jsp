<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원정보 수정</title>

    <!-- Custom fonts for this template-->
    <link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">
    
     <!-- Bootstrap core JavaScript-->
    <script src="../resources/vendor/jquery/jquery.min.js"></script>
    <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../resources/js/sb-admin-2.min.js"></script>

<%-- 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>로그인</title>
</head>
<script type="text/javascript">
  history.replaceState({}, null, location.pathname);
</script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
--%>

<%--   
<body>
	<form id ="loginView" class="table"  method="post">
		<c:if test="${empty member  }">
			<div class="form-group">
				<label for = "userId"></label>
				<input type="text" id="idView" name="mberId" placeholder="아이디를 입력해주세요." maxlength="12" required>
				<input type="hidden" id="msg" value ="${msg }">
			</div>
			<div>
				<label for = "userpass"></label>
				<input type="password" id="psswrdView" name="mberPw" placeholder="비밀번호를 입력해주세요." onkeyup = "enterkey()" maxlength="20" required>
			</div>
			<button type="button" id="login" onclick = "fnLogin()" class="btn btn-outline-info">로그인</button>
		</c:if>
		<c:if test="${!empty member   }">
			<%
    			response.sendRedirect("/websocket/rooms");    
			%>
		</c:if>
		<button type="button" onclick="location.href='/login/registerView'" class="btn btn-outline-info">회원가입</button>
		<button type="button" onclick="fnFindId()" class="btn btn-outline-info">아이디 찾기</button>
		<button type="button" onclick="fnFindPassword()" class="btn btn-outline-info">비밀번호 찾기</button>
	</form>
</body>
--%>

<body class="bg-gradient-light">
<input type = "hidden" id = "startpage" value = "${startpage }">
<input type = "hidden" id = "roomId" value = "${roomId }">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">회원 정보 수정</h1>
                                    </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="psswrdView" name="mberPw" placeholder="비밀번호를 입력해주세요." onkeyup = "enterkey()" maxlength="20" required>
                                        </div>                                     
                                        <button type="button" id="login" onclick = "fnLogin()" class="btn btn-primary btn-user btn-block">비밀번호 확인</button>
                                    <hr>
                                    <c:if test = "${startpage eq 'rooms' }">
                                    <button type="button" onclick="location.href='/websocket/mypage?startpage=${startpage}'" class="btn btn-danger btn-user btn-block">마이페이지로 돌아가기</button>
                                    </c:if>
                                    <c:if test = "${startpage eq 'room' }">
                                    <button type="button" onclick="location.href='/websocket/mypage?startpage=${startpage}&roomId=${roomId }'" class="btn btn-danger btn-user btn-block">마이페이지로 돌아가기</button>
                                    </c:if>
                                    <c:if test = "${startpage eq 'newroom' }">
                                    <button type="button" onclick="location.href='/websocket/mypage?startpage=${startpage}'" class="btn btn-danger btn-user btn-block">마이페이지로 돌아가기</button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
		
</body>

<script>

function fnLogin(){
	var id = $("#idView").val();
	var password = $("#psswrdView").val();
	var idRegExp = /^[a-zA-z0-9]{8,12}$/;
	var psnum = password.search(/[0-9]/g);
	var pseng = password.search(/[a-z]/ig);
	var psspe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	if(password.length < 8 || password.length > 20){
	alert("비밀번호는 8~20자리 이내로 입력해주세요");
	$("#psswordView").focus();
	}else if(password.search(/\s/)!= -1){
	alert("비밀번호는 공백 없이 입력해주세요.");
	$("#psswordView").focus();
	}else if(psnum < 0 || pseng < 0 || psspe < 0){
	alert("비밀번호는 영문,숫자,특수문자를 혼합하여 입력해주세요.");
	$("#psswordView").focus();
	}else{
		$.ajax({
			type : "POST",
			url : "checkpassword",
			data : {mberPw : password},
			success : function(res){
				if(res === "fail"){
					alert("비밀번호를 다시한번 확인해주세요.");
					$("#psswrdView").val("");
					$("#psswrdView").focus();
				}else if(res === "success"){
					var form = document.createElement('form'); // 폼객체 생성
					var objs;
					objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
					objs.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
					objs.setAttribute('name', 'mberPw'); // 객체이름
					objs.setAttribute('value', $('#psswrdView').val()); //객체값
					form.appendChild(objs);
					form.setAttribute('method', 'post'); //get,post 가능
					form.setAttribute('action', "/login/memberupdateView?startpage="+$("#startpage").val()+"&roomId="+$("#roomId").val()); //보내는 url
					document.body.appendChild(form);
					form.submit();

				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown){
				
			}
		});
	}
}



$(document).ready(function(){
	$("#psswrdView").focus();
});

function enterkey(){
	if(window.event.keyCode == 13){
		fnLogin();
	}
}
</script>
</html>