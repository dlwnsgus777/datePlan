<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
 <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script>
	$(function() {
		
		// default-nav.jsp => menuEvent컨텍스트 참조
		$("#plan").click(menuEvent.nameClickMenu);
	});
</script>
<style>
	#asd {
		width	: 400px;
		height 	: 400px;
	}
</style>
    <div class="row slider-text align-items-center justify-content-center">
	    <div class="col-md-10 zoomOut text-center">
	    	<h1 class="mb-4">I love to 
		    	<strong class="typewrite" data-period="4000" >
		    		<span class="wrap">You...</span>
		    	</strong>
	    	</h1>
		    <!-- <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p> -->
		    <p><a id="plan" href="javascript:;" class="btn btn-primary btn-outline-white px-4 py-3"><span class="ion-ios-play mr-2"></span>데이트할래?</a></p>
		    <img id="asd" src="static/images/upload/faa7088d-a58c-4604-bc48-33aa2579f3b6_20141229_180214.jpg">
	    </div>
    </div>