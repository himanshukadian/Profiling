function fcw() {
	$("#modelId").show();
	$(".modal-backdrop.in").show();

	 var startdate = document.getElementById("sd").value.split(' ')[0];
	 startdate = [startdate.slice(-4), startdate.slice(0,2),startdate.slice(3,5)].join('');
	
	  var enddate = document.getElementById("ed").value.split(' ')[0];
	 enddate = [enddate.slice(-4), enddate.slice(0,2),enddate.slice(3,5)].join('');

var a=startdate+'/'+enddate;
  				var ip=[];
				var formatError=[];
				var serverFailure=[];
				var non_ExistentDomainName=[];
				var notImplemented=[];
				var queryRefused=[];
				var nameExistsWhenItsShouldNot=[];
				var rrsetExistsWhenItShouldNot=[];
				var rrsetThatShouldExistDoesNot=[];
				var serverNotAuthoritativeForZone=[];
				var nameNotContainedInZone=[];
				console.log(ip)

	            $.getJSON('http://13.233.63.248:8094/dns/reports/failureIpWiseReport/'+a+'', function(data) 
	            		
	      {
	                // Populate series
	                for (i = 0; i < data.length; i++)
	                {
						ip.push(data[i].ip);
	                  formatError.push(data[i].formatError);
					  serverFailure.push(data[i].serverFailure);
					  non_ExistentDomainName.push(data[i].non_ExistentDomainName);
					  notImplemented.push(data[i].notImplemented);
					  queryRefused.push(data[i].queryRefused);
	                  nameExistsWhenItsShouldNot.push(data[i].nameExistsWhenItsShouldNot);
					  rrsetExistsWhenItShouldNot.push(data[i].rrsetExistsWhenItShouldNot);
					  rrsetThatShouldExistDoesNot.push(data[i].rrsetThatShouldExistDoesNot);
					  serverNotAuthoritativeForZone.push(data[i].serverNotAuthoritativeForZone);
					  nameNotContainedInZone.push(data[i].nameNotContainedInZone);
	                }
	             
	                // draw chart
	var chart = new Highcharts.Chart({
	chart: {
	    renderTo: 'sec',
	    type: 'column',
	    plotAreaWidth: 1000,
	    plotAreaHeight: 600
	    
	},
	title: {
	    text: ''
	},
	xAxis: {
	        type: 'category',
	        labels: {
	            overflow: 'justify'
	        },
	        startOnTick: true,
	        showFirstLabel: true,
	        endOnTick: true,
	        showLastLabel: true,
	        categories: ip,
	        tickInterval: 1,
	        labels: {
	            rotation: 0.1,
	            align: 'left',
	            step: 1,
	            enabled: true
	        },
	        style: {
	            fontSize: '8px'
	        },
			},
	subtitle: {
	    text: ''
	},

		
	                series: [
			
					{
	                    name: 'formatError',
	                    data: formatError
	                },
					{
					name: 'serverFailure',
					data: serverFailure
					},
					{
					name: 'non_ExistentDomainName',
					data: non_ExistentDomainName
					},
					
					{
	                    name: 'notImplemented',
	                    data: notImplemented
	                },
					{
					name: 'queryRefused',
					data: queryRefused
					},
					{
					name: 'nameExistsWhenItsShouldNot',
					data: nameExistsWhenItsShouldNot
					},
					
					{
	                    name: 'rrsetExistsWhenItShouldNot',
	                    data: rrsetExistsWhenItShouldNot
	                },
					{
					name: 'rrsetThatShouldExistDoesNot',
					data: rrsetThatShouldExistDoesNot
					},
					{
					name: 'serverNotAuthoritativeForZone',
					data: serverNotAuthoritativeForZone
					},
					
					{
					name: 'nameNotContainedInZone',
					data: nameNotContainedInZone
					}
					
					]
	            }); 
	        });
}