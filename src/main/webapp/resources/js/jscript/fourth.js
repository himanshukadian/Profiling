function fourthchart(){
	$("#modelId").hide();
	$(".modal-backdrop.in").hide();	
	  $("#fourthchart").css("display","block");

	  var startdate = document.getElementById("sd").value.split(' ')[0];
		 startdate = [startdate.slice(-4), startdate.slice(0,2),startdate.slice(3,5)].join('');
		
		  var enddate = document.getElementById("ed").value.split(' ')[0];
		 enddate = [enddate.slice(-4), enddate.slice(0,2),enddate.slice(3,5)].join('');

	  var a=startdate+'/'+enddate;


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
	      var name=[];
	      var y=[];
	      var sites=[];
	  JSON.parse(response).forEach(function(d)
	      {	
	  		sites.push(d.errorDescription);
	  	//	console.log(sites.push(d.errorDescription));
	  name.push(d.errorDescription);
	  console.log(name[0])
	  console.log(name[1])
	  //console.log(errorDescription[i]);
	  y.push(d.count);
	  console.log(y[0])
	  console.log(y[1])
	  // console.log(count[i] );
	  //i=i+1;
	  data[name]=y;
	  //console.log(data);
	      });
	  Highcharts.chart('fourthchart', {
	      chart: {
	          type: 'pie',
	          options3d: {
                  enabled: true,
                  alpha: 45,
                  beta: 0
              },
	         
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

	  
	  
}