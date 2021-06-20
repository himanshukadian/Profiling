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
							<a class="btn btn-xs btn-primary" data-toggle="modal"
								data-target="#myModal">Reorder Questions </a> <a
								class="btn btn-xs btn-link panel-collapse collapses" href="#">
							</a>
						</div>
					</div>
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title center">Reorder Questions</h4>
								</div>
								<div class="modal-body">
										
								</div>
							</div>
						</div>
					</div>
					<div class="panel-body">
						<table class="table">
											<thead>
												<tr class="center">
													<th>Question</th>
													<th>Previous Order</th>
													<th>New Order</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${!empty CampaignQuestion}">
													<c:forEach items="${CampaignQuestion}"
														var="CampaignQuestion">
														<tr class="dynTR">
															<td>${CampaignQuestion.question}</td>
															<td>${CampaignQuestion.order}</td>
															<td><input type="text" id="order" name="order"
																value="${CampaignQuestion.order}"><input
																type="text" value="${CampaignQuestion.id}" id="id" name="id"
																style="display: none"></td>
														</tr>
													</c:forEach>
												</c:if>

											</tbody>
										</table>
										<div class="form-group">
											<button
												onclick="createjson()"
												type="submit" class="btn btn-primary"
												style="width: 30%; margin-left: 35%;">Save</button>
										</div>					</div>
				</div>

			</div>
			<!-- end: DYNAMIC TABLE PANEL -->
<input type="text" value="${campaignId}" id="campaignId" style="display:none">

		</div>
	</div>

	<!-- start: MAIN JAVASCRIPTS -->
	<script>
	function ArrNoDupe(a) {
	    var temp = {};
	    for (var i = 0; i < a.length; i++)
	        temp[a[i]] = true;
	    var r = [];
	    for (var k in temp)
	        r.push(k);
	    return r;
	}
		function createjson() {
			var campId=document.getElementById("campaignId").value;
			resultArr = [];
			array=[];
			arrayunique=[];
			$(".dynTR").each(function(key, val) {

				val = $(this);
				if (val.html() !== "") {
					array.push(val.find('#order').val())
					var obj = {
						order : val.find('#order').val(),
						id : val.find('#id').val()
					}
				}
				resultArr.push(obj);
			});
			var noDupes = ArrNoDupe(array);
			if(array.length!=noDupes.length){
			alert("Duplicity in questions order is not allowed!!");	
			}
			else{
			$.ajax({
				url : '${context}/ReorderQuestion',
				data : JSON.stringify(resultArr),
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					/* $('#MakeLive').modal('show'); */
					window.location.href = '${context}/AddPublisher?campaignId='+campId
							
				},
				error : function() {

				}
			});
			}
		}
	</script>
	<script>
		function abc() {
			//var x=xyz;
			var x = 1;
			console.log(x);
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