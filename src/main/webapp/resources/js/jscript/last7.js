function last7(){	
var MyDate = new Date();
	var currentDate;

	MyDate.setDate(MyDate.getDate());

	currentDate = (MyDate.getFullYear()+ '' + ('0' + (MyDate.getMonth()+1)).slice(-2)+''+('0'+MyDate.getDate()).slice(-2)) ;

	
		var lastDate = new Date();
var finaldate=7;

	lastDate.setDate(MyDate.getDate()-finaldate);

	last7days = (MyDate.getFullYear()+ '' + ('0' + (lastDate.getMonth()+1)).slice(-2)+''+('0'+lastDate.getDate()).slice(-2)) ;

	
	var z=currentDate+'/'+last7days;
	alert(z)
}


function generate(a)
{
	 $.ajax({
			type : 'GET',
		       url: 'http://13.127.138.204:8094/dns/reports/failureIpWiseReport/'+z+'/',
			   contentType: "application/json",
		       dataType: 'html',
		       success: function(result) {
			   onSuccess(result);
			   },
			   error :function(result){
			   alert("data not found");
			   }
			   
			  });
		function onSuccess(response)
		{
			setTimeout(function()
			{
				var chart=c3.generate(
				{
					bindto:"#chart",
					data: {
						x: "ip",
						json:JSON.parse(response),
				keys: {
		            x: 'ip',
		            value: ['formatError','serverFailure','non_ExistentDomainName','notImplemented','queryRefused','nameExistsWhenItsShouldNot','rrsetExistsWhenItShouldNot','rrsetThatShouldExistDoesNot','serverNotAuthoritativeForZone','nameNotContainedInZone']
		        },
				type: 'bar',
		    },
		    bar: {
		        width: {
		            ratio: 0.5
		        }
		    },
			 axis: {
		            x: {
		                type: 'category'
		            }
		    },
		});
		});
		}
		
		$.ajax({
			type : 'GET',
		       url: 'http://13.127.138.204:8094/dns/reports/responseTimeReport/'+z+'/',
			   contentType: "application/json",
		       dataType: 'html',
		       success: function(result) {
			   onSuccess1(result);
			   
			
			   },
			  
			   
			  });
		function onSuccess1(response)
		{
			setTimeout(function()
			{
				var chart=c3.generate(
				{
					bindto:"#chart1",
					data: {
						x: "datetime",
						json:JSON.parse(response),


					
		     
		        keys: {
		            x: "datetime",
		            value: ["ms0_10", "ms10_20","ms20_30","ms30_40","ms40_50","ms50Above"]
		        },
		                groups: [
		        ["ms0_10", "ms10_20","ms20_30","ms30_40","ms40_50","ms50Above"]
		    ],
		    type: 'bar',
		  
		},
		axis: {
		rotated: true,
		x:{
			type:'category',
		}
		
		
			}
				});
			});
		}
		


$.ajax({
	type : 'GET',
       url: 'http://13.127.138.204:8094/dns/reports/performanceReport2/'+z+'/',
	   
	   contentType: "application/json; charset=utf-8",
	    dataType : "html",
	    async: "true",
	    cache: "false",
	   
       
       success: function(result) {
	   onSuccess2(result);
	   
	
	   },
	  
	  });
function onSuccess2(response)
{
	setTimeout(function()
	{
		var chart=c3.generate(
		{
			bindto:"#chart2",
			data: {
				x: "datetime",
				json:JSON.parse(response),
		keys: {
            x: 'datetime',
            value: ['success','failure']
        },
		type: 'bar',
    },
    bar: {
        width: {
            ratio: 0.5
        }
    },
	 axis: {
            x: {
                type: 'category'
            }
    },
});
});
}


$.ajax({
    type: "GET",
    url :'http://13.127.138.204:8094/dns/reports/failureCodeWiseReport/' +z+'/',
    contentType: "application/json; charset=utf-8",
    dataType : "html",
    async: "true",
    cache: "false",
    success: function (result) {
    	OnSuccess3(result);
    },
    error: function (xhr, status, error) {
        console.log(error);
    }
});

	function OnSuccess3(response) {
    var data = {};
   
    var errorDescription;
    var count;
    var sites=[];
JSON.parse(response).forEach(function(d)
    {	
		sites.push(d.errorDescription);
		
errorDescription=d.errorDescription;

count =d.count;

data[d.errorDescription]=d.count;

    });

	var chart = c3.generate({
		bindto:"#chart3",

	    data: {
	        json:[data] ,
	        type:'pie'  ,
	        keys: true,
	        keys:{
	        	  value:sites,
	          }
	
	    },
	    
	    legend: {
	        position: 'right'
	    }
	 
	});
}
	
	$.ajax({
	    type: "GET",
	    url: 'http://13.127.138.204:8094/dns/reports/performanceReport/'+z+'/',
	    contentType: "application/json; charset=utf-8",
	    dataType : "html",
	    async: "true",
	    cache: "false",
	    success: function (result) {
	    	OnSuccess4(result);
	    },
	   
	});

	function OnSuccess4(response) {
	    

	setTimeout(function () {


		var abc=c3.generate({
			bindto:"#chart4",
			data: {
			
				json: JSON.parse(response) ,
			
		       keys: {
		            x: 'datetime',
		            value: [ "request", "success","failure" ]
		       }     
		},
			
			axis: {
		          x: {
		            type: "category"
		          }
		        }
		          
		 });
	}, 1000);


		

	    function loadData() {  
	    	setTimeout(function () {
	    	    abc.load({
	    	        columns: [
	    	           
	    	        ]
	    	    });
	    	}, 1000);
	
	    }
	    }
	
	
	
	$.ajax({
		type : 'GET',
	       url: 'http://13.127.138.204:8094/dns/reports/responseTimeIpWiseReport/'+z+'/',
		   contentType: "application/json",
	       dataType: 'html',
	       success: function(result) {
		   onSuccess5(result);
		   
		
		   },
		  
		  });
	function onSuccess5(response)
	{
		setTimeout(function()
		{
			var chart=c3.generate(
			{
				bindto:"#chart5",
				data: {
					x: "ip",
					json:JSON.parse(response),
			keys: {
	            x: 'ip',
	            value: ['ms0_10','ms10_20','ms20_30','ms30_40','ms40_50','ms50Above']
	        },
			type: 'bar',
	    },
	    bar: {
	        width: {
	            ratio: 0.5
	        }
	    },
		 axis: {
	            x: {
	                type: 'category'
	            }
	    },
	});
	});
	}	
}