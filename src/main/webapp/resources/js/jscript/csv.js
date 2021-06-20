function csv() {
var startdate = document.getElementById("startDate").value.replace(-/-/,"");

var enddate = document.getElementById("endDate").value.replace(-/-/,"");

var z=startdate+'/'+enddate;
    $.ajax({
		type : 'GET',
	       url: 'http://13.127.138.204:8094/dns/reports/failureIpWiseReport/'+z+'',
		   contentType: "application/json",
	       dataType: 'html',
	       success: function(response,request) {
	    	
	    	 
		  var json3 = {
		          "count":2,
		          "items":JSON.parse(response)
		        };
		   
		        const items = json3.items
		   console.log(items)
		        const replacer = (key, value) => value === null ? '' : value // specify how you want to handle null values here
		        		 
		        		const header = Object.keys(items[0])
		           
		        let csv = items.map(row => header.map(fieldName => JSON.stringify(row[fieldName], replacer)).join(','))
		        
		        csv.unshift(header.join(','))
		        csv = csv.join('\r\n')
		    
		        var link = document.createElement("a");    
		        link.id="lnkDwnldLnk";
		        document.body.appendChild(link);
		        blob = new Blob([csv], { type: 'text/csv' }); 
		        var csvUrl = window.webkitURL.createObjectURL(blob);
		        var filename = 'failureIpWiseReport.csv';
		        jQuery("#lnkDwnldLnk")
		        .attr({
		            'download': filename,
		            'href': csvUrl
		        });
		        jQuery('#lnkDwnldLnk')[0].click();
		        document.body.removeChild(link);
		   },
		   error :function(result){
		   alert("data not found");
		   }
    });
}