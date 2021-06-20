<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	if (session.getAttribute("username") != null && session.getAttribute("usertype") != null) {
%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<title>${ProjectName}</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="" name="description" />
<meta content="" name="author" />
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
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button data-target=".navbar-collapse" data-toggle="collapse"
					class="navbar-toggle" type="button">
					<span class="clip-list-2"></span>
				</button>
				<a target="mainArea" class="navbar-brand" href="./Home"> <img
					src="./resources/images/logo.png" style="width: 16%;" class="img">${ProjectName}
				</a>
			</div>
			<div class="navbar-tools">
				<ul class="nav navbar-right">
					<li class="dropdown current-user"><a data-toggle="dropdown"
						data-hover="dropdown" class="dropdown-toggle"
						data-close-others="true" href="#"> <span class="username">${username}</span>
							<i class="clip-chevron-down"></i>
					</a>
						<ul class="dropdown-menu">
							<li><a target="mainArea" href="./ChangePassword"> <i
									class="clip-key-2"></i> &nbsp;Change Password
							</a></li>
							<li><a href="./Logout"> <i class="clip-exit"></i>
									&nbsp;Log Out
							</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="main-container">
		<div class="navbar-content">
			<div class="main-navigation navbar-collapse collapse">
				<div class="navigation-toggler">
					<i class="clip-chevron-left"></i> <i class="clip-chevron-right"></i>
				</div>
				<ul class="main-navigation-menu">
					<c:forEach items="${Features}" var="list">
						<c:choose>
							<c:when test="${empty list.subfeature}">
								<li><a target="mainArea" href="${list.link}" class="nav"
									style="font-size: 120%;"><i class="${list.logo}"></i> <span
										class="title">${list.featureName}</span> </a></li>
							</c:when>
							<c:otherwise>
								<li><a href="javascript:void(0)"><i
										class="${list.logo}"></i> <span class="title"
										style="font-size: 120%;">${list.featureName}</span><i
										class="icon-arrow"></i> <span class="selected"></span> </a>
									<ul class="sub-menu">
										<c:forEach items="${list.subfeature}" var="slist">
											<li><a target="mainArea" href="${slist.link}"> <span
													class="title" style="font-size: 120%;">${slist.featureName}</span>
											</a></li>
										</c:forEach>
									</ul></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</div>
		</div>

		<div class="main-content">
			<div class="container" style="padding: 0px">
				<!-- start: PAGE HEADER -->
				<div class="row">
					<div class="col-sm-12">
						<ol class="breadcrumb">
							<li><i class="clip-home-3"></i> <a href="#"></a></li>
							<li class="active"></li>
						</ol>
					</div>
				</div>
				<!-- end: PAGE HEADER -->
				<!-- start: PAGE CONTENT -->
				<div class="embed-responsive embed-responsive-16by9"
					style="background-color: #f6f6f6;">
					<iframe name="mainArea" class="embed-responsive-item"
						scrolling="yes" frameBorder="0" src="DashboardReport" width="100%"
						height="600px"></iframe>
				</div>

			</div>

		</div>
	</div>
	<div class="footer clearfix">
		<div class="footer-inner">2018 &copy; ${ProjectName}</div>
		<div class="footer-items">
			<span class="go-top"><i class="clip-chevron-up"></i></span>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
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
	<script>
		jQuery(document).ready(function() {
			Main.init();
		});
	</script>
	<script>
	$('.nav').on('click', function(){
	  //alert("hahaha");
		// $('.btn-navbar').click(); //bootstrap 2.xnavbar-toggle
	    $('.navbar-toggle').click(); //bootstrap 3.x by Richard
	  //  $('.navbar-toggler').click(); //bootstrap 4.x
	});
	</script>
</body>
<!-- end: BODY -->
</html>
<%
	} else {

		response.sendRedirect("./Login");
	}
%>