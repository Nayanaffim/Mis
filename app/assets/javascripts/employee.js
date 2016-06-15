function check(){	
  	if($("#copy_add").is(':checked'))
  	 {
  	  $('#permanent_address').val($('#current_address').val()).attr('readonly', true);
  	 }
  	else
  	 {
  	   $('#permanent_address').val("").attr('readonly', false);
  	 }
  }

  $(document).ready(function(){
    $("#date_of_birth").datepicker({ 
      format: "dd/mm/yyyy",
      endDate: '-1d' 
    });
     $("#date_of_joining").datepicker({ 
      format: "dd/mm/yyyy",
      startDate: '+d'
    });
  });  
  