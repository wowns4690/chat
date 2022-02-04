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
<title>아이디 찾기</title>
</head>
<style>
input{width:300px; padding:5px; border:1px solid #dedede} 
input:read-only{background-color:#dedede} /* read-only style */ 
select{padding:7px; vertical-align:middle}
</style>
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

<script>
function fnFindId(){
   var emailExp =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
   var mberName = $("#mberName").val();
   var mberEmail = $("#email").val();
	if(mberName == "" || mberName==null){
		alert("이름을 입력해주세요.");
	}else if($("#email").val() == "" || $("#email").val() == null){
		alert("이메일을 입력해주세요.");
	}else if(mberEmail.match(emailExp) == null){
		alert("유효하지않는 이메일입니다.");
		$("#email").val("");
		$("#email").focus();
	}else{
		$.ajax({
			type : "POST",
			url : "Findid",
			data : {mberName : mberName,
					mberEmail : mberEmail},		
			success : function(res){
				if(res === "Noid"){
					alert("정보와 일치하는 아이디가 없습니다.");
					$("#mberName").val("");
					$("#email").val("");
					$("#mberName").focus();
				}else{				
					alert("회원님의 아이디는 " + res + " 입니다.");
					self.close();				
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown){
				alert("통신 에러");
			}
		});
	}
}
$(document).ready(function(){
	$("#mberName").focus();
});


function enterkey(){
	if(window.event.keyCode == 13){
		fnFindId();
	}
}

function selectEmail(ele){ 
	var $ele = $(ele); 
	var $emailback = $('#emailBack').val(); 
	// 'self'인 경우 직접입력 
	if($ele.val() == "self"){ 
		$("#emailBack").attr('readonly', false); 
		$("#emailBack").val(''); 
		} else { 
			$("#emailBack").attr('readonly', true); 
			$("#emailBack").val($ele.val()); 
			} 
	}

	

</script>

<body class="bg-gradient-light">

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
                                        <h1 class="h4 text-gray-900 mb-2">아이디 찾기</h1>                                        
                                    </div>
                                    <form class="user" id = "checkform" method = "post">
                                    <div class="form-group">										
										<input class="form-control form-control-user" type ="text" id="mberName" name="mberName" placeholder="이름을 입력해주세요." maxlength="15">
									</div>
									
									<div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="email" placeholder="이메일을 입력해주세요." onkeyup = "enterkey()" maxlength = "40">
                                        </div>							
								<button type="button" onclick="fnFindId()" class="btn btn-primary btn-user btn-block">아이디찾기</button>
                                    </form>
                                    <hr>                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>    

</body>
<%--
<body>
	<form id = "checkform" method = "post">
		<input hidden="hidden">
		<input type ="text" id="mberName" name="mberName" placeholder="이름을 입력해주세요." maxlength="15">
		<div>
		 <input type ="text" id="emailFront"  placeholder="이메일을 입력해주세요." maxlength="15">@
		 <input type ="text" id="emailBack"  placeholder="이메일을 입력해주세요." maxlength="15">
		 <select id="selectBack" onchange="selectEmail(this)">
		 		<option value="self">직접입력</option>
				<option value="naver.com">naver.com</option>
				<option value="kakao.com">kakao.com</option> 
				<option value="gmail.com">google.co.kr</option>
				<option value="nate.com">nate.com</option>
			</select>
		</div>
		<button type="button" onclick="fnFindId()" class="btn btn-outline-info">아이디찾기</button>
		
	</form>
	<form>
		<input type = "hidden" id="id" value="${id}" readonly>
		<input type = "hidden" id="result" value="${msg}" readonly>
	</form>
</body>
 --%>
</html>