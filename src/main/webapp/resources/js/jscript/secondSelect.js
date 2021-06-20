	var username = $("body").attr("data-username");
	var userType = $("body").attr("data-userType");
var str;
var jArray=[];
function my(value) {
	var e = document.getElementById("ut");
	str=e.options[e.selectedIndex].text;

	 a();
}
function a(){

	$.ajax({
		url : 'http://13.233.63.248:8080/analytics-api/config/graphForCategory',
		type : "post",
		cache: false ,
		async: true,
		contentType : "application/json;charset=utf-8",
	data: JSON.stringify({"user":{"name":username,"type":userType},"category":str}),
		success : function(result, request, response) {
		
			onSuccess(result);
	//		$("#ut option:contains('Traffic')").attr("disabled","disabled");
			$('#ut').children('option[value="' + str + '"]').attr('disabled', true)

		},
		error : function(xhr, status, error) {
			console.log(error);
		}
	});
	function onSuccess(response){
//console.log(response)
for(var i=0;i<response.graph_list.length;i++){
	jArray.push(response.graph_list[i].name);
	//console.log(jArray)	
	var select = document.getElementById("selectpicker");
	var option = document.createElement("option");
	option.text = response.graph_list[i].name;
	option.value = response.graph_list[i].id;
	select.add(option);
	
}

}
}
