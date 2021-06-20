function myFunction() {

	 var startdate = document.getElementById("sd").value.split(' ')[0];
	 startdate = [startdate.slice(-4), startdate.slice(0,2),startdate.slice(3,5)].join('');

	 var enddate = document.getElementById("ed").value.split(' ')[0];
	 enddate = [enddate.slice(-4), enddate.slice(0,2),enddate.slice(3,5)].join('');

		var z=startdate+'/'+enddate;
	
		if(startdate==='' && enddate===''){
			alert("Please provide Start Date and End Date");
		}
		else if(startdate==='' || enddate===''){
			alert("Start Date or End Date is Missing");
		}
		else if(enddate<startdate){
			alert("End Date not be less than Start Date");
		}
		else{
			generate(z);
		}
	}
	
	function generate(a)
	{
		$(function ()
				
	{
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
			
            $.getJSON('http://13.233.63.248:8094/dns/reports/failureIpWiseReport/'+a+'/', function(data) 
            		
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
    renderTo: 'chart',
    type: 'column',
    plotAreaWidth: 300,
    plotAreaHeight: 400
    
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
    });
		
		
		
		
		
		 $(function () {
             var datetime=[];
				var ms0_10=[];
				var ms10_20=[];
				var ms20_30=[];
				var ms30_40=[];
				var ms40_50=[];
				var ms50Above=[];
				
				console.log(datetime)
             $.getJSON('http://13.233.63.248:8094/dns/reports/responseTimeReport/'+a+'', function(data) {
                 // Populate series
                 for (i = 0; i < data.length; i++){
					datetime.push(data[i].datetime);
                   ms0_10.push(data[i].ms0_10);
					  ms10_20.push(data[i].ms10_20);
					  ms20_30.push(data[i].ms20_30);
					  ms30_40.push(data[i].ms30_40);
					  ms40_50.push(data[i].ms40_50);
					  ms50Above.push(data[i].ms50Above);
					  
                 }
              
                 // draw chart
                Highcharts.chart('chart1', {
 chart: {
     type: 'bar',
     plotAreaWidth: 300,
     plotAreaHeight: 400
 },
 title: {
     text: ''
 },
 xAxis: {
     categories: datetime
 },
 yAxis: {
     min: 0,
     title: {
         text: ''
     }
 },
 legend: {
     reversed: true
 },
 plotOptions: {
     series: {
         stacking: 'normal'
     }
 },
 series: [
 	{
         name: 'ms0_10',
         data: ms0_10
     
 }, 
 
	{
     name: 'ms10_20',
     data: ms10_20
 
},
{
 name: 'ms20_30',
 data: ms20_30

},
{
 name: 'ms30_40',
 data: ms30_40

},
{
 name: 'ms40_50',
 data: ms40_50

},
{
 name: 'ms50Above',
 data: ms50Above

}]
});
             });
     });

	
		 $(function () {
	        	var datetime=[];
				var success=[];
				var failure=[];
					
	                $.getJSON('http://13.233.63.248:8094/dns/reports/performanceReport2/'+a+'/', function(data) {
	                    // Populate series
	                    for (i = 0; i < data.length; i++){
	                    	  datetime.push(data[i].datetime);
	    					  success.push(data[i].success);
	    					  failure.push(data[i].failure);
						  
	                    }
	                 
	                    // draw chart
	                    var chart = new Highcharts.Chart({
	                        chart: {
	                            renderTo: 'chart2',
	                            type: 'column',
	                            plotAreaWidth: 300,
	                            plotAreaHeight: 400
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
	                                categories: datetime,
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
	                    	                    name: 'success',
	                                            data: success
	                                        },
	                    					{
	                    					name: 'failure',
	                    					data: failure
	                    					}
	                    				
	                    					
	                    					]
	                                    }); 
	                            
	                });
	        });
	
		 
		 
		 $(function () {
			 var startdate = document.getElementById("sd").value.split(' ')[0];
			 startdate = [startdate.slice(-4), startdate.slice(0,2),startdate.slice(3,5)].join('');

			  var enddate = document.getElementById("ed").value.split(' ')[0];
				 enddate = [enddate.slice(-4), enddate.slice(0,2),enddate.slice(3,5)].join('');

			 var a=startdate+'/'+enddate;

			 var errorDescription=[];
			 var count=[];
			  /* var data=[];  */

			 $.ajax({
			     type: "GET",
			     url :'http://13.233.63.248:8094/dns/reports/failureCodeWiseReport/'+a+'/',
			     contentType: "application/json; charset=utf-8",
			     dataType : "html",
			     async: "true",
			     cache: "false",
			     success: function (result) {
			     	OnSuccess(result);
			     },
			     error: function (xhr, status, error) {
			         console.log(error);
			     }
			 });

			 	function OnSuccess(response) {
			     var data = {};
			    // var i=0;
			     var name=[];
			     var y=[];
			     var sites=[];
			 JSON.parse(response).forEach(function(d)
			     {	
			 		sites.push(d.errorDescription);
			 	//	console.log(sites.push(d.errorDescription));
			 name.push(d.errorDescription);
			 
			 //console.log(errorDescription[i]);
			 y.push(d.count);
			 
			 // console.log(count[i] );
			 //i=i+1;
			 data[name]=y;
			 //console.log(data);
			     });
			 Highcharts.chart('chart3', {
			     chart: {
			         type: 'pie',
			        
			     },
			     title: {
			         text: ''
			     },
			     tooltip: {
			         pointFormat: ''
			     },
			     plotOptions: {
			         pie: {
			             allowPointSelect: true,
			             cursor: 'pointer',
			             depth: 35,
			             dataLabels: {
			                 enabled: true,
			                 format: '<b>{point.name}</b>: {point.percentage:.1f} %',
			              }
			         }
			     },
			     series: [{
			         name: 'Brands',
			         colorByPoint: true,
			         data: [{
			             name: name[0],
			             y: y[0],
			             sliced: true,
			             selected: true
			         }, {
			             name: name[1],
			             y: y[1]
			         }, {
			             name: name[2],
			             y: y[2]
			         }, {
			             name: name[3],
			             y: y[3]
			         }, {
			             name: name[4],
			             y: y[4]
			         }, {
			             name: name[5],
			             y: y[5]
			         }, {
			             name: name[6],
			             y: y[6]
			         }, {
			             name: name[7],
			             y: y[7]
			         }, {
			             name: name[8],
			             y: y[8]
			         }]
			     }]

			 });

			 }
  
		 
		 });

		 
		 $(function () {
			    var datetime=[];
				var request=[];
				  var success=[];
					var failure=[];
					console.log(failure)
				 /* var data=[];  */
				
			    $.getJSON('http://13.233.63.248:8094/dns/reports/performanceReport/'+a+'/', function(data) {
			        // Populate series
			        for (i = 0; i < data.length; i++){
			        	datetime.push(data[i].datetime);
			        	request.push(data[i].request);
			        	success.push(data[i].success);
			        	failure.push(data[i].failure);
			        /*    data.push({"name":data[i].errorDescription,"y":data[i].count}); */ 
			        }
			        Highcharts.chart('chart4', {
			            chart: {
			                type: 'line',
			                plotAreaWidth: 300,
                            plotAreaHeight: 400
			                
			            },
			            title: {
			                text: ''
			            },

			            subtitle: {
			                text: ''
			            },

			            yAxis: {
			                title: {
			                    text: ''
			                }
			            },
			            legend: {
			                layout: 'vertical',
			                align: 'right',
			                verticalAlign: 'middle'
			            },

			            plotOptions: {
			                series: {
			                    label: {
			                        connectorAllowed: false
			                    },
			                    
			                }
			            },
			            xAxis: {
			                categories: datetime
			            },

			            series: [{
			                name: 'request',
			                data: request
			            },
			            {
			                name: 'success',
			                data: success
			            },
			            {
			                name: 'failure',
			                data: failure
			            }],

			            responsive: {
			                rules: [{
			                    condition: {
			                        maxWidth: 500
			    
			                    },
			                    chartOptions: {
			                        legend: {
			                            layout: 'horizontal',
			                            align: 'center',
			                            verticalAlign: 'bottom'
			                        }
			                    }
			                }]
			            }

			        });
			    });
			});

		 
		 $(function () {
             var ip=[];
				var ms0_10=[];
				var ms10_20=[];
				var ms20_30=[];
				var ms30_40=[];
				var ms40_50=[];
				var ms50Above=[];
				
             $.getJSON('http://13.233.63.248:8094/dns/reports/responseTimeIpWiseReport/'+a+'/', function(data) {
                 // Populate series
                 for (i = 0; i < data.length; i++){
					ip.push(data[i].ip);
                   ms0_10.push(data[i].ms0_10);
					  ms10_20.push(data[i].ms10_20);
					  ms20_30.push(data[i].ms20_30);
					  ms30_40.push(data[i].ms30_40);
					  ms40_50.push(data[i].ms40_50);
					  ms50Above.push(data[i].ms50Above);
					  
                 }
              
                 // draw chart
                 var chart = new Highcharts.Chart({
                     chart: {
                         renderTo: 'chart5',
                         type: 'column',
                         plotAreaWidth: 300,
                         plotAreaHeight: 400
                        
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
                 	                    name: 'ms0_10',
                                         data: ms0_10
                                     },
                 					{
                 					name: 'ms10_20',
                 					data: ms10_20
                 					},
                 					{
                 					name: 'ms20_30',
                 					data: ms20_30
                 					},
                 					
                 					{
                 	                    name: 'ms30_40',
                                         data: ms30_40
                                     },
                 					{
                 					name: 'ms40_50',
                 					data: ms40_50
                 					},
                 					{
                 					name: 'ms50Above',
                 					data: ms50Above
                 					}
                 					]
                                 }); 
                         
             });
     });

	}