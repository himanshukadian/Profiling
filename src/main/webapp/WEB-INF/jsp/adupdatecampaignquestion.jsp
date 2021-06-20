<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<!-- start: HEAD -->
<head>
<title>Feature Management</title>
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
<style>
.readOnly{
display:none;
}
</style>
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
							<span id="QuestionCount" style="display:none">${QuestionCount}</span>
							<span id="QuestionIdStart" style="display:none">${id}</span>
							 <a
								class="btn btn-xs btn-link panel-collapse collapses" href="#">
							</a>
						</div>
					</div>
					<div class="modal fade" id="addType" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title center">CREATE QUESTION</h4>
								</div>
								<div class="modal-body"></div>
							</div>
						</div>
					</div>

					<div class="panel-body">
						<section class="container">
							<div class="table table-responsive">
								<table
									class="table table-responsive table-striped table-bordered">
										<tbody id="TextBoxContainer">
								
										<c:if test="${!empty answerList}">
									<c:forEach items="${answerList}" var="answerBank">
								
										<tr class='dynTR'>
                                   <td>
                                   <input id="answer" name ="answer" type="text" value="${answerBank.answer}" class="form-control" /></td><td>${answerBank.quota}</td><td><input class="readOnly" id="quota" name ="quota" value="${answerBank.quota}" type="text"/></td><td><button type="button" class="btn btn-xs btn-danger remove"><i class="glyphicon glyphicon-remove-sign"></i></button></td>
									</tr>	
									</c:forEach>
									</c:if>
									</tbody>
									<div>
									<button onclick="addQuotaBtn()" class="btn btn-primary" type="button" id="addQuotaBtn" >ADD QUOTA</button>
									</div>
									<br>
										<tfoot>

											<tr>
												<input name="question" id="question" type="text"
													placeholder="Question" class="form-control"
													value="${Question}" />
													<input name="aquestionid" id="aquestionid" value="${id}" style="display:none">
													<input name="aquestionid" id="campaignid" value="${campaignId}" style="display:none">
												<br>
												<br>
												<th colspan="5">
													<button id="btnAdd" type="button" class="btn btn-primary"
														data-toggle="tooltip"
														data-original-title="Add more controls">
														<i class="glyphicon glyphicon-plus-sign"></i>&nbsp; Add
														Answer&nbsp;
													</button> <br> <br>
													<button id="btnSave" type="button"
														class="btn btn-lg btn-primary" data-toggle="tooltip"
														onclick="createjson()">Save</button>
												</th>

											</tr>
									</form>
									</tfoot>
								</table>
							</div>
						</section>
					</div>
				</div>
			</div>
<div class="modal fade" id="MMM" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">This was the last question</h4>
					</div>
						<div class="modal-footer">
							<a type="submit" class="btn btn-default" href="ReorderCampaignQuestion?campaignId=${campaignId}">Reorder Questions</a>
							<a type="button" class="btn btn-default"
							data-toggle="modal" data-target="#MakeLive">Continue With Default Order</a>
						</div>
				</div>
			</div>
			</div>
		</div>
		<div class="modal fade" id="MakeLive" role="dialog">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Make This Campaign Live</h4>
							</div>
								<div class="modal-footer">
									<a href="UpdateStatus?status=LIVE&campaignId=${campaignId}" class="btn btn-default">Now</a>
									<a href="CampaignManagement" class="btn btn-default">Later</a>
								</div>
						</div>
					</div>
				</div>
		
		</div>
	</div>
	<!-- start: MAIN JAVASCRIPTS -->
	<script>
	function addQuotaBtn() {
		  var cols =     document.getElementsByClassName('readOnly');
		  for(i=0; i<cols.length; i++) {
		    cols[i].style.display =    'block';
		  }
		}
	</script>
	<script>
		$(function() {
			$("#btnAdd").bind("click", function() {
				var div = $("<tr class='dynTR' />");
				div.html(GetDynamicTextBox(""));
				$("#TextBoxContainer").append(div);
				document.getElementById("btnSave").disabled = "";
			});
			$("body").on("click", ".remove", function() {
				$(this).closest("tr").remove();
			});
		});
		function GetDynamicTextBox(value) {
			return '<td><input id="answer" name = "answer" type="text" placeholder = "Answer" class="form-control" /></td>'
					+ '<td>0</td><td><input class="readOnly" id="quota" name ="quota" value="0" type="text"/></td>'
					+ '<td><button type="button" class="btn btn-xs btn-danger remove"><i class="glyphicon glyphicon-remove-sign"></i></button></td>'
		}
	</script>
	<script>
	var count=document.getElementById("QuestionCount").innerHTML;
	var quesId=document.getElementById("QuestionIdStart").innerHTML;
	//alert(quesId)
	function createjson() {
			//alert(count);
			resultArr = [];
			$(".dynTR").each(function(key, val) {

				val = $(this);
				if (val.html() !== "") {

					var obj = {
							//alert("getting AnswerList");
						answer : val.find('#answer').val(),
						quota : val.find('#quota').val()
					}

				}
				resultArr.push(obj);
				console.log(resultArr)
			});
			var resultJson = {};
			resultJson["question"] = document.getElementById("question").value;
			resultJson["id"] = document.getElementById("aquestionid").value;
			resultJson["answerList"] = resultArr;
			$.ajax({
				url : '${context}/updateCampaignQue',
				data : JSON.stringify(resultJson),
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					
					var campId=document.getElementById("campaignid").value;
						//alert("Current Count"+count);
						//alert('${context}/updateCampaignQuestion?questionId='+quesId+'&campaignId='+campId+'&size='+count);
						window.location.href = '${context}/ViewCampaignQuestion?campaignId='+campId		
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