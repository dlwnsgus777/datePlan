<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<script src="https://cdn.ckeditor.com/ckeditor5/12.3.1/classic/ckeditor.js"></script>
<style>
#editor {
	color : black;
}

</style>
<script>
	
</script>
    <div class="row slider-text align-items-center justify-content-center">
	    <div class="col-md-10 zoomOut text-center">
	    <br>
		   	<div class="write">
		        <form action="#" method="post">
			       <textarea name="content" id="editor"></textarea>
		        </form>
	        </div>
	    </div>
	    
<script>
    ClassicEditor
        .create( document.querySelector( '#editor' ))
        .catch( error => {
            console.error( error );
        } );
</script>
   </div>