<%@ page import = "java.lang.String.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
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
<script src="https://malsup.github.io/jquery.form.js"></script> 
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
<script src="../resources//jqGrid/js/minified/jquery.jqGrid.min.js"></script>
<script src="../resources/jqGrid/js/i18n/grid.locale-kr.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/jqGrid/css/ui.jqgrid.css" />
<link rel="stylesheet" href="../resources/jquery-ui-1.13.1/jquery-ui.css"> 
<link rel="stylesheet" href="../resources/jquery-ui-1.13.1/jquery-ui.structure.css"> 
<link rel="stylesheet" href="../resources/jquery-ui-1.13.1/jquery-ui.theme.css">
<script src="../resources/js/excel.js"></script>
<title>게시판 목록</title>
</head>
<body>
<h1 style="float:left;">게시글 목록</h1>
<button id="excelTemplate" onclick="excelTemplateDown()">엑셀 양식 다운로드</button>
<hr>
<select id="searchtitle">
	<option value="searchall">전체</option>
	<option value="searchnum">번호</option>
	<option value="searchtitle">제목</option>
	<option value="searchwriter">작성자</option>
</select>
<input type="text" id="searchvalue" maxlength="10">
<button id="searchbtn" onclick="search()">검색</button>
<div style="float:left; padding:10px;">
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
	</tr>
	<c:forEach items="${board}" var="board" varStatus = "status">
		<tr>
			<td>${board.postId}</td>
			<td>${board.postTitle}</td>
			<td>${board.postWriter}</td>		
		</tr>
	</c:forEach>
</table>
<button id="Exceldown" onclick="exceldown();">Excel 다운로드</button>
</div>

<div style="float:left; padding:10px;">
<c:choose>
	<c:when test="${not empty upload}">
		<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
			</tr>
			<c:forEach items="${upload}" var="upload" varStatus = "status">
				<tr>
					<td>${upload.postId}</td>
					<td>${upload.postTitle}</td>
					<td>${upload.postWriter}</td>		
				</tr>
			</c:forEach>	
		</table>
	</c:when>
	<c:otherwise>
		<h4>엑셀 업로드를 하면 이곳에 내용이 표시됩니다.<br>
		양식을 다운받아 양식대로 내용을 입력해주세요.</h4>
	</c:otherwise>
</c:choose>
<form id="excelUploadForm" name="excelUploadForm" enctype="multipart/form-data" method="post" action="excelUploadAjax">
<input type="file" id="excelFile" name="excelFile">
<button type="button" id="addExcelImpoartBtn" onclick="check()">업로드</button>
</form>
</div>
<div class="tableWrap">
<table id="mainGrid"></table> 
<div id="pager"></div> 
</div>
<div id="divjqGrid" style="float:left;">
	<table id="jqGrid"></table> 
	<div id="gridpager"></div>
 </div>
</body>
<script>
var boardsize = parseInt("${boardsize}");
var res = [];
<c:forEach var = "board" items="${board}" varStatus="status">
res.push({postId : "${board.postId}", postTitle : "${board.postTitle}" , postWriter : "${board.postWriter}"});
</c:forEach>
 $(document).ready(function(){
	$("#jqGrid").jqGrid({ 
		datatype: "local", 
		data: res,
		loadonce : false,
		height: 250, 
		width: 500, 
		colNames : ['번호','제목','작성자'], 
		colModel:[ 
			{name:"postId", 
				index:"postId", 
				width:15, 
				align:'center', 
				hidden:false }, 
				{name : 'postTitle', 
					index : 'postTitle', 
					width : 70, 
					align : 'center', 
					hidden:false, }, 
					{name : 'postWriter', 
						index : 'postWriter', 
						width : 70,
						align : 'center', 
						hidden:false }], 
							loadtext: "로딩중일때 표시되는 텍스트!", 
							pager:"#gridpager", 
							rowNum:10, 
							});

	});
</script>
