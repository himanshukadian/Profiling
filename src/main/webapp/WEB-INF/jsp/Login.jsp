<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login</title>
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
<body class="login example2">
	<div class="main-login col-sm-4 col-sm-offset-4">
		<div class="box-login">
			<div class="logo">
				<img src="./resources/images/logo.png" style="height: 50px;"
					class="img">${ProjectName}</div>
			<h3 class="center">Login to your account</h3>
			<p class="center">Please enter your username and password to log
				in.</p>
			<span
				style="background-color: #f2dede; border-color: #ebccd1; color: #653838; display: block; margin-bottom: 13px; text-align: center;">${msg}</span>
			<form class="form-login" action="./Main" method="post" id="formId"
				id="addform">
				<fieldset>
					<div class="form-group">
						<select class="form-control" name="usertype">
							<option value="" style="display: none">Select User</option>
							<c:if test="${!empty usertype}">
								<c:forEach items="${usertype}" var="userType">
									<option value="${userType.usertype}">${userType.usertype}</option>
								</c:forEach>
							</c:if>
						</select>
					</div>
					<div class="form-group">
						<span class="input-icon"> <input type="text"
							class="form-control" placeholder="Username" name="username"><i
							class="fa fa-user"></i>
						</span>
					</div>
					<div class="form-group form-actions">
						<span class="input-icon"> <input type="password"
							class="form-control" placeholder="Password" name="password"><i
							class="fa fa-lock"></i>
						</span>
					</div>
					<div class="form-actions">
						<button type="submit" class="btn btn-bricky pull-right">
							Login <i class="fa fa-arrow-circle-right"></i>
						</button>
					</div>
				</fieldset>
			</form>
		</div>
		<div class="copyright">2018 &copy; ${ProjectName}.</div>
	</div>
</body>
<!-- end: BODY -->
</html>