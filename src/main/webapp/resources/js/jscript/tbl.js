$(document).ready(function(){
	function tbl(){
	alert("clicked")
	var a=[];
var output=[];
	$.ajax({
	    url: 'http://13.233.63.248:8080/analytics-api/graph/getData',
	    type : "post",
		contentType : "application/json;charset=utf-8",
		data: JSON.stringify({"request":{"user":{"name":"parveen","type":"admin"},"graph":{"id":"DWAS","order":0}},"startDate":"01-08-2018","endDate":"05-08-2018"}),
	    success: function (resp,data,val) {
	    	console.log(resp)
	  
	    	for (var i = 0; i < resp.data.length; i++) {

				if (i == 0) {
					name = resp.data[i].split(",");
					var subArrayLength = resp.data.length - 1 ;
					var seriesLength = name.length;
					mySeries = new Array( seriesLength ) ;
					for (var x = 0; x < seriesLength ; x++)
					{
						mySeries[x] = new Array(); 
					}


				} 
				else {
					var dataCStr = resp.data[i].split(",") ;
					for( var loc= 0; loc <dataCStr.length ; loc++)
					{
						if( loc == 0 )
							mySeries[loc].push( dataCStr[loc] );
					

						else
							mySeries[loc].push( parseFloat(dataCStr[loc] ));
						for( var loc = 0 ; loc < mySeries[0].length ; loc++)
							a.push(mySeries[0][loc]);
							console.log("==============="+a );
							var dataSet = [
								 a
								]; 
								$('#customers1').DataTable( {
								    data: a,
								    columns: [
								        { title: "DATE",
								        	data : "date"
								        }
								      ]
								} );
						
						
					}
				}
			  	

	    	}

	    },
	    error: function (req, status, err) {
	        console.log('Something went wrong', status, err);
	    }
	});
	}
});