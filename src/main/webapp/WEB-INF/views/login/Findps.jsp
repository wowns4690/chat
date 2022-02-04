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

    <title>비밀번호 찾기</title>

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
<title>비밀번호 찾기</title>
</head>
<script type="text/javascript">
  history.replaceState({}, null, location.pathname);
</script>
<script src="../resources/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


<body>
	<form id = "checkform" method = "post">
		<label>아이디</label>
		<div>
		<input type ="text" id="idView" name="mberId" placeholder="아이디를 입력해주세요." maxlength="12">
		</div>
		<div class="form-group">
			<label>본인확인 질문</label>
			<label class="reg" for="class"></label>
			<div>
			<select  id="psqView" name="psQ" onchange="fnpsqselect()">
				<option value="Dname">아버지 성함은 무엇입니까?</option>
				<option value="Mname">어머니 성함은 무엇입니까?</option>
				<option value="Sname">출신 초등학교 이름은 무엇입니까?</option>
				<option value="Movie">감명깊게 본 영화는 무엇입니까?</option>
				<option value="Book">감명깊게 읽은 책은 무엇입니까?</option>
			</select>
			</div>	
		</div>
		<div class="form-group">
			<label>본인확인 답변</label>
			<input type="text" class="form-control" id="psaView" name="psA" maxlength="20" placeholder="답변을 입력해주세요" onkeyup = "enterkey()"/>	
		</div>
		<button type="button" onclick="findps()" class="btn btn-outline-info">비밀번호 찾기</button>
	</form>
	
	<form>
	<input type = "hidden" id="result" value="${msg }" readonly>
	</form>
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
                            
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">비밀번호 찾기</h1>
                                        <p class="mb-4">가입시 작성했던 이메일로 비밀번호 변경 안내 메시지가 전송이 됩니다!</p>
                                    </div>
                                    <form class="user" id = "checkform" method = "post">
                                    <div class="form-group">
										<input class="form-control form-control-user" type ="text" id="idView" name="mberId" placeholder="아이디를 입력해주세요." maxlength="12">
									</div>
									
									<div class="form-group">
									<label>본인확인 질문</label>
									<label class="reg" for="class"></label>
									<div>
									<select  id="psqView" name="psQ" onchange="fnpsqselect()">
										<option value="Dname">아버지 성함은 무엇입니까?</option>
										<option value="Mname">어머니 성함은 무엇입니까?</option>
										<option value="Sname">출신 초등학교 이름은 무엇입니까?</option>
										<option value="Movie">감명깊게 본 영화는 무엇입니까?</option>
										<option value="Book">감명깊게 읽은 책은 무엇입니까?</option>
									</select>
									</div>	
								</div>
								<div class="form-group">									
									<input type="text" class="form-control form-control-user" id="psaView" name="psA" maxlength="20" placeholder="답변을 입력해주세요" onkeyup = "enterkey()"/>	
								</div>
								<button type="button" onclick="findps()" class="btn btn-primary btn-user btn-block">비밀번호 찾기</button>
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
<script>
var isRun = false;
function findps(){
	if(isRun == true){
		return;
	}
	isRun = true;
	var idRegExp = /^[a-zA-z0-9]{4,12}$/;
	var id = $("#idView").val();
	if(!idRegExp.test(id)){
		$("#idView").focus();
		$("#idView").val(null);
		alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다.");
	}else if($("#psqView").val() == "" || $("#psqView").val()==null){
		alert("본인확인 질문을 선택해주세요.");
	}else if($("#psaView").val() == "" || $("#psaView").val()==null){
		alert("본인확인 답변을 입력해주세요.");
	}else{
			$.ajax({
				type : "POST",
				url : "Findps",
				data : {mberId : $("#idView").val(),
						psQ : $("#psqView").val(),
						psA : $("#psaView").val()},		
				success : function(res){
					isRun = false;
					if(res === "false"){
						alert("아이디와 본인확인 질문을 다시 확인해주세요.");
						location.reload();
					}else{
						alert("비밀번호 변경을 위한 메일이 사용자의 이메일 주소로 전송되었습니다.");
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
	$("#idView").focus();
});

function enterkey(){
	if(window.event.keyCode == 13){
		findps();
	}
}

</script>

</html>