<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<style>
	.pagination {
  display: inline-block;
  padding-left: 0;
  margin: 20px 0;
  border-radius: 4px;
}
.pagination > li {
  display: inline;
}
.pagination > li > a,
.pagination > li > span {
  width : 45px;
  height : 45px;
  position: relative;
  float: left;
  padding: 6px 12px;
  margin-left: -1px;
  line-height: 1.42857143;
  color: #337ab7;
  text-decoration: none;
  background-color: #fff;
  border: 1px solid #ddd;
}
.pagination > li:first-child > a,
.pagination > li:first-child > span {
  margin-left: 0;
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}
.pagination > li:last-child > a,
.pagination > li:last-child > span {
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
}
.pagination > li > a:hover,
.pagination > li > span:hover,
.pagination > li > a:focus,
.pagination > li > span:focus {
  color: #23527c;
  background-color: #eee;
  border-color: #ddd;
}
.pagination > .active > a,
.pagination > .active > span,
.pagination > .active > a:hover,
.pagination > .active > span:hover,
.pagination > .active > a:focus,
.pagination > .active > span:focus {
  z-index: 2;
  color: #fff;
  cursor: default;
  background-color: #337ab7;
  border-color: #337ab7;
}
.pagination > .disabled > span,
.pagination > .disabled > span:hover,
.pagination > .disabled > span:focus,
.pagination > .disabled > a,
.pagination > .disabled > a:hover,
.pagination > .disabled > a:focus {
  color: #777;
  cursor: not-allowed;
  background-color: #fff;
  border-color: #ddd;
}   

.btn {
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: normal;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
      touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
}    

.btn-default {
  color: #333;
  background-color: #fff;
  border-color: #ccc;
}

.pull-right {
  float: right !important;
}
span {
color : black;
}

table th, 
table td{
 color : black;
}
select { 
width: 200px; /* 원하는 너비설정 */ 
padding: .8em .5em; /* 여백으로 높이 설정 */ 
font-family: inherit; /* 폰트 상속 */
 background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
 border: 1px solid #999; 
 border-radius: 0px; /* iOS 둥근모서리 제거 */ 
 -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
 -moz-appearance: none; 
 appearance: none;
 background-color : white; 
 }

</style>
 <div class="row slider-text align-items-center justify-content-center">
      <div class="col-md-10 text-center">
      	<div class="selectbox">
      		<select>
			    <option>asd</option>
			    <option>asd</option>
			</select>
			<select>
			    <option>asd</option>
			    <option>asd</option>
    		</select>
      	</div>
      	
      	<br>
      	
      	<div class="boardWrap">
		    <table class="table table-bordered table-hover">
		      <thead>
		        <tr>
		          <th>번호</th>
		          <th>날짜</th>
		          <th>작성자</th>
		        </tr>
		      </thead>
		      <tbody>
		      	<c:forEach items="${planBoard }" var="planBoard">
		      		 <tr>
			          <td><c:out value="${planBoard.BOARD_NO}"></c:out></td>
			          <td><c:out value="${planBoard.REG_DT}"></c:out></td>
			          <td><c:out value="${planBoard.REG_ID}"></c:out></td>
		        	</tr>
		      	</c:forEach>
		      </tbody>
		    </table>
		</div>
<!-- 		  <a class="btn btn-default pull-right"><span>글쓰기</span></a> -->
		  <div class="pageWrap text-center">
		    <ul class="pagination"> 
		      <li><a href="#"><img src="static/images/common/btn_prev.png" alt="이전"></a></li>
		      <li><a href="#">2</a></li>
		      <li><a href="#">3</a></li>
		      <li><a href="#">4</a></li>
		      <li><a href="#"><img src="static/images/common/btn_next.png" alt="다음"></a></li>
		    </ul>
		  </div>
      </div>      
</div>
