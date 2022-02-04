<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<%-- 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>회원가입</title>
</head>
<script type="text/javascript">
  history.replaceState({}, null, location.pathname);
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../resources/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
--%>


	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원가입</title>

    <!-- Custom fonts for this template-->
    <link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">

<script src="../resources/jquery-3.6.0.min.js"></script>

<script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../resources/js/sb-admin-2.min.js"></script>


<%--
<body>
	<form id="idcheck" method="post">
	<input type="hidden" id="idcheckval" name="id" value="">
	</form>

	<form id = "register" class="center" method="post" action="/login/register">
 
		<!-- 아이디 중복확인 및 아이디 등록  -->
		<div class="form-group">
			<label>아이디</label>
			<input type="text" class="form-control" id="idView" name="mberId" placeholder="아이디를 입력해주세요." value="" onkeyup="enterkey()" readonly>
			<button type="button" onclick="findCheckView()" class="btn btn-outline-info">아이디 입력하기</button>
		</div>
		<!-- 비밀번호 등록  -->
		<div class="form-group" id="psck">
			<label>비밀번호(비밀번호는 공백 없이 숫자 영어 특수문자를 혼합하여 최소 8자 최대 20자 입니다)</label>
			<input type="password" class="form-control" id="passwordView" name="mberPw" maxlength="20" placeholder="비밀번호는 공백 없이 숫자 영어 특수문자를 혼합하여 최소 8자 최대 20자 입니다">
			<input type="password" class="form-control" id="passwordcheckView" name="psswrdcheck" maxlength="20" placeholder="비밀번호를 다시 한번 입력해주세요.">
		</div>
		<div class="alert alert-success" id="alert-true">사용가능한 비밀번호 입니다.</div>
		<div class="alert alert-danger" id="alert-fail">비밀번호는 공백 없이 숫자 영어 특수문자를 혼합하여 최소8자 최대 20자 입니다.</div>
		<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
		<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
		
		<!-- 이름 등록 -->
		<div class="form-group">
			<label>이름</label>
			<input type="text" class="form-control" id="nameView" name="mberName" maxlength="12" placeholder="이름을 입력해주세요." >
		</div>
		
		<!-- 회사 주소  -->
		<div class="form-group">
			<label>직장 주소</label>
			<input type="text" class="form-control" id="cAdress" name="cAdress" maxlength="50" placeholder="직장 주소를 입력해주세요." readonly>
		</div>
		
		<!-- 직급  -->
		<div class="form-group">
			<label>직급</label>
			<input type="text" class="form-control" id="mberRank" name="mberRank" maxlength="50" placeholder="직장 내의 직급을 입력해주세요." >
		</div>
		
		<!-- 이메일  -->
		<div class="form-group">
			<label>이메일</label>
			<input type="text" class="form-control" id="mberEmail" name="mberEmail" maxlength="50" placeholder="본인확인용 이메일을 입력해주세요." onfocus="emailcheck()" readonly >
		</div>
		
		<!-- 비밀번호 찾기 질문  -->
		<div class="form-group">
			<label>본인확인 질문</label>
			<select id="psqView" name="psQ" onchange="">
				<option value="Dname">아버지 성함은 무엇입니까?</option>
				<option value="Mname">어머니 성함은 무엇입니까?</option> 
				<option value="Sname">출신 초등학교 이름은 무엇입니까?</option>
				<option value="Movie">감명깊게 본 영화는 무엇입니까?</option>
				<option value="Book">감명깊게 읽은 책은 무엇입니까?</option>
			</select>	
		</div>
		
		<!-- 비밀번호 찾기 답변  -->
		<div class="form-group">
			<label>본인확인 답변</label>
			<input type="text" class="form-control" id="psaView" name="psA" maxlength="20" onkeyup="enterkeyregister()" placeholder="답변을 입력해주세요" />	
		</div>
		
		<button type="button" onclick="fnRegister()" class="btn btn-outline-info">등록</button>
		<button type="button" onclick="location.href='/login/loginView'" class="btn btn-outline-info">돌아가기</button>
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
                            <form class="user" id = "register" method="post" action="/login/register">                         
                            <!-- 아이디 중복확인 및 아이디 등록  -->    
                                <div class="form-group">                                
                                	<input type="text" class="form-control form-control-user" id="idView" name="mberId" placeholder="아이디를 입력해주세요." value="" onkeyup="enterkey()" readonly>
                                </div>                               
                                <div class="form-group">                               	
									<button type="button" onclick="findCheckView()" class="btn btn-primary btn-user btn-block">아이디 입력하기</button>
								</div>
							    
							<!-- 비밀번호 등록  -->	                                                                                          
                            		<div class="form-group" id="psck">                            							
										<input type="password" class="form-control form-control-user" id="passwordView" name="mberPw" maxlength="20" placeholder="비밀번호는 공백 없이 숫자 영어 특수문자를 혼합하여 최소 8자 최대 20자 입니다">									
										<input type="password" class="form-control form-control-user" id="passwordcheckView" name="psswrdcheck" maxlength="20" placeholder="비밀번호를 다시 한번 입력해주세요.">						
									</div>						
									<div class="alert alert-success" id="alert-true">사용가능한 비밀번호 입니다.</div>
									<div class="alert alert-danger" id="alert-fail">비밀번호는 공백 없이 숫자 영어 특수문자를 혼합하여 최소8자 최대 20자 입니다.</div>
									<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
									<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
									
							<!-- 이름 입력하기  -->
                                <div class="form-group">                                
                                        <input type="text" class="form-control form-control-user" id="nameView"
                                            placeholder="이름을 입력해주세요." maxlength="12">                                                                       
                                </div> 		
                                
                            <!-- 회사 주소  -->
									<div class="form-group">
										<input type="text" class="form-control form-control-user" id="cAdress" name="cAdress" maxlength="50" placeholder="직장 주소를 입력해주세요." readonly>
									</div>  
									
							<!-- 직급  -->
									<div class="form-group">									
										<input type="text" class="form-control form-control-user" id="mberRank" name="mberRank" maxlength="50" placeholder="직장 내의 직급을 입력해주세요." >
									</div>
									
							<!-- 이메일  -->
									<div class="form-group">										
										<input type="text" class="form-control form-control-user" id="mberEmail" name="mberEmail" maxlength="50" placeholder="본인확인용 이메일을 입력해주세요." onfocus="emailcheck()" readonly >
									</div>
									
							<!-- 비밀번호 찾기 질문  -->
									<div class="form-group">
									<label>본인확인 질문을 선택해주세요</label>									
										<select id="psqView"  name="psQ">
											<option value="Dname">아버지 성함은 무엇입니까?</option>
											<option value="Mname">어머니 성함은 무엇입니까?</option> 
											<option value="Sname">출신 초등학교 이름은 무엇입니까?</option>
											<option value="Movie">감명깊게 본 영화는 무엇입니까?</option>
											<option value="Book">감명깊게 읽은 책은 무엇입니까?</option>
										</select>	
									</div>
									
							<!-- 비밀번호 찾기 답변  -->
									<div class="form-group">										
										<input type="text" class="form-control form-control-user" id="psaView" name="psA" maxlength="20" onkeyup="enterkeyregister()" placeholder="본인확인 질문에 대한 답변을 입력해주세요" />	
									</div>
							<!-- 회원 등록 버튼 -->		  							                                                             
                                <button type="button" onclick="fnRegister()" class="btn btn-primary btn-user btn-block">회원가입</button>                                
                                <hr>
                                <button type="button" onclick="location.href='/login/loginView'" class="btn btn-danger btn-user btn-block">돌아가기</button>                                
                            </form>
                            <hr>                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

