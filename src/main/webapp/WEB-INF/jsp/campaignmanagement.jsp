<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<!-- start: HEAD -->
<head>
<title>Campaign Management</title>
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
<link rel="stylesheet"
	href="./resources/plugins/font-awesome/css/font-awesome-ie7.min.css">
<!-- end: MAIN CSS -->
<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
<link rel="stylesheet"
	href="./resources/plugins/DataTables/media/css/DT_bootstrap.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
						<i class="fa fa-external-link-square"></i> Campaign Management
						<div class="panel-tools">
							<span
								style="color: white; background-color: green; text-align: center">${smsg}</span>
							<span
								style="color: white; background-color: green; text-align: center">${utmsg}</span>
							<a class="btn btn-xs btn-primary" href="./cCampaign">New
								Campaign</a>
						</div>
					</div>

					<div class="panel-body">
						<table
							class="table table-striped table-bordered table-hover table-full-width"
							id="sample_1">
							<thead>
								<tr>
									<th>#</th>
									<th>Campaign Id</th>
									<th>Description</th>
									<th class="hidden-xs">Questions</th>
									<th class="hidden-xs">Quota</th>
									<th>Status</th>
									<!-- <th>Client Link</th>
									<th>Callback Link</th>
									 -->
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								int serialNumber = 0;
								%>
								<c:if test="${!empty Caimpaign}">
									<c:forEach items="${Caimpaign}" var="Campaign">
										<%
										serialNumber++;
										%>
										<tr>
											<td><%=serialNumber%></td>
											<td>${Campaign.id}</td>
											<td>${Campaign.description}</td>
											<td class="hidden-xs">${Campaign.questions}</td>
											<td class="hidden-xs">${Campaign.quota}</td>
											<td>${Campaign.status}</td>
											<%-- <td>${Campaign.clientLink}</td>
											<td>${Campaign.callbackLink}</td>
											 --%>
											<td class="center"><c:choose>
													<c:when
														test="${Campaign.status == 'STOP' || Campaign.status == 'CANCEL'}">
														<a class="btn btn-sm btn-primary tooltips"
															data-placement="top" data-original-title="COPY CAMPAIGN"
															onclick="document.getElementById('campId').value ='${Campaign.id}'"
															data-toggle="modal" data-target="#copyCampaign"> <i
															class="fa fa-files-o"></i></a>
													</c:when>
													<c:when
														test="${Campaign.status == 'LIVE' || Campaign.status == 'PAUSE' || Campaign.status == 'INIT'}">
														<div>
															<c:choose>
																<c:when
																	test="${Campaign.status == 'PAUSE' || Campaign.status == 'INIT'}">
																	<div class="btn-group">
																		<button class="btn btn-primary dropdown-toggle btn-md"
																			data-toggle="dropdown">
																			<!-- <i class="fa fa-cog"></i>  -->
																			Select <span class="caret"></span>
																		</button>
																		<ul role="menu" class="dropdown-menu pull-right">
																			<c:if test="${ Campaign.status == 'PAUSE'}">
																				<li role="presentation"><a role="menuitem"
																					tabindex="-1"
																					onclick="document.getElementById('resumecampId').href ='UpdateStatus?status=LIVE&campaignId=${Campaign.id}'"
																					data-toggle="modal" data-target="#ResumeCampaign">
																						<i class="fa fa-play"></i> Resume
																				</a></li>
																			</c:if>
																			<c:if test="${ Campaign.status == 'INIT'}">
																				<li role="presentation"><a role="menuitem"
																					tabindex="-1"
																					onclick="document.getElementById('resumecampId').href ='UpdateStatus?status=LIVE&campaignId=${Campaign.id}'"
																					data-toggle="modal" data-target="#ResumeCampaign">
																						<i class="fa fa-play"></i> Start
																				</a></li>
																			</c:if>
																			<li role="presentation"><a
																				onclick="document.getElementById('callbackLink').value ='${Campaign.callbackLink}';document.getElementById('clientLink').value ='${Campaign.clientLink}';document.getElementById('status').innerHTML ='${Campaign.status}';document.getElementById('status').value ='${Campaign.status}';document.getElementById('description').value ='${Campaign.description}';document.getElementById('id').value ='${Campaign.id}';document.getElementById('quota').value ='${Campaign.quota}';fun('${Campaign.status}','${Campaign.questions}','${Campaign.callbackLink}','${Campaign.clientLink}')"
																				data-toggle="modal" data-target="#updateModal">
																					<i class="fa fa-edit"></i> Edit Campaign
																			</a></li>
																			<li role="presentation"><a role="menuitem"
																				tabindex="-1"
																				href="./CampaignPublisher?campaignId=${Campaign.id}">
																					<i class="fa fa-user"></i> Source
																			</a></li>
																			<li role="presentation"><a role="menuitem"
																				tabindex="-1"
																				onclick="document.getElementById('campId').value ='${Campaign.id}'"
																				data-toggle="modal" data-target="#copyCampaign">
																					<i class="fa fa-files-o"></i> Copy Campaign
																			</a></li>
																			<li role="presentation"><a role="menuitem"
																				tabindex="-1"
																				onclick="document.getElementById('stopcampId').href ='UpdateStatus?status=STOP&campaignId=${Campaign.id}'"
																				data-toggle="modal" data-target="#StopCampaign"><i
																					class="fa fa-stop"></i>Stop</a></li>
																		</ul>
																	</div>
																</c:when>
																<c:otherwise>
																	<a class="btn btn-sm btn-primary tooltips"
																		data-placement="top" data-original-title="PAUSE"
																		onclick="document.getElementById('pausecampId').href ='UpdateStatus?status=PAUSE&campaignId=${Campaign.id}'"
																		data-toggle="modal" data-target="#PauseCampaign">
																		<i class="fa fa-pause"></i>
																	</a>
																</c:otherwise>
															</c:choose>

														</div>
													</c:when>
													<c:otherwise>
														<div class="btn-group">
															<button class="btn btn-primary dropdown-toggle btn-md"
																data-toggle="dropdown">
																<!-- <i class="fa fa-cog"></i>  -->
																Select <span class="caret"></span>
															</button>
															<ul role="menu" class="dropdown-menu pull-right">
																<li role="presentation"><a role="menuitem"
																	tabindex="-1"
																	href="./ViewCampaignQuestion?campaignId=${Campaign.id}">
																		<i class="fa fa-cogs" aria-hidden="true"></i> Manage
																		Questions
																</a></li>
																<li role="presentation"><a
																	onclick="document.getElementById('callbackLink').value ='${Campaign.callbackLink}';document.getElementById('clientLink').value ='${Campaign.clientLink}';document.getElementById('status').innerHTML ='${Campaign.status}';document.getElementById('status').value ='${Campaign.status}';document.getElementById('description').value ='${Campaign.description}';document.getElementById('id').value ='${Campaign.id}';document.getElementById('quota').value ='${Campaign.quota}';fun('${Campaign.status}','${Campaign.questions}','${Campaign.callbackLink}','${Campaign.clientLink}')"
																	data-toggle="modal" data-target="#updateModal"> <i
																		class="fa fa-edit"></i> Edit Campaign
																</a></li>
																<li role="presentation"><a role="menuitem"
																	tabindex="-1"
																	href="./newAddCampaignQuestion?campaignId=${Campaign.id}">
																		<i class="fa fa-plus-square-o"></i> Add Questions
																</a></li>
																<li role="presentation"><a role="menuitem"
																	tabindex="-1"
																	href="./CampaignPublisher?campaignId=${Campaign.id}">
																		<i class="fa fa-user"></i> Source
																</a></li>

																<li role="presentation"><a role="menuitem"
																	tabindex="-1"
																	onclick="document.getElementById('campId').value ='${Campaign.id}'"
																	data-toggle="modal" data-target="#copyCampaign"> <i
																		class="fa fa-files-o"></i> Copy Campaign
																</a></li>
																<li role="presentation"><a role="menuitem"
																	tabindex="-1"
																	onclick="document.getElementById('campaignid1').value ='${Campaign.id}'"
																	data-toggle="modal" data-target="#DeleteCampaign">
																		<i class="fa fa-times"></i> Remove Campaign
																</a></li>
															</ul>
														</div>
													</c:otherwise>
												</c:choose></td>
										</tr>
									</c:forEach>
								</c:if>

							</tbody>
						</table>
					</div>
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title center">CREATE CAMPAIGN</h4>
								</div>
								<div class="modal-body">
									<form role="form" action="./createCampaign" method="post"
										class="form-horizontal" id="addform">
										<div class="form-group">
											<label class="col-sm-2 control-label" for="form-field-2">
												Description</label>
											<div class="col-sm-9">
												<input type="text" placeholder="Description"
													id="form-field-2" class="form-control" name="description"
													required>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="form-field-1">
												Start Date </label>
											<div class="col-sm-9">
												<span id="errormsg2"
													style="margin-right: 51%; color: red; font-family: -webkit-body; display: none"></span>
												<input type="date" class="form-control" id="startDate"
													name="startDate" required>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="form-field-2">
												End Date </label>
											<div class="col-sm-9">
												<span id="errormsg"
													style="margin-right: 46%; color: red; font-family: -webkit-body; display: none"></span>
												<input type="date" id="endDate" class="form-control"
													name="endDate" required>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="form-field-1">
												Quota </label>
											<div class="col-sm-9">
												<input type="text" class="form-control" placeholder="Quota"
													name="quota" required>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="form-field-1">
												Client Link </label>
											<div class="col-sm-9">
												<input type="text" class="form-control" name="clientLink"
													placeholder="Client Link" required>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="form-field-1">
												Callback Link </label>
											<div class="col-sm-9">
												<input type="text" class="form-control" name="callbackLink"
													placeholder="Callback Link" required>
											</div>
										</div>
										<div class="form-group">
											<button type="submit" class="btn btn-primary"
												style="width: 30%; margin-left: 36%;">SAVE & NEXT</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="modal fade" id="updateModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title center">UPDATE CAMPAIGN</h4>
								</div>
								<div class="modal-body">
									<form role="form" action="./updateCampaign" method="post"
										class="form-horizontal" id="addform">
										<div class="form-group">
											<span
												style="background-color: #f2dede; border-color: #ebccd1; color: #653838; display: block; margin-bottom: 13px; text-align: center;">${servermessage}</span>
											<label class="col-sm-2 control-label" for="form-field-1">
												Status </label>
											<div class="col-sm-9">
												<select class="form-control" name="status" id="mySelect">
													<option value="" id="status" style="display: none"></option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="form-field-2">
												Description</label>
											<div class="col-sm-9">
												<input id="description" type="text"
													placeholder="Description" id="form-field-2"
													class="form-control" name="description" required>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="form-field-1">
												Quota </label>
											<div class="col-sm-9">
												<input type="text" id="quota" class="form-control"
													name="quota" required>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="form-field-1">
												Client Link </label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="clientLink"
													name="clientLink" required>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="form-field-1">
												Callback Link </label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="callbackLink"
													name="callbackLink" required>
											</div>
										</div>
										<input type="text" id="id" name="id" style="display: none">
										<div class="form-group">
											<button type="submit" class="btn btn-primary"
												style="width: 30%; margin-left: 36%;">UPDATE</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="modal fade" id="copyCampaign" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title center">COPY CAMPAIGN</h4>
								</div>
								<form action="./CopyCampaign" method="post">
									<div class="modal-body">

										<input type="text" value="" id="campId" name="id"
											style="display: none;">
										<div class="form-group">
											<label class="col-sm-2 control-label" for="form-field-2">
												Description</label>
											<div class="col-sm-9">
												<input type="text" placeholder="Description"
													class="form-control" name="description" required>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<div class="form-group" style="margin-right: 37%;">

											<button type="submit" class="btn btn-primary">Copy</button>
											<button type="button" class="btn btn-danger"
												data-dismiss="modal">Cancel</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="modal fade" id="DeleteCampaign" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Do you really want to remove this
										campaign?</h4>
								</div>
								<form action="./DeleteCampaign" method="post">
									<input type="text" id="campaignid1" value="" name="id"
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
					<div class="modal fade" id="StopCampaign" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Do you really want to stop this
										campaign?</h4>
								</div>
								<div class="modal-footer">
									<a id="stopcampId" href=""
										class="btn btn-danger btn-md pull-left">Yes</a>
									<button type="button" class="btn btn-default btn-md pull-left"
										data-dismiss="modal">No</button>
								</div>

							</div>
						</div>
					</div>
					<div class="modal fade" id="PauseCampaign" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Do you really want to pause this
										campaign?</h4>
								</div>
								<div class="modal-footer">
									<a id="pausecampId" href=""
										class="btn btn-primary btn-md pull-left">Yes</a>
									<button type="button" class="btn btn-default btn-md pull-left"
										data-dismiss="modal">No</button>
								</div>

							</div>
						</div>
					</div>


					<div class="modal fade" id="ResumeCampaign" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Do you really want to resume this
										campaign?</h4>
								</div>
								<div class="modal-footer">
									<a id="resumecampId" href=""
										class="btn btn-primary btn-md pull-left">Yes</a>
									<button type="button" class="btn btn-default btn-md pull-left"
										data-dismiss="modal">No</button>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end: DYNAMIC TABLE PANEL -->
		</div>
	</div>

	<!-- end: PAGE CONTENT-->
	<!-- 	</div>
			</div> -->
	<!-- end: PAGE -->
	<script>
		function fun(x, y, a, b) {
			if (x == 'INIT' && y != 0 && a != '' && b != '') {
				$('#mySelect').children('option:not(:first)').remove();
				$('#mySelect').append(
						$("<option></option>").attr("value", "LIVE").text(
								"LIVE"));
				$('#mySelect').append(
						$("<option></option>").attr("value", "CANCEL").text(
								"CANCEL"));
			} else {
				$('#mySelect').children('option:not(:first)').remove();
				$('#mySelect').append(
						$("<option></option>").attr("value", "CANCEL").text(
								"CANCEL"));
			}

		}
	</script>




	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
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