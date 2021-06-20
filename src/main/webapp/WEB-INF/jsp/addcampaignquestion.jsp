<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	href="./resources/plugins/DataTables/media/css/DT_bootstrap.css" />
	<c:set var="context" value="${pageContext.request.contextPath}" />
</head>
<body data-module="${CampaignQuestion}">
		
<div class="modal fade" id="MMM" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
						<div class="modal-body">
                        <h4 class="modal-title">Sorry more than 10 questions not allowed!!</h4>
<button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
						</div>

				</div>
			</div>
		</div>
		<div class="modal fade" id="MCMODAL" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
						<div class="modal-body">
                        <h4 class="modal-title">Do you want to save the selected question?</h4>						</div>
<div class="modal-footer">
<button type="button" onclick="createjson2()" class="btn btn-default" >Yes</button>
<button type="button" class="btn btn-default" onclick="createcampaignQuestionwithoutsave()">No</button>

</div>
				</div>
			</div>
		</div>
		<a class="btn btn-sm btn-primary pull-right" onclick="getselectedanswer()" >Create Campaign Question</a>
<div class="row">
<span id="campaignid" style="display:none">${campaignId}</span>
<h4 class="center" >${Campaign}</h4>
                        	<div class="col-sm-6" style="margin-top: 19px;">
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="clip-checkbox"></i>
									Campaign Question
								</div>
								<div class="panel-body panel-scroll ps-container ps-active-y" style="height:200px; overflow-y: scroll;">
									<ul class="todo">
									<c:if test="${!empty ClientQuestion}">
									<c:forEach items="${ClientQuestion}" var="ClientQuestion">							
										<li>										
											<a class="todo-actions" >
												<span class="desc" style="opacity: 1; text-decoration: none;">${ClientQuestion.question} <input id="xxx${ClientQuestion.id}" value="${ClientQuestion.question}" style="display:none"><button class="btn btn-secondary btn-xs btnAdd" type="button" id="qqq${ClientQuestion.id}" value="${ClientQuestion.id}" >ADD</button></span>
											</a>
										</li>
										</c:forEach>
										</c:if>
									</ul>
								<div class="ps-scrollbar-x-rail" style="width: 380px; display: none; left: 0px; bottom: 3px;"><div class="ps-scrollbar-x" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; height: 300px; display: inherit; right: 3px;"><div class="ps-scrollbar-y" style="top: 0px; height: 217px;"></div></div></div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="clip-checkbox"></i>
									Standard Question
								</div>
								<div class="panel-body panel-scroll ps-container ps-active-y" style="height:200px;overflow-y: scroll;">
									<ul class="todo">
									<c:if test="${!empty StanderdQuestion}">
									<c:forEach items="${StanderdQuestion}" var="StanderdQuestion">							
										<li>										
											<a class="todo-actions" >
												<span class="desc" style="opacity: 1; text-decoration: none;">${StanderdQuestion.question} <input id="xxx${StanderdQuestion.id}" value="${StanderdQuestion.question}" style="display:none"><button class="btn btn-secondary btn-xs btnAdd" type="button" id="qqq${StanderdQuestion.id}" value="${StanderdQuestion.id}" >ADD</button></span>
											</a>
										</li>
										</c:forEach>
										</c:if>
									</ul>
								<div class="ps-scrollbar-x-rail" style="width: 380px; display: none; left: 0px; bottom: 3px;"><div class="ps-scrollbar-x" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; height: 300px; display: inherit; right: 3px;"><div class="ps-scrollbar-y" style="top: 0px; height: 217px;"></div></div></div>
							</div>
						</div>
					</div>

<div class="row">
<div class="col-sm-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="clip-checkbox"></i>
									Selected Question 
								</div>
								<div class="panel-body panel-scroll ps-container ps-active-y" style="height:200px;overflow-y: scroll;">
									<ol id="TextBoxContainer">
									
									</ol>
									<button id="btnSave" type="button"
																	class="btn btn-lg btn-primary" data-toggle="tooltip"
																	onclick="createjson()" disabled="disabled">Save & Next</button>
								<div class="ps-scrollbar-x-rail" style="width: 380px; display: none; left: 0px; bottom: 3px;"><div class="ps-scrollbar-x" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; height: 300px; display: inherit; right: 3px;"><div class="ps-scrollbar-y" style="top: 0px; height: 217px;"></div></div></div>
							</div>
						</div>
						</div>
