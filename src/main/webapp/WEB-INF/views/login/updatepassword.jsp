<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

    <title>비밀번호 변경</title>

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

<body class="bg-gradient-light">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">                    
                    <div class="col-lg-12">
                        <div class="p-5">                           
                            <form class="user" id="update" method="post">                                                   
								<input hidden = "hidden">
								<input type="hidden" id="mberId" name="mberId" value="${mberId }">
								<input type="hidden" id="mberEmail" name="mberEmail" value="${mberEmail }">
								<input type="hidden" id="authKey" name="authKey" value="${authKey }">
								<input type="password" class="form-control form-control-user" id="nowpassword" name="mberPw" maxlength="20" placeholder="현재 비밀번호">   
								<hr> 
							<!-- 비밀번호 등록  -->	                                                                                          
                            		<div class="form-group" id="psck">                            							
										<input type="password" class="form-control form-control-user" id="passwordView" name="changePw" maxlength="20" placeholder="새 비밀번호">									
										<input type="password" class="form-control form-control-user" id="passwordcheckView" name="psswrdcheck" maxlength="20" placeholder="새 비밀번호 확인">						
									</div>						
									<div class="alert alert-success" id="alert-true">사용가능한 비밀번호 입니다.</div>
									<div class="alert alert-danger" id="alert-fail">비밀번호는 공백 없이 숫자 영어 특수문자를 혼합하여 최소8자 최대 20자 입니다.</div>
									<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
									<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
		
							<!-- 비밀번호 수정 -->		  							                                                             							                                                       
                                <hr>
                                <button type="button" onclick="fnupdate()" class="btn btn-primary btn-user btn-block">비밀번호 수정</button>
                                <hr>
                                <c:if test = "${startpage eq 'rooms' }">
                                    <button type="button" onclick="location.href='/websocket/mypage?startpage=${startpage}'" class="btn btn-danger btn-user btn-block">돌아가기</button>
                                </c:if>
                                <c:if test = "${startpage eq 'room' }">
                                    <button type="button" onclick="location.href='/websocket/mypage?startpage=${startpage}&roomId=${roomId }'" class="btn btn-danger btn-user btn-block">돌아가기</button>                           
                                </c:if>
                                <c:if test = "${startpage eq 'newroom' }">
                                    <button type="button" onclick="location.href='/websocket/mypage?startpage=${startpage}'" class="btn btn-danger btn-user btn-block">돌아가기</button>                           
                                </c:if>                                 
                            </form>                                              
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
<script>
function fnupdate(){
	var password = $("#passwordView").val();
	var pscheck = $("#passwordcheckView").val();
	var nowpassword = $("#nowpassword").val();
	var psnum = password.search(/[0-9]/g);
	var pseng = password.search(/[a-z]/ig);
	var psspe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    if(password.length < 8 || password.length > 20){
	    $("#passwordView").focus();
		$("#passwordView").val(null);
		$("#passwordcheckView").val(null);
		alert("비밀번호는 8~20자리 이내로 입력해주세요");
	}else if(password.search(/\s/)!= -1){
		$("#passwordView").focus();
		$("#passwordView").val(null);
		$("#passwordcheckView").val(null);
		alert("비밀번호는 공백 없이 입력해주세요.");
	}else if(psnum < 0 || pseng < 0 || psspe < 0){
		$("#passwordView").focus();
		$("#passwordView").val(null);
		$("#passwordcheckView").val(null);
		alert("비밀번호는 영문,숫자,특수문자를 혼합하여 입력해주세요.");
	}else if(password != pscheck){
		$("#passwordView").focus();
		$("#passwordView").val(null);
		$("#passwordcheckView").val(null);
		alert("비밀번호가 같은지 확인해주세요.")	
	}else{
		$.ajax({
			type : "POST",
			url : "updatepassword",
			data : {mberPw : nowpassword,
					changePw : password},		
			success : function(res){
				if(res === "fail"){
					alert("현재 비밀번호를 다시 확인해주세요. ");
					$("#nowpassword").val("");
					$("#passwordView").val("");
					$("#passwordcheckView").val("");
					$("#nowpassword").focus();
				}else if(res === "success"){
					alert("비밀번호 변경이 완료되었습니다.");
					alert("다시 로그인 해주세요.");
					location.href = "/login/loginView";
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown){
				
			}
		});
	}
}


$(function(){
	var psRegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
	$("#alert-success").hide();
	$("#alert-danger").hide();
	$("#alert-fail").hide();
	$("#alert-true").hide();
	$("#psck").keyup(function(){
		var pwd1 = $("#passwordView").val();
		var pwd2 = $("#passwordcheckView").val();
		
		if(!psRegExp.test(pwd1)){
			$("#alert-fail").show();
			$("#alert-true").hide();
			$("#alert-success").hide();
			$("#alert-danger").hide();
		}
		else if(psRegExp.test(pwd1)){
			$("#alert-fail").hide();
			$("#alert-true").show();
			if(pwd1 === pwd2){
				$("#alert-success").show();
				$("#alert-danger").hide();
				$("#alert-fail").hide();
				$("#alert-true").show();
			}
			else{
				$("#alert-success").hide();
				$("#alert-danger").show();
				$("#alert-fail").hide();
				$("#alert-true").show();
			}
		}else if(pwd1 == null || pwd1 == "" || pwd2 == null || pwd2 == ""){
			$("#alert-success").hide();
			$("#alert-danger").hide();
			$("#alert-fail").hide();
			$("#alert-true").hide();
		}
	})
})

$(document).ready(function(){
	$("#nowpassword").focus();
});

function enterkey(){
	if(window.event.keyCode == 13){
		fnupdate();
	}
}
</script>

</html>