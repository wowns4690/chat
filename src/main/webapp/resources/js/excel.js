function exceldown(){
	$.ajax({
	    url: "/board/ExcelDown",
	    type: 'POST',
	    data: "",
	    cache: false,
	    xhrFields: {
	        responseType: "blob",
	    },
	})
	    .done(function (blob, status, xhr) {
	        // check for a filename
	        var fileName = "";
	        var disposition = xhr.getResponseHeader("Content-Disposition");

	        if (disposition && disposition.indexOf("attachment") !== -1) {
	            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
	            var matches = filenameRegex.exec(disposition);

	            if (matches != null && matches[1]) {
	                fileName = decodeURI(matches[1].replace(/['"]/g, ""));
	            }
	        }

	        // for IE
	        if (window.navigator && window.navigator.msSaveOrOpenBlob) {
	            window.navigator.msSaveOrOpenBlob(blob, fileName);
	        } else {
	            var URL = window.URL || window.webkitURL;
	            var downloadUrl = URL.createObjectURL(blob);

	            if (fileName) {
	                var a = document.createElement("a");

	                // for safari
	                if (a.download === undefined) {
	                    window.location.href = downloadUrl;
	                } else {
	                    a.href = downloadUrl;
	                    a.download = fileName;
	                    document.body.appendChild(a);
	                    a.click();
	                }
	            } else {
	                window.location.href = downloadUrl;
	            }
	        }
	    });
}

function checkFileType(filePath){
	var fileFormat = filePath.split(".");
	
	if(fileFormat.indexOf("xls")>-1 || fileFormat.indexOf("xlsx")>-1){
		return true;
	}else{
		return false;
	}
}

function check(){
	
	var file = $("#excelFile").val();
	var form = $("#excelUploadForm")[0];
	var data = new FormData(form);
	if(file==""||file==null){
		alert("파일을 선택해주세요.");
		return false;
	}else if(!checkFileType(file)){
		alert("엑셀 파일만 업로드 가능합니다.");
		return false;
	}
	if(confirm("업로드 하시겠습니까?")){
			$.ajax({
				type : "POST",
				enctype: 'multipart/form-data',
				url : "/board/excelUploadAjax",
				data : data,
				processData: false,
			    contentType: false,
			    cache: false,
				success : function(res){
					if(res>0){
					location.href = "/board/postList";
					}else{
						alert("업로드 실패 양식을 다시 한번 확인해 주세요.");
						location.href = "/board/postList";
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown){
					
				}
			});
		}
	/*if(confirm("업로드 하시겠습니까?")){
		var options = {
				success:function(data){
					console.log(data);
					alert("모든 데이터가 업로드 되었습니다.");
				},
				type:"POST"
		};
		$("#excelUploadForm").ajaxSubmit(options);
	}*/
}

function excelTemplateDown(){
	location.href = "../resources/ExcelTemplate/ExcelTemplate.xls";
}

function search(){
	var searchtitle = $("#searchtitle").val();
	var searchvalue = $("#searchvalue").val();
	$.ajax({
		type : "POST",
		url : "/board/search",
		data : {searchtitle : searchtitle,
				searchvalue : searchvalue},
		success : function(res){
			var test = {data:res};
			$("#jqGrid").jqGrid("clearGridData", true);
			$("#jqGrid").setGridParam(test).trigger("reloadGrid");	
		},
		error : function(XMLHttpRequest, textStatus, errorThrown){
			
		}
	});
}

/*------------------------------------------------------jqgrid------------------------------------------------------------------*/