<script type="text/javascript">

function getselectedanswer(){
	//alert($('ol#TextBoxContainer li').length)
	if($('ol#TextBoxContainer li').length>0){
		$('#MCMODAL').modal('show');
	}
	else{
		var campaignId=document.getElementById("campaignid").innerHTML
		window.location.href = '${context}/addQuestionToCampaign?campaignId='+campaignId
	}
}

function createcampaignQuestionwithoutsave(){
	var campaignId=document.getElementById("campaignid").innerHTML
	window.location.href = '${context}/addQuestionToCampaign?campaignId='+campaignId
	
}


var arr=$('body').attr('data-module');
//alert(arr.length);
var ele=0;
if(arr.length==2){
ele=0;	
}
else{
ele=(arr.length)/4;
}
$(function () {   
    $(".btnAdd").bind("click", function () {
    	document.getElementById("btnSave").disabled = "";
       // alert(ele);
    	if(ele<10){
        var div = $("<div class='dynTR' />");
         var testvalue = this.value;
         this.disabled = true
        div.html(GetDynamicTextBox(testvalue));
        $("#TextBoxContainer").append(div);
        ele=ele+1;
        }
        else{
        $('#MMM').modal('show');
        }
    });
    $("body").on("click", ".remove", function () {
        $(this).closest("div").remove();
        var x=this.id;
       document.getElementById(x).disabled=false;
        ele=ele-1;
    });
});
function GetDynamicTextBox(value) {
	var ccc=document.getElementById("xxx"+value).value;
    return '<li><a class="todo-actions" style="background: white;border-bottom: 1px solid #E4E6EB;font-size: 12px; margin-left: 0 !important;padding: 10px 10px 10px 35px !important;position: relative;display: block; color: #333333;"><span class="desc" style="opacity: 1; text-decoration: none;">'+ccc+'</span><input id ="questions" type="text" value = "' + value + '" style="display:none"/>&nbsp;' +
            '<input type="button" id="qqq'+value+'" value="Remove" class="btn btn-danger btn-xs remove" /></a></li>'
}
</script>
<script>
//alert($('#TextBoxContainer li').length);
		function createjson() {
			resultArr = [];
			$(".dynTR").each(function(key, val) {
         
				val = $(this);
				if (val.html() !== "") {

					var obj = {
						id : val.find('#questions').val(),
						campaignId :document.getElementById("campaignid").innerHTML
					}
					

				}
				resultArr.push(obj);
				console.log(resultArr)
			});
			var resultJson = {};
			$.ajax({
				url : '${context}/addQuestion',
				data : JSON.stringify(resultArr),
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					var campaignId=document.getElementById("campaignid").innerHTML
					//alert('${context}/fupdateCampaignQuestion?campaignId='+campaignId);
					window.location.href = '${context}/fupdateCampaignQuestion?campaignId='+campaignId
				},
				error : function() {

				}
			});
		}
		function createjson2() {

			resultArr = [];
			$(".dynTR").each(function(key, val) {
         
				val = $(this);
				if (val.html() !== "") {

					var obj = {
						id : val.find('#questions').val(),
						campaignId :document.getElementById("campaignid").innerHTML
					}
					

				}
				resultArr.push(obj);
				console.log(resultArr)
			});
			var resultJson = {};
			resultJson["question"] = resultArr;
			$.ajax({
				url : '${context}/addQuestion',
				data : JSON.stringify(resultArr),
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					var campaignId=document.getElementById("campaignid").innerHTML
					//alert('${context}/fupdateCampaignQuestion?campaignId='+campaignId);
					window.location.href = '${context}/addQuestionToCampaign?campaignId='+campaignId
				},
				error : function() {

				}
			});
		}
	</script>

</body>
</html>
