<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>	
  	
<!DOCTYPE html>
<html lang="kor">
  <head>
  	<tiles:insertAttribute name="head"/>
  	<script src="static/js/jquery.min.js"></script>
  </head>
  <body>
    <tiles:insertAttribute name="navbar"/>
    <section class="home-slider owl-carousel ftco-degree-bg">
      <div class="slider-item">
        <div class="overlay"></div>
        <div class="container">
           <tiles:insertAttribute name="content"/>
        </div>
      </div>
    </section>
	<tiles:insertAttribute name="photo"/>
	<tiles:insertAttribute name="cmmn"/>
  </body>
</html>