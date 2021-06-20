<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<!-- start: HEAD -->
<head>
<title>Question Management</title>
<!-- start: META -->
<meta charset="utf-8" />
<!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="" name="description" />
<meta content="" name="author" />
<!-- end: META -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<!-- start: MAIN CSS -->
<link rel="stylesheet"
	href="./resources/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./resources/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/fonts/style.css">
<link rel="stylesheet" href="./resources/css/main.css">
<link rel="stylesheet" href="./resources/css/main-responsive.css">
<link rel="stylesheet" href="./resources/plugins/iCheck/skins/all.css">
<link rel="stylesheet"
	href="./resources/plugins/bootstrap-colorpalette/css/bootstrap-colorpalette.css">
<link rel="stylesheet"
	href="./resources/plugins/perfect-scrollbar/src/perfect-scrollbar.css">
<link rel="stylesheet" href="./resources/css/theme_light.css"
	type="text/css" id="skin_color">
<link rel="stylesheet" href="./resources/css/print.css" type="text/css"
	media="print" />
<!--[if IE 7]>
		<link rel="stylesheet" href="./resources/plugins/font-awesome/css/font-awesome-ie7.min.css">
		<![endif]-->
<!-- end: MAIN CSS -->
<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
<link rel="stylesheet"
	href="./resources/plugins/DataTables/media/css/DT_bootstrap.css" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- <script src="${context}/resources/jquery/processing.js" type="text/javascript"></script>
<link href="${context}/resources/css2/processing.css" rel="stylesheet" type="text/css" />
 --%>
<c:set var="context" value="${pageContext.request.contextPath}" />

