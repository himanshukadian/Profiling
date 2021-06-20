function performanceReport() {
	$("#modelId").show();
	$(".modal-backdrop.in").show();

	 var startdate = document.getElementById("sd").value.split(' ')[0];
	 startdate = [startdate.slice(-4), startdate.slice(0,2),startdate.slice(3,5)].join('');
	
	  var enddate = document.getElementById("ed").value.split(' ')[0];
	 enddate = [enddate.slice(-4), enddate.slice(0,2),enddate.slice(3,5)].join('');

var a=startdate+'/'+enddate;
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
                renderTo: 'performanceReport',
                type: 'column',
                plotAreaWidth: 800,
                plotAreaHeight: 500
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
}	