<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8"/>
<title>방명록</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="/resources/js/jquery-1.11.1.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

	// 코멘트 리스트를 로드한다.
	getCommentList();
		
}); // end reday
	
	
// 코멘트 리스트를 출력한다.
function getCommentList()
{
	
	$("#listComment").html('');
	
	$.ajax({
		type : "POST",
		url : '<c:url value="/comment/list"/>',
		success : function(data) {
			value = getCommentListData(data);
			$("#listComment").html(value); 
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});	
}
	
	
// 방명록 리스트 글의 데이터를 table 형태로 바꾼다.
function getCommentListData(data)
{
 	var addList = "";
	var length = data.length;
 	for (i=0; i< length; i++)
	{
		addList += "<tr>" ;
		addList += " <td> <span class='glyphicon glyphicon-user'></span>&nbsp;" + data[i].writer + "</td> " ;
		addList += " <td id='" + data[i].cno + "'>" + data[i].contents + "</td>";
		
		addList += "<td>";
		
		// 수정버튼 달기
		addList += "<a style='cursor:pointer' id='btnMod_" + data[i].cno + "' ";
		addList += " onclick=\"modcomment('" + data[i].cno+"');\"> <span class='glyphicon glyphicon-edit'></span> </a>";
		
		// 삭제버튼 달기
		addList += "<a style='cursor:pointer' id='btnDelete_" + data[i].cno + "' ";
		addList += " onclick=\"delcomment('" + data[i].cno +  "');\"><span class='glyphicon glyphicon-remove'></span></a>";
		
		// 저장 버튼 달기 
		addList += "<a style='cursor:pointer; visibility: hidden;' id='btnSave_" + data[i].cno + "' ";
		addList += " onclick=\"savecomment('" + data[i].cno + "');\"> ";
		addList += "<span class='glyphicon glyphicon-saved'></span> </a>";
		
		addList += "<td> <span class='glyphicon glyphicon-time'></span>&nbsp;" + data[i].moddate +"</td></tr>";
	}// end for
	return addList;
}

//댓글 삭제 
function delcomment(cno)
{
	var params =  '{ "cno" : '+ cno +'}';
	var confirmVal = confirm("글을 정말로 삭제하시겠습니까?");

	if(confirmVal){
		$.ajax({
			type : "POST",
			url : '<c:url value="/deleteComment"/>',
			data : params,
			contentType:"application/json; charset=utf-8",
			success : function(response) {
				getCommentList();
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});	
	}
}

</script>
</head>

<body>

	<div class="container" style="max-width:900px;padding-top:10px;">


	<form class="form-horizontal" role="form" action="addComment" method="POST">
	  <!-- 작성자입력 -->
	  <div class="form-group">
	    <label for="inputName" class="col-lg-2 control-label">Name</label>
	    <div class="col-lg-10">
	      <input type="text" class="form-control" name="writer" id="inputName" placeholder="Name">
	    </div>
	  </div>
	  <!-- 메일주소 입력 -->
	  <div class="form-group">
	    <label for="inputEmail" class="col-lg-2 control-label">Email</label>
	    <div class="col-lg-10">
	      <input type="email" class="form-control" name="email" id="inputEmail" placeholder="Email">
	    </div>
	  </div>
 	 <!-- 비밀번호입력 -->
	  <div class="form-group">
	    <label for="inputPassword" class="col-lg-2 control-label">Password</label>
	    <div class="col-lg-10">
	      <input type="password" class="form-control" name="passwd" id="inputPassword" placeholder="Password">
	    </div>
	  </div>
	  <!-- 내용입력 -->
	  <div class="form-group">
	    <label for="inputContents" class="col-lg-2 control-label">Contents</label>
	    <div class="col-lg-10">
		  <textarea class="form-control" id="inputContents" name="contents" rows="3" placeholder="Contents..."></textarea>
	    </div>
	  </div>
	  <!-- 저장버튼 -->
	  <div class="form-group" style="float:right;">
	    <div class="col-lg-offset-2 col-lg-10" >
	      <button type="submit" class="btn btn-default" >Save</button>
	    </div>
	  </div>
 	</form>	
	<table class="table table-striped">
		<tbody class="table table-hover" id="listComment"></tbody>
    </table>
	
  </div> <!-- end container -->
</body>
</html>


