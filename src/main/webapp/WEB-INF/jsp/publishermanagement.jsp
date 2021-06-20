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
  <ul class="nav nav-tabs nav-justified">
    <li class="nav-item">
      <a class="nav-link" href="./questionmanagement" ><span style="color:black">Question Management</span></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="./PublisherManagement" style="background-color: darkgray;"><span style="color:black">Publisher Management</span></a>
    </li>
    <c:if test="${usertype=='Admin'}">
    <li class="nav-item">
      <a class="nav-link" href="./fwusermanagement"><span style="color:black">Team Management</span></a>
    </li>
    </c:if>
  </ul>
</div>

	<div class="container">
		<!-- start: PAGE CONTENT -->
		<div class="row">
			<div class="col-md-12">
				<!-- start: DYNAMIC TABLE PANEL -->
				<div class="panel panel-default">
								<div class="panel-heading">
				<i class="fa fa-external-link-square"></i> Publisher Table
				<div class="panel-tools">
					<a class="btn btn-xs " style="color: white; background-color: #0b738a"
						data-toggle="modal" data-target="#myModal">ADD PUBLISHER </a> 
						 <a
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
							<h4 class="modal-title center">ADD PUBLISHER</h4>
						</div>
						<div class="modal-body">
							<form role="form" action="./CreatePublisher"class="form-horizontal" id="addform" method="POST" enctype="multipart/form-data">
								<div class="form-group">
									<label class="col-sm-2 control-label" for="form-field-1">
										Publisher Name </label>
									<div class="col-sm-9">
										<input type="text" placeholder="Publisher Name" maxlength="20" id="demo"
											class="form-control" name="name" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="form-field-2">
										Publisher URL </label>
									<div class="col-sm-9">
										<input type="text" placeholder="Publisher URL" maxlength="60"
											id="form-field-2" class="form-control" name="publisherUrl"
											required>
									</div>
								</div>
								<input type="text" id="path"  name="path" style="display:none"> 
								<div class="form-group">
									<button type="submit" class="btn btn-primary"
										style="width: 30%;    margin-left: 35%;">
										Add</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="UpdateUser" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title center">UPDATE USER</h4>
						</div>
						<div class="modal-body">
							<form role="form" action="./UpdatePublisher"class="form-horizontal" id="addform" method="POST" enctype="multipart/form-data">
								<div class="form-group">
									<label class="col-sm-2 control-label" for="form-field-1">
										Publisher Name </label>
									<div class="col-sm-9">
										<input type="text" placeholder="Publisher Name" maxlength="20" id="publishername"
											class="form-control" name="name" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="form-field-2">
										Publisher URL </label>
									<div class="col-sm-9">
										<input type="text" placeholder="Publisher URL" maxlength="60"
											id="publisherurl" class="form-control" name="publisherUrl"
											required>
									</div>
								</div>
								<input type="text" id="publisherid" name="id" style="display:none">
								<div class="form-group">
									<button type="submit" class="btn btn-primary"
										style="width: 30%; margin-left: 35%;">
										Add</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<table
					class="table table-striped table-bordered table-hover table-full-width"
					id="sample_1">
					<thead>
						<tr>
							<th>#</th>
							<th class="hidden-xs">MODIFIED ON</th>
							<th>PUBLISHER</th>
							<th class="hidden-xs">URL</th>
							<th>ACTION</th>
						</tr>
					</thead>
					<tbody>
						<%
							int serialNumber = 0;
						%>
						<c:if test="${!empty publishers}">
							<c:forEach items="${publishers}" var="publishers">
								<%
									serialNumber++;
								%>
								<tr>
									<td><%=serialNumber%></td>
									<td class="hidden-xs">${publishers.modifiedOn}</td>
									<td>${publishers.name}</td>
									<td class="hidden-xs">${publishers.publisherUrl}</td>
									<td class="center">
										<div>
											<a class="btn btn-xs btn-teal tooltips" data-placement="top"
												data-original-title="Edit"
												onclick="document.getElementById('publisherid').value ='${publishers.id}';document.getElementById('publishername').value ='${publishers.name}';document.getElementById('publisherurl').value='${publishers.publisherUrl}';"
												data-toggle="modal" data-target="#UpdateUser"><i
												data-target="#responsive" class="fa fa-edit"></i></a> <a
												class="btn btn-xs btn-bricky tooltips" data-placement="top"
												data-original-title="Remove"
												onclick="document.getElementById('deluser_id').value ='${publishers.id}'"
												class="btn btn-info btn-lg" data-toggle="modal"
												data-target="#DeleteUser"><i
												class="fa fa-times fa fa-white"></i></a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>

					</tbody>
				</table>
			</div>
			</div>
		</div>
	</div>
<div class="modal fade" id="DeleteUser" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">ARE YOU SURE?</h4>
					</div>
					<form action="./DeletePublisher" method="post">
						<input type="text" id="deluser_id" value="" name="id"
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
	<!-- end: PAGE CONTENT-->
	<!-- 	</div>
			</div> -->
	<!-- end: PAGE -->
	</div>

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