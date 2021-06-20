        jQuery(document).ready(function () {
    jQuery('#demo').paginate({
    	totalPage: 10,
    	  pageSize: 10,
    	  align: 'center'

    });
});

$(document).on('input', 'select', function(e){
var msg = $(this).children('option:selected').data('confirm');
if(msg != undefined && !confirm(msg)){
$(this)[0].selectedIndex = 0;
}
});
