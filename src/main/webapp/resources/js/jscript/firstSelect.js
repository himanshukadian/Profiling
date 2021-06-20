$(document).ready(function() {
	var username = $("body").attr("data-username");
	var userType = $("body").attr("data-userType");
	var module= $("body").attr("data-module");
	console.log("module name is"+userType)
	console.log("module name is"+module)
var graphType=[];
$.ajax({
	url : 'http://13.233.63.248:8080/analytics-api/config/category',
	type : "post",
	cache: false ,
	async: true,
	contentType : "application/json;charset=utf-8",
	
	data:JSON.stringify( {"user":{"name":username,"type":userType,"module":module} ,"graph":{"id":"","order":0} } ),
	success : function(result, request, response) {
	
		onSuccess(result);

	},
	error : function(xhr, status, error) {
		console.log(error);
	}
});
function onSuccess(response){


	for(var i=0;i<response.category.length;i++){
	graphType.push(response.category[i]);

var select = document.getElementById("ut");

var option = document.createElement("option");
option.text = response.category[i];
option.value = response.category[i];
select.add(option);
	//document.getElementById("opt").innerHTML = graphType;
}

}
});