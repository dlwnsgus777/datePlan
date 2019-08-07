<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
 <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script>
	$(function() {
		
		// default-nav.jsp => menuEvent컨텍스트 참조
		$("#plan").click(menuEvent.nameClickMenu);
	});
</script>

    <div class="row slider-text align-items-center justify-content-center">
	    <div class="col-md-10 zoomOut text-center">
	    	<h1 class="mb-4">작성 완료되었습니다. </h1>
		    <!-- <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p> -->
		    <p><a id="plan" href="javascript:;" class="btn btn-primary btn-outline-white px-4 py-3"><span class="ion-ios-play mr-2"></span>데이트할래?</a></p>
	    </div>
    </div>