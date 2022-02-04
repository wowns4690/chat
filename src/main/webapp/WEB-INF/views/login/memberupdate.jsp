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

    <title>회원정보 수정</title>

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


<body class="bg-gradient-light">
<input type = "hidden" id="startpage" value = "${startpage }">
<input type = "hidden" id="roomId" value = "${roomId }">
    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    
                    <div class="col-lg-12">
                        <div class="p-5">                           
                            <form class="user" id = "register" method="post" action="/login/register">                         
                            
							    
									
							<!-- 이름 입력하기  -->
                                <div class="form-group">
                                		<h5>이름</h5>                           
                                        <input type="text" class="form-control form-control-user" id="nameView"
                                            placeholder="이름을 입력해주세요." value = "${member.mberName }" maxlength="12">                                                                       
                                </div> 		
                                
                            <!-- 회사 주소  -->
									<div class="form-group">
										<h5>회사</h5>
										<input type="text" class="form-control form-control-user" id="cAdress" name="cAdress" maxlength="50" 
										placeholder="직장 주소를 입력해주세요." value = "${adress}" readonly>
									</div>  
									
							<!-- 직급  -->
									<div class="form-group">
										<h5>직급</h5>									
										<input type="text" class="form-control form-control-user" id="mberRank" name="mberRank" maxlength="50" 
										placeholder="직장 내의 직급을 입력해주세요." value = "${member.mberRank }">
									</div>
									
							<!-- 이메일  -->
									<div class="form-group">
										<h5>이메일</h5>										
										<input type="text" class="form-control form-control-user" id="mberEmail" name="mberEmail" maxlength="50" placeholder="본인확인용 이메일을 입력해주세요." 
										value = "${member.mberEmail }">
									</div>
									
							<!-- 회원 등록 버튼 -->		  							                                                             
                                <button id="memberupdate" type="button" onclick="fnRegister()" class="btn btn-primary btn-user btn-block">회원 정보 수정</button>                                
                                <hr>
                                <button type="button" onclick="location.href='/websocket/mypage?startpage=${startpage}&roomId=${roomId }'" class="btn btn-danger btn-user btn-block">돌아가기</button>                                
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
function fnRegister(){
	var name = $("#nameView").val();
	var checknm = name.trim();
		 if(checknm == "" || checknm==null){
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
		}else{
			$.ajax({
				type : "POST",
				url : "memberupdate",
				data : {mberName : name,
						cAdress : $("#cAdress").val(),
						mberRank : $("#mberRank").val(),
						mberEmail : $("#mberEmail").val()},	
				success : function(res){
					if(res === "success"){
						alert("회원 정보 수정이 완료되었습니다.")
						location.href = "/websocket/mypage?startpage="+$("#startpage").val()+"&roomId="+$("#roomId").val();
					}else if(res === "email"){
						alert("중복된 이메일 입니다.");
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown){
					
				}
			});
			}
}


$(document).ready(function(){
	$("#nameView").focus();
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