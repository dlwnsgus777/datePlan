<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<script src="static/ckeditor/ckeditor.js"></script>


<script>
	
</script>
    <div class="row slider-text align-items-center justify-content-center">
	    <div class="col-md-10 zoomOut text-center">
	    <br>
		   	<div class="write">
		       <form>
		            <textarea name="editor1" id="editor1" rows="10" cols="80">
		                This is my textarea to be replaced with CKEditor.
		            </textarea>
		            <button>사진첨부</button>
		            <input type="submit" value="작성완료">
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