<script>
window.onload = function(){
    document.getElementById("cAdress").addEventListener("focus", function(){
        $("#mberRank").focus();
        new daum.Postcode({
            oncomplete: function(data) { 
                document.getElementById("cAdress").value = data.address; 
                $("#mberRank").focus();
            }
        }).open();
    });
}
</script>

<script>
var isRun = false;
function fnRegister(){
	if(isRun == true){
		return;
	}
	isRun = true;
	var checkstatus = $("#checkstatus").val();
	var no = "중복된 아이디 입니다.";	
	var id = $("#idView").val();
	var password = $("#passwordView").val();
	var pscheck = $("#passwordcheckView").val();
	var psnum = password.search(/[0-9]/g);
	var pseng = password.search(/[a-z]/ig);
	var psspe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	var name = $("#nameView").val();
	var psq = $("#psqView").val();
	var psa = $("#psaView").val();
	var checkid = id.trim();
	var checkps = password.trim();
	var checknm = name.trim();
	var idRegExp = /^[a-zA-z0-9]{4,12}$/;
	var msg2 = $("#msg2").val();
		if($("#idView").val() == "" || $("#idView").val()==null){
			alert("아이디를 입력해주세요.")
		}else if(password.length < 8 || password.length > 20){
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
		}else if(checknm == "" || checknm==null){
			$("#nameView").focus();
			alert("이름을 입력해주세요.");
		}else if($("#cAdress").val()=="" || $("#cAdress").val()==null){
			$("#cAdress").focus();
			alert("직장주소를 입력해주세요.");
		}else if($("#mberRank").val()=="" || $("#mberRank").val()==null){
			$("#mberRank").focus();
			alert("직장 내의 직급을 입력해주세요.");
		}else if($("#mberEmail").val()=="" || $("#mberEmail").val()==null){
			$("#mberEmail").focus();
			alert("본인확인용 이메일을 입력해주세요.");
		}else if($("#psqView").val()=="" || $("#psqView").val()==null){
			$("#psqView").focus();
			alert("본인확인 질문을 선택해주세요.");
		}else if($("#psaView").val()=="" || $("#psaView").val()==null){
			$("#psaView").focus();
			alert("본인확인 답변을 입력해주세요.");
		}else{
			$.ajax({
				type : "POST",
				url : "register",
				data : {mberId : id,
						mberPw : password,
						mberName : name,
						cAdress : $("#cAdress").val(),
						mberRank : $("#mberRank").val(),
						mberEmail : $("#mberEmail").val(),
						psQ : $("#psqView").val(),
						psA : $("#psaView").val()},	
				success : function(res){
					isRun = false;
					alert("회원가입이 완료되었습니다! 이메일 인증을 해주세요.");
					location.href = "loginView";
				},
				error : function(XMLHttpRequest, textStatus, errorThrown){
					alert("유효한 이메일인지 확인해주세요.");
				}
			});
			}
}

function fnidcheck(){
	var id = $("#idView").val();
	$("#idcheckval").val(id);
	$("#idcheck").attr("action","/login/registerView").submit();
}
function findCheckView(){
	window.name = "registerForm";
	var url="/login/idCheckView";
	var name = "idCheck.html";
	var option = "width = 530, height = 360, top = 100, left = 200, location = no";
	window.open(url, name, option);
	$("#passwordView").focus();
}

function emailcheck(){
    	window.name = "registerForm";
    	var url="/login/emailCheckView";
    	var name = "emailCheck.html";
    	var option = "width = 500, height = 500, top = 100, left = 200, location = no";
    	window.open(url, name, option);
    	$("#psqView").focus();
}


$(function(){
	var psRegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
	$("#alert-success").hide();
	$("#alert-danger").hide();
	$("#alert-true").hide();
	$("#alert-fail").hide();
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
		}
	})
})

$(document).ready(function(){
	$("#idView").focus();
});

function enterkey(){
		findCheckView();
}
function enterkeyregister(){
	if(window.event.keyCode == 13){
		fnRegister();
	}
}

function entercAdress(){
	if(window.event.keyCode == 13){
		findcAdress();
	}
}

function enterkeycncheck(){
		fnCnCheck();

}

</script>  

</html>