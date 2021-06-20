			var startdate;
			var enddate;
			var selectedNode;
function myFunction() {
			var username = $("body").attr("data-username");
	
			var userType = $("body").attr("data-userType");
			
			var jArray = []
			var res;
			var nme = [];
			var respArray = [];
			var usertype = document.getElementById("ut").value;
			var e = document.getElementById("ut");
			str=e.options[e.selectedIndex].text;
			var select =document.getElementById("selectpicker").value;
			startdate = document.getElementById("sd").value.split(' ')[0];
			startdate = [startdate.slice(3,5), startdate.slice(0,2),startdate.slice(6,10)].join("-");

			enddate = document.getElementById("ed").value.split(' ')[0];
			enddate = [enddate.slice(3,5), enddate.slice(0,2),enddate.slice(6,10)].join("-");

			var e = document.getElementById("ut");
			var elem = document.getElementById("selectpicker"),
			selectedNode = elem.options[elem.selectedIndex].value;

$.ajax({
				url : 'http://13.233.63.248:8080/analytics-api/graph/getData',
				type : "post",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify({
					"request" : {
						"user" : {
							"name" : username,
							"type" : userType,
							"module":userType,
						},
						"graph" : {
							"id" : select,
							"order" : 0
						}
					},
					"startDate" : startdate,
					"endDate" : enddate
				}),
						
						
			success : function(result, request, response) {
					setGraphData(result);
					
		},
						error : function(xhr, status, error) {
						console.log(error);
						}
});

	}
			function setGraphData(response) {
	
				var name;
				var mySeries;
				for (var i = 0; i < response.data.length; i++) {
					if (i == 0) {
						name = response.data[i].split(",")			 ;
						var subArrayLength = response.data.length - 1 ;
						var seriesLength = name.length;
						mySeries = new Array( seriesLength ) ;
						for (var x = 0; x < seriesLength ; x++) {
							mySeries[x] = new Array(); 
						}


					}
					else
					{
						var dataCStr = response.data[i].split(",") ;
						for( var loc= 0; loc <dataCStr.length ; loc++){
							if( loc == 0 )
								mySeries[loc].push( dataCStr[loc] );

							else
								mySeries[loc].push( parseFloat(dataCStr[loc] ));
						}
					}
				}
				$.ajax({
					url :'http://13.233.63.248:8080/analytics-api/user/addToDashBoardGraphs',
					type : "post",
					contentType : "application/json;charset=utf-8",
					data: JSON.stringify({"user":{"name":username,"type":userType},"graph":{"id":selectedNode,"order":1}}),
					success : function(result, request, response) {
					
					},
					error : function(xhr, status, error) {
						alert("!Oops")
					}
});
				DataInChart(name , mySeries) ;
		}
					function DataInChart ( name, mySeries){

							for( var loc = 0 ; loc < mySeries[0].length ; loc++){
						//	console.log( mySeries[0][loc]);
				}
							
							
	var container = Highcharts.chart('cnt', { chart : {
							type : 'line',
							options3d : {
							enabled : true,
							alpha : 0,
							beta : -8,
							viewDistance : 20,
							depth : 100
						},

					},
							title : {
							text : 'Sample'
					},

							subtitle : {
							text : ''
					},

							yAxis : {

							title : {
							text : ''
						}
					},
							legend : {
							layout : 'vertical',
							align : 'right',
							verticalAlign : 'middle'
					},

							plotOptions : {
							series : {
							label : {
								connectorAllowed : false
							},

						}
					},
							xAxis : {
							categories : mySeries[0] ,
					},

					series : [] ,
					responsive : {
						rules : [ {
							condition : {
								maxWidth : 500

							},
					chartOptions : {
								legend : {
									layout : 'horizontal',
									align : 'center',
									verticalAlign : 'bottom'
								}
							}
						} ]
					}

				});
				for( var series = 1 ; series < mySeries.length ;series++ ){
		//			console.log( series +" = " + mySeries.length  + "name="+ name[series] ) ;
					container.addSeries( {name : name[series] , data : mySeries[series] } ) ;
					
				}
				

			}
