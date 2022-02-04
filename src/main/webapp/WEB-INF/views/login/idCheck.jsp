<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%--
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>아이디 확인</title>
</head>
<script type="text/javascript">
  history.replaceState({}, null, location.pathname);
</script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    --%>
    
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>아이디 찾기</title>

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
        
<script>
function fnidCheck(){
	var idRegExp = /^[a-zA-z0-9]{8,12}$/;
	var id = $("#idView").val();
	console.log(id);
	if(!idRegExp.test(id)){
		alert("아이디는 영문 대소문자와 숫자 8~12자리로 입력해야합니다.");
	}else{
		$("#checkform").attr("action","/login/idCheck").submit();
	}
}
window.onload = function(){
var msg = $("#checkstatus").val();
	if(msg === "true"){
		$("#idView").attr("readonly",true);
		var id = $("#idView").val();
		var register = window.opener;
		window.opener.document.getElementById("idView").value = id;
		self.close()
		alert("사용가능한 아이디입니다.");
	}else if(msg === "false"){
		$("#idView").val("");
		alert("중복된 아이디 입니다.");
	}
}

$(document).ready(function(){
	$("#idView").focus();
});

function enterkey(){
	console.log($("#idView").val());
	if(window.event.keyCode == 13){
		fnidCheck();
	}
}
</script>
<%--
<body>
	<form id = "checkform" method = "post">
		<input hidden="hidden">
		<input type ="text" id = "idView" name="id" value = "${id }" onkeyup="enterkey()" maxlength="12">
		<button type="button" onclick="fnidCheck()" class="btn btn-outline-info">아이디 입력</button>
		<input type ="hidden" id="checkstatus" value="${msg }" readonly>
	</form>
</body>
--%>

<body class="bg-gradient-light">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    
                    <div class="col-lg-12">
                        <div class="p-5">                           
                            <form class="user" id = "checkform" method="post"> 
                            <input hidden="hidden">                        
                            <!-- 아이디 중복확인 및 아이디 등록  -->    
                                <div class="form-group">                                                                	
                                	<input class="form-control form-control-user" type ="text" id = "idView" name="id" value = "${id }" onkeyup="enterkey()" maxlength="12" placeholder="아이디는 영문 대소문자와 숫자 8~12자리로 입력해야합니다.">
                                </div>
                                <input type ="hidden" id="checkstatus" value="${msg }" readonly>                               							    
                                <hr>
                                <button type="button" onclick="fnidCheck()" class="btn btn-primary btn-user btn-block">아이디 입력</button>                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    
</html>