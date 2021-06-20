function pReport() {
	$("#modelId").show();
	$(".modal-backdrop.in").show();
	 var startdate = document.getElementById("sd").value.split(' ')[0];
	 startdate = [startdate.slice(-4), startdate.slice(0,2),startdate.slice(3,5)].join('');
	
	  var enddate = document.getElementById("ed").value.split(' ')[0];
	 enddate = [enddate.slice(-4), enddate.slice(0,2),enddate.slice(3,5)].join('');

var a=startdate+'/'+enddate;
var datetime=[];
var request=[];
  var success=[];
	var failure=[];
	

$.getJSON('http://13.233.63.248:8094/dns/reports/performanceReport/'+a+'/', function(data) {
    // Populate series
    for (i = 0; i < data.length; i++){
    	datetime.push(data[i].datetime);
    	request.push(data[i].request);
    	success.push(data[i].success);
    	failure.push(data[i].failure);
    /*    data.push({"name":data[i].errorDescription,"y":data[i].count}); */ 
    }
    Highcharts.chart('pReport', {
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
    }		