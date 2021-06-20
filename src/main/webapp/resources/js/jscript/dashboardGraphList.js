$(document).ready(function(){
	var username = $("body").attr("data-username");
    var userType = $("body").attr("data-userType");
   
	var name,type;
	var id=[];
	var order=[];
	
	$.ajax({
			url : ' http://13.233.63.248:8080/analytics-api/user/dashBoardGraphList',
			type : "post",
			contentType : "application/json;charset=utf-8",
			data: JSON.stringify({"user":{"name" : username,
				"type" : userType},"graph":{"id":""}}),
			success : function(result, request, response) 
			{
				 onSuccess(result);
	
	},
			error : function(xhr, status, error) {
			alert("!Oops ")
			}
		});
		

	function onSuccess(response){
		name=response.user.name;
		type=response.user.type;

		for(var i=0;i<response.graph_list.length;i++)
	{
			
			id.push(response.graph_list[i].id);
			order.push(response.graph_list[i].order);
			
	}

		alert("Success");
		}
			});