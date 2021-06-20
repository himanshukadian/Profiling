function addToDashboard() {
			var username = $("body").attr("data-username");
			var userType = $("body").attr("data-userType");
			var module= $("body").attr("data-module");
			var select =document.getElementById("selectpicker").value;
			
			
			$.ajax({
				url : 'http://13.233.63.248:8080/analytics-api/user/addToDashBoardGraphs',
				type : "post",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify({"user":{"name":username,"type":userType,"module": module},"graph":{"id":select,"order":1}}),
						
				success : function(result, request, response) {
					alert(response.statusText);
					var url= "./railway?module=railway";
				    window.location = url;
					
		},
						error : function(xhr, status, error) {
						console.log(error);
						}
	
});

}		