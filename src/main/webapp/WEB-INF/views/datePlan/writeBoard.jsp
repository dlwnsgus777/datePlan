<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<script src="static/ckeditor/ckeditor.js"></script>


<script>
	function getCookie() {
		var cookie = document.cookie;
		cookie = cookie.replace("date=", "");
		console.log(cookie);
		return cookie;
	}
	$(function() {
		$("#dateStr").val(getCookie());
	})
</script>
    <div class="row slider-text align-items-center justify-content-center">
	    <div class="col-md-10 zoomOut text-center">
	    <br>
		   	<div class="write">
		       <form action="write.do" enctype="multipart/form-data" method="post" id="writeBoard">
		            <textarea name="editor1" id="editor1" rows="10" cols="80">
		                This is my textarea to be replaced with CKEditor.
		            </textarea>
		            <input type="file" name="file" multiple="multiple">
		            <input type="hidden" name="dateStr" id="dateStr">
		            <input type="submit" id="submitBtn" value="작성완료">
	            <script>
	                // Replace the <textarea id="editor1"> with a CKEditor
	                // instance, using default configuration.
	                CKEDITOR.replace( 'editor1' );
	            </script>
	        	</form>
	        	<button onclick="javascript:menuEvent.goMenu('plan')">글쓰기 취소</button>
	        </div>
	    </div>
   </div>