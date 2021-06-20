<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
</head>
<!-- end: HEAD -->
<!-- start: BODY -->
<body>
<c:set var="context" value="${pageContext.request.contextPath}" />
	<div class="container">
		<!-- start: PAGE CONTENT -->
		<div class="row">
			<div class="col-md-12">
				<!-- start: DYNAMIC TABLE PANEL -->
				<div class="panel panel-default">
				<%-- 	<div class="panel-heading">
						<i class="fa fa-external-link-square"></i> Feature Table
						<div class="panel-tools">
							<span
								style="color: white; background-color: green; text-align: center">${smsg}</span>
							<span
								style="color: white; background-color: green; text-align: center">${utmsg}</span>
								<a
								class="btn btn-xs btn-link panel-collapse collapses" href="#">
							</a>
						</div>
					</div> --%>
					<div class="panel-body">
					<form role="form" action="./addCampaignPublisher" method="post"
										class="form-horizontal">
										<div class="center"><h3><strong>Select Publishers</strong></h3></div>
											<hr>
											<div>
												<c:forEach items="${publishers}" var="list">
													<label class="col-sm-4 checkbox-inline"> <input
														type="checkbox" value="${list.id}" 
														class="square-green" name="publishers" id="${list.name}">
														<input id="${list.id}" style="display:none" value="${list.publisherUrl}"/>
														<h5><strong>${list.name}</strong></h5>
													</label>
												</c:forEach>
											</div>
											<div class="form-group">
									<div class="col-sm-9">
											<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#MCMODAL" >Save</button>
									</div>
								</div>
									</form>
											</div>
				</div>
				<!-- end: DYNAMIC TABLE PANEL -->
			</div>
		</div>
		
							<div class="modal fade" id="MMM" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title center">Selected Publishers</h4>
								</div>
								<div class="modal-body">
									<section class="container">
										<div class="table table-responsive">
											<form action="addPublisherToCampaign" method="post">
											<table
												class="table table-responsive table-striped table-bordered">
													<thead>
													<th>Publisher</th>
													<th>Url</th>
													</thead>
													<input type="text" id="campaignId" value="${campaignId}" name="campaignId" style="display:none">
													<tbody id="TextBoxContainer">
													
													</tbody>
											</table>
											<button class="btn btn-primary" type="button" onclick="createjson()">Submit</button>
													</form>
										</div>
									</section>
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
				<span id="clientLink" style="display:none">${clientLink}</span>
				<span id="callbackLink" style="display:none">${callbackLink}</span>
		<!-- end: PAGE CONTENT-->
		<!-- 	</div>
			</div> -->
		<!-- end: PAGE -->
	</div>
	
	<script type="text/javascript">
    $(document).ready(function() {
        $("button").click(function(){
           /*  var favorite = [];
            var names=[]; */
            $("#TextBoxContainer").empty();
            $.each($("input[name='publishers']:checked"), function(){ 
            	var tr = $("<tr class='dynTR' />");
            	tr.html(GetDynamicTextBox($(this).val(),$(this).attr('id')));
            	$("#TextBoxContainer").append(tr);
                /* favorite.push($(this).val());
                names.push($(this).attr('name')); */
            });
            $('#MMM').modal('show');
          /*   alert("My favourite sports are: " + favorite.join(", "));
            alert("My favourite sports are: " + names.join(", ")); */
        });
    });
    function GetDynamicTextBox(value,ccc) {
    	var xyz=document.getElementById(value).value;
    	var cid=document.getElementById("campaignId").value;
        return '<td><input type="checkbox" id="publisher" value="'+value+'" checked="checked" style="display:none"><input type="checkbox" id="campaignId" value="'+cid+'" checked="checked" style="display:none">'+ccc+'</td><td>'+xyz+'</td>'
        /* <input type="checkbox" name="publisher" value="'+value+'" checked="checked"> */
    }
</script>
	<script>
	//alert(document.getElementById("clientLink").innerHTML)
	function createjson() {

		resultArr = [];
		$(".dynTR").each(function(key, val) {

			val = $(this);
			if (val.html() !== "") {

				var obj = {
					campaignId : val.find('#campaignId').val(),
					publisherId : val.find('#publisher').val()
				}
				//alert(obj);
			}
			resultArr.push(obj);
			console.log(resultArr)
		});
		//alert(resultArr);
/* 		var resultJson = {};
		resultJson["question"] =document.getElementById("question").value;
		resultJson["tag"] =document.getElementById("tag").value;
		resultJson["answerList"] = resultArr;
 */
	$.ajax({
			url : '${context}/addPublisherToCampaign',
			data : JSON.stringify(resultArr),
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				var clink=document.getElementById("clientLink").innerHTML;
				var calllink=document.getElementById("callbackLink").innerHTML;
				if(clink!="" || calllink!=""){
				$('#MMM').modal('hide');
				$('#MakeLive').modal('show');
				}
				else{
					window.location.href = '${context}/CampaignManagement';
				}
			},
			error : function() {

			}
		});
	}
	
	
	</script>
	
	
	<!-- start: MAIN JAVASCRIPTS -->
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