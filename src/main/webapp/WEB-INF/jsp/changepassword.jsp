<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- Template Name: Clip-One - Responsive Admin Template build with Twitter Bootstrap 3.x Version: 1.3 Author: ClipTheme -->
<!--[if IE 8]><html class="ie8 no-js" lang="en"><![endif]-->
<!--[if IE 9]><html class="ie9 no-js" lang="en"><![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
	<!--<![endif]-->
	<!-- start: HEAD -->
	<head>
		<title>Change Password</title>
		<!-- start: META -->
		<meta charset="utf-8" />
		<!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
		<!-- end: META -->
		<!-- start: MAIN CSS -->
		<link rel="stylesheet" href="./resources/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="./resources/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="./resources/fonts/style.css">
		<link rel="stylesheet" href="./resources/css/main.css">
		<link rel="stylesheet" href="./resources/css/main-responsive.css">
		<link rel="stylesheet" href="./resources/plugins/iCheck/skins/all.css">
		<link rel="stylesheet" href="./resources/plugins/bootstrap-colorpalette/css/bootstrap-colorpalette.css">
		<link rel="stylesheet" href="./resources/plugins/perfect-scrollbar/src/perfect-scrollbar.css">
		<link rel="stylesheet" href="./resources/css/theme_light.css" type="text/css" id="skin_color">
		<link rel="stylesheet" href="./resources/css/print.css" type="text/css" media="print"/>
		<!--[if IE 7]>
		<link rel="stylesheet" href="./resources/plugins/font-awesome/css/font-awesome-ie7.min.css">
		<![endif]-->
		<!-- end: MAIN CSS -->
		<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
		<link rel="stylesheet" href="./resources/plugins/select2/select2.css">
		<link rel="stylesheet" href="./resources/plugins/datepicker/css/datepicker.css">
		<link rel="stylesheet" href="./resources/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css">
		<link rel="stylesheet" href="./resources/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css">
		<link rel="stylesheet" href="./resources/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css">
		<link rel="stylesheet" href="./resources/plugins/jQuery-Tags-Input/jquery.tagsinput.css">
		<link rel="stylesheet" href="./resources/plugins/bootstrap-fileupload/bootstrap-fileupload.min.css">
		<link rel="stylesheet" href="./resources/plugins/summernote/build/summernote.css">
		<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
	</head>
	<!-- end: HEAD -->
	<!-- start: BODY -->
	<body>
			<div class="container">
					<!-- start: PAGE CONTENT -->
					<div class="row">
						<div class="col-sm-12">
							<!-- start: TEXT FIELDS PANEL -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="fa fa-external-link-square"></i>
									Change Password
									<div class="panel-tools">
										<a class="btn btn-xs btn-link panel-collapse collapses" href="#">
										</a>
										<a class="btn btn-xs btn-link panel-config" href="#panel-config" data-toggle="modal">
											<i class="fa fa-wrench"></i>
										</a>
										<a class="btn btn-xs btn-link panel-refresh" href="#">
											<i class="fa fa-refresh"></i>
										</a>
										<a class="btn btn-xs btn-link panel-expand" href="#">
											<i class="fa fa-resize-full"></i>
										</a>
										<a class="btn btn-xs btn-link panel-close" href="#">
											<i class="fa fa-times"></i>
										</a>
									</div>
								</div>
								<div class="panel-body">
									<form role="form" action="./Change" method="post" class="form-horizontal">
										<div class="alert-success" style="text-align:center;margin-bottom: 20px;">${update}</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="form-field-1">
												Old Password
											</label>
											<div class="col-sm-9">
												<input type="text" placeholder="Old Password" id="form-field-1" class="form-control" name="oldpass">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="form-field-1">
												New Password
											</label>
											<div class="col-sm-9">
												<input type="text" placeholder="New Password" id="form-field-1" class="form-control" name="newpass">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="form-field-2">
												Re Password
											</label>
											<div class="col-sm-9">
												<input type="password" placeholder="New Password" id="form-field-2" class="form-control" name="repass">
											</div>
										</div>
										<div class="form-group">
										<button type="submit" class="btn btn-primary" style="border-left-width: 1px;margin-left: 18%;">
									    Change
								     </button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- end: PAGE CONTENT-->
			<!-- 	</div>
			</div> -->
			<!-- end: PAGE -->
		</div>
		<!-- end: MAIN CONTAINER -->
		<!-- start: MAIN JAVASCRIPTS -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script src="./resources/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
		<script src="./resources/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script src="./resources/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"></script>
		<script src="./resources/plugins/blockUI/jquery.blockUI.js"></script>
		<script src="./resources/plugins/iCheck/jquery.icheck.min.js"></script>
		<script src="./resources/plugins/perfect-scrollbar/src/jquery.mousewheel.js"></script>
		<script src="./resources/plugins/perfect-scrollbar/src/perfect-scrollbar.js"></script>
		<script src="./resources/plugins/less/less-1.5.0.min.js"></script>
		<script src="./resources/plugins/jquery-cookie/jquery.cookie.js"></script>
		<script src="./resources/plugins/bootstrap-colorpalette/js/bootstrap-colorpalette.js"></script>
		<script src="./resources/js/main.js"></script>
		<!-- end: MAIN JAVASCRIPTS -->
		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="./resources/plugins/jquery-inputlimiter/jquery.inputlimiter.1.3.1.min.js"></script>
		<script src="./resources/plugins/autosize/jquery.autosize.min.js"></script>
		<script src="./resources/plugins/select2/select2.min.js"></script>
		<script src="./resources/plugins/jquery.maskedinput/src/jquery.maskedinput.js"></script>
		<script src="./resources/plugins/jquery-maskmoney/jquery.maskMoney.js"></script>
		<script src="./resources/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="./resources/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
		<script src="./resources/plugins/bootstrap-daterangepicker/moment.min.js"></script>
		<script src="./resources/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
		<script src="./resources/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
		<script src="./resources/plugins/bootstrap-colorpicker/js/commits.js"></script>
		<script src="./resources/plugins/jQuery-Tags-Input/jquery.tagsinput.js"></script>
		<script src="./resources/plugins/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
		<script src="./resources/plugins/summernote/build/summernote.min.js"></script>
		<script src="./resources/plugins/ckeditor/ckeditor.js"></script>
		<script src="./resources/plugins/ckeditor/adapters/jquery.js"></script>
		<script src="./resources/js/form-elements.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script>
			jQuery(document).ready(function() {
				Main.init();
				FormElements.init();
			});
		</script>
	</body>
	<!-- end: BODY -->
</html>
