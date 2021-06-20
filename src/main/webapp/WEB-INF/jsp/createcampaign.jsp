



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
						<i class="fa fa-external-link-square"></i>Create Campaign
						<div class="panel-tools"></div>
					</div>
					<div class="panel-body">
						<form role="form" action="./createCampaign" method="post"
							class="form-horizontal" id="addform">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="form-field-2">
									Description</label>
								<div class="col-sm-9">
									<input type="text" maxlength="50" placeholder="Description"
										id="form-field-2" class="form-control" name="description"
										required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="form-field-1">
									Quota </label>
								<div class="col-sm-9">
									<input type="text" class="form-control" placeholder="Quota"
										name="quota" id="quota" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="form-field-1">
							    Client Link</label>
								<div class="col-sm-9">
									<input type="url"  class="form-control" id="clink" name="clientLink"
										placeholder="Client Link" >
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"  id="cllink" for="form-field-1">
							    Callback Link </label>
								<div class="col-sm-9">
									<input type="url" class="form-control" name="callbackLink"
										placeholder="Callback Link">
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
			<!-- end: DYNAMIC TABLE PANEL -->
		</div>
	</div>

	<!-- end: PAGE CONTENT-->
	<!-- 	</div>
			</div> -->
	<!-- end: PAGE -->
	<!-- start: MAIN JAVASCRIPTS -->
	<script>
		$('#quota').on('change', function() {
			setIntegerFilter($("#quota"), 2147483647);
		});
		$('#quota').on('keypress', function() {
			setIntegerFilter($("#quota"), 2147483647);
		});
		function setPatternFilter(obj, pattern) {
			  setInputFilter(obj, function(value) { return pattern.test(value); });
			}

			// Restricts input for all elements in the given jQuery object to integers up to the given limit.
			function setIntegerFilter(obj, limit) {
			  setInputFilter(obj, function(value) {
			    return value === "" || (/^\d+$/.test(value) && parseInt(value) <= limit);
			  });
			}

			// Restricts input for all elements in the given jQuery object according to the given inputFilter.
			function setInputFilter(obj, inputFilter) {
			  obj.on("input keydown keyup mousedown mouseup select contextmenu", function() { filterInput(this); });
			  obj.each(function(index, element) {
			    element.inputFilter = inputFilter;
			    filterInput(element);
			  });
			}

			// Implements input filtering for the given textbox.
			function filterInput(textbox) {
			  if (!textbox.hasOwnProperty("oldValue") || textbox.inputFilter(textbox.value)) {
			    textbox.oldValue = textbox.value;
			    textbox.oldSelectionStart = textbox.selectionStart;
			    textbox.oldSelectionEnd = textbox.selectionEnd;
			  } else {
			    textbox.value = textbox.oldValue;
			    textbox.setSelectionRange(textbox.oldSelectionStart, textbox.oldSelectionEnd);
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