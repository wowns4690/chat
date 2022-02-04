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
<script src="../resources/jquery-3.6.0.min.js"></script>
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
        
<%--
<body>
		<input hidden="hidden">
		<input type ="text" id = "email" name="mberEmail" onkeyup="enterkey()" maxlength="30">
		<button type="button" onclick="fnemailCheck()" class="btn btn-outline-info">이메일 입력</button>
</body>
--%>

<body class="bg-gradient-light">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    
                                    <form class="user" id = "checkform" method = "POST" onsubmit="return false">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="email" 
                                                placeholder="이메일을 입력해주세요." onkeyup = "enterkey()" maxlength = "40">
                                        </div>
                                        <hr>
                                         <button type="button" onclick="fnemailCheck()" class="btn btn-primary btn-user btn-block">이메일 입력</button>                                    
                                    </form>                                                                        
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
function fnemailCheck(){
	var email = $("#email").val();
	var emailExp =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(email =="" || email == null){
		alert("이메일을 입력해주세요.");
		$("#email").focus();
	}else if(email.match(emailExp) == null){
		alert("유효하지 않는 이메일입니다.");
		$("#email").val("");
		$("#email").focus();
	}else{
		$.ajax({
			type : "POST",
			url : "emailCheck",
			data : {mberEmail : $("#email").val()} ,
			success : function(res){
				console.log(res);
				if(res === ""){
					window.opener.document.getElementById("mberEmail").value = $("#email").val();
					self.close()
					alert("사용가능한 이메일 입니다.");
				}else{
					alert("중복된 이메일 입니다.")
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown){
				alert("통신실패");
			}
		});
	}
}

$(document).ready(function(){
	$("#email").focus();
});

function enterkey(){
	if(window.event.keyCode == 13){	
		fnemailCheck();
	}
}
</script>

</html>