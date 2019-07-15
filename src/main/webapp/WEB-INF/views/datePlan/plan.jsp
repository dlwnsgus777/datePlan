<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<script>
$(function(){

    $('#dateRangePicker').datepicker({

        calendarWeeks	: false,
        todayHighlight	: true,
        autoclose		: true,
        format			: "yyyy/mm/dd",
        language		: "kr"

    });

});
</script>
<style>
.datepicker {
	margin : 0 auto;
	width : 320px;
}
.table-condensed {
	margin : 0 auto;
	width : 320px;
	height: 250px;
}

</style>
 <div class="row slider-text align-items-center justify-content-center">
      <div class="col-md-10 text-center">
      	<div class="input-group input-append date" id="dateRangePicker" > </div>
      
      </div>
      
      
</div>