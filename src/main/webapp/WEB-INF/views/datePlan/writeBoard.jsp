<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<script type="text/javascript" src="static/smartEditer/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<style>
.write {
	margin-top : 150px;
	width : 100%;
}

</style>
<script>
	
</script>
    <div class="row slider-text align-items-center justify-content-center">
	    <div class="col-md-10 zoomOut text-center">
	    <br>
		   	<div class="write">
		        <form action="#" method="post">
			        <textarea name="ir1" id="ir1" rows="10" cols="100" ></textarea>      
		        </form>
		        	<input type="button" onclick="pasteHTML();" value="본문에 내용 넣기" />
	<input type="button" onclick="showHTML();" value="본문 내용 가져오기" />
	<input type="button" onclick="submitContents();" value="서버로 내용 전송" />
	<input type="button" onclick="oEditors.setDefaultFont();" value="기본 폰트 지정하기 (궁서_24)" />
	        </div>
	    </div>
	    
	<script type="text/javascript">
	var oEditors = [];
	window.onload = function() {		
		nhn.husky.EZCreator.createInIFrame({
		 oAppRef: oEditors,
		 elPlaceHolder: "ir1",
		 sSkinURI: "static/smartEditer/SmartEditor2Skin.html",
		 fCreator: "createSEditor2"
		});

	};
		
	</script>
   </div>