</head>
<!-- end: HEAD -->
<!-- start: BODY -->
<body>
	<div class="container">
		<!-- start: PAGE CONTENT -->
		<div class="row">
			<div class="col-md-12">
				<!-- start: DYNAMIC TABLE PANEL -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-external-link-square"></i> Question Management
						<div class="panel-tools">
							<span
								style="color: white; background-color: green; text-align: center">${smsg}</span>
							<span
								style="color: white; background-color: green; text-align: center">${utmsg}</span>
								 <a
								class="btn btn-xs btn-link panel-collapse collapses" href="#">
							</a>
						</div>
					</div>


					<div class="panel-body">
					
										<div class="table table-responsive">
											<table
												class="table table-responsive table-striped table-bordered">
													<tbody id="TextBoxContainer">
													</tbody>
													<tfoot>

														<tr>
														<div class="form-group">
															<input name="question" onchange="validate()" onkeydown="validate()" id="question" type="text"
																placeholder="Question" class="form-control" />
																<div class="form-group">
									</div>
										<input type="text" id="tag" class="form-control" name="tag"
											placeholder="Tag" value="">
									
								</div>	
															<!-- <br>
															<br> -->
															<th colspan="5">
																<button id="btnAdd" type="button"
																	class="btn btn-primary" data-toggle="tooltip"
																	data-original-title="Add more controls">
																	<i class="glyphicon glyphicon-plus-sign"></i>&nbsp; Add
																	Answer&nbsp;
																</button> <br> <br>
																<button id="btnSave" type="button"
																	class="btn btn-lg btn-primary" data-toggle="tooltip"
																	onclick="createjson()" disabled="disabled">Save</button>
																	<button id="btnSave2" type="button"
																	class="btn btn-lg btn-primary" data-toggle="tooltip"
																	onclick="createjson2()" disabled="disabled">Save & Create Next Question</button>
															</th>

														</tr>
												</tfoot>
											</table>
					
					</div>
				</div>
				<div class="modal fade" id="viewAnswer" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title center">Answer List</h4>
							</div>
							<div class="modal-body">
								<table id="mytable"
									class="table table-striped table-bordered table-hover table-full-width">
									<thead>
										<tr>
											<th>#</th>
											<th>Answer</th>
											<th>quota</th>
										</tr>
									</thead>
									<tbody class="">
									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>
			</div>
			<span id="campaignid" style="display:none">${campaignId}</span>
			<!-- end: DYNAMIC TABLE PANEL -->
			<div class="modal fade" id="deleteu" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header modal-header-warning">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Do you really want to delete this question?</h4>
						</div>
						<form action="./deleteQuestion" method="post">
							<input type="text" id="questionId" value="" name="questionId"
								style="display: none;">
							<div class="modal-footer">
								<button type="submit" class="btn btn-default">Yes</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">No</button>
							</div>
						</form>

					</div>
				</div>
			</div>
			<div class="modal fade" id="updateu" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">EDIT FEATURE</h4>
						</div>
						<div class="modal-body">
							<form role="form" action="./fwUpdateFeature" method="post"
								class="form-horizontal">
								<input type="text" id="featureidup" value="" name="id"
									style="display: none;">
								<div class="form-group">
									<label class="col-sm-2 control-label" for="form-field-1">
										Feature </label>
									<div class="col-sm-9">
										<input type="text" id="feature1" class="form-control"
											name="featureName" value="">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="form-field-1">
										Link </label>
									<div class="col-sm-9">
										<input type="text" id="link" class="form-control" name="link"
											value="">
									</div>
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-primary"
										style="border-left-width: 1px; margin-left: 18%;">
										Update</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- end: PAGE CONTENT-->
	<!-- 	</div>
			</div> -->
	<!-- end: PAGE -->
	</div>
	<!-- start: MAIN JAVASCRIPTS -->
	<script>
		$(function() {
			$("#btnAdd").bind("click", function() {
				var div = $("<tr class='dynTR' />");
				div.html(GetDynamicTextBox(""));
				$("#TextBoxContainer").append(div);
				validate();
			});
			$("body").on("click", ".remove", function() {
				$(this).closest("tr").remove();
				validate();
			});
		});
		function GetDynamicTextBox(value) {
			return '<td><input id="answer"  onchange="validate()" onkeydown="validate()"  name = "answer" type="text" placeholder = "Answer" class="form-control" required /></td>'
					+ '<td><button type="button" class="btn btn-xs btn-danger remove"><i class="glyphicon glyphicon-remove-sign"></i></button></td>'
		}
		
		
		
		
		function validate(){
			if($(".dynTR").length!=0 && $("#question").val()!=""){
				var status="true";
				$(".dynTR").each(function(key, val) {
					val = $(this);
	                if(val.find('#answer').val()==""){
	                status="false";	
	                }
				});
			if(status=="true"){
				document.getElementById("btnSave").disabled = "";
				document.getElementById("btnSave2").disabled = "";
			}
			else{
				document.getElementById("btnSave").disabled = "disabled";
				document.getElementById("btnSave2").disabled = "disabled";
			}
			}
			else{
				document.getElementById("btnSave").disabled = "disabled";
				document.getElementById("btnSave2").disabled = "disabled";
			}
		}
		
		
		
		
		
		
		
		
	</script>
	<script>
	function createjson(){
		resultArr = [];
		$(".dynTR").each(function(key, val) {

			val = $(this);
			if (val.html() !== "") {

				var obj = {
					answer : val.find('#answer').val()
				}
				//alert(obj);

			}
			resultArr.push(obj);
			// console.log(resultArr)
		});
		var resultJson = {};
		resultJson["question"] =document.getElementById("question").value;
		resultJson["userId"] =document.getElementById("campaignid").innerHTML;
		resultJson["tag"] =document.getElementById("tag").value;
		resultJson["answerList"] = resultArr;

		$.ajax({
			url : '${context}/createquestion',
			data : JSON.stringify(resultJson),
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				//alert(document.getElementById("campaignid").innerHTML);
				var campaignId=document.getElementById("campaignid").innerHTML;
				window.location.href = '${context}/addCampaignQuestion?campaignId='+campaignId;
			},
			error : function() {

			}
		});
	}
	function createjson2(){
		resultArr = [];
		$(".dynTR").each(function(key, val) {

			val = $(this);
			if (val.html() !== "") {

				var obj = {
					answer : val.find('#answer').val()
				}
				//alert(obj);

			}
			resultArr.push(obj);
			// console.log(resultArr)
		});
		var resultJson = {};
		resultJson["question"] =document.getElementById("question").value;
		resultJson["userId"] =document.getElementById("campaignid").innerHTML;
		resultJson["tag"] =document.getElementById("tag").value;
		resultJson["answerList"] = resultArr;

		$.ajax({
			url : '${context}/createquestion',
			data : JSON.stringify(resultJson),
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				//alert(document.getElementById("campaignid").innerHTML);
				var campaignId=document.getElementById("campaignid").innerHTML;
				window.location.href = '${context}/addQuestionToCampaign?campaignId='+campaignId;
			},
			error : function() {

			}
		});
	}
	</script>

	<!--<![endif]-->
	<script src="./resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="./resources/plugins/iCheck/jquery.icheck.min.js"></script>
	<script
		src="./resources/plugins/perfect-scrollbar/src/jquery.mousewheel.js"></script>
	<script
		src="./resources/plugins/perfect-scrollbar/src/perfect-scrollbar.js"></script>
	<script src="./resources/plugins/jquery-cookie/jquery.cookie.js"></script>
	<script
		src="./resources/plugins/bootstrap-colorpalette/js/bootstrap-colorpalette.js"></script>
	<script src="./resources/js/main.js"></script>
	<!-- end: MAIN JAVASCRIPTS -->
	<script type="text/javascript"
		src="./resources/plugins/DataTables/media/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="./resources/plugins/DataTables/media/js/DT_bootstrap.js"></script>
	<script src="./resources/js/table-data.js"></script>
	<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
	<script>
		jQuery(document).ready(function() {
			Main.init();
			TableData.init();
		});
	</script>
</body>
<!-- end: BODY -->
</html>