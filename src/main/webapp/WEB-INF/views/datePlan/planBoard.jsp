<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<script>
	var Board = {
		
		search	: function(pageNum) {
			var dataObj = {
				page 			: pageNum,
				selectKeyword	: field.selectKeyword
			}
			
			$.ajax({
				url	: "<c:url value= 'searchPage.do' />",
				data : dataObj,
				type : "POST",
				dataType : "html",
				success : function(data) {
					
					$(".pageWrap").empty().append(data);
				}
			})
			
			$.ajax({
				url	: "<c:url value= 'searchList.do' />",
				data : dataObj,
				type : "POST",
				dataType : "html",
				success : function(data) {
					
					$(".boardWrap").empty().append(data);
				}
			})	
		},
		
		resetList : function() {
			
			field.selectKeyword = "";
				
			this.search("1");
		}
				
	}
	
	var field = {
		selectKeyword 	: ""
	}
	
	var selectEvent = {
			
		changeSelect : function() {
			var years = $(this).val();
				
			if (years === "연도를 선택해주세요") {
				$("#selectMonth").empty().append("<option>월을 선택해주세요</option>");
					
				Board.resetList();
			} else {
				$.ajax({
					url 		: "<c:url value='selectMonth.do' />",
					type 		: "POST",
					dataType 	: "text",
					data		: {"years" : years},
					success 	: function(data) {
						var months 		= JSON.parse(data);
						var optionHTML 	= "<option>월을 선택해주세요</option>";
							
						console.log(months[0].days)
							
						for (var i = 0; i < months.length; i++) {
							optionHTML += "<option data-years=" + years + ">" + months[i].days + "</option>";							
						}
							
						$("#selectMonth").empty().append(optionHTML);
					}
				});
			}
		},	 // chageSelect
		
		monthSelect : function() {
			var selectKeyword = $("#selectMonth option:selected").data("years") + $("#selectMonth option:selected").text();
			
			field.selectKeyword = selectKeyword;
			
			Board.search("1");
		}
	}
	
	var modalEvent = {
		
		modalView : function() {
			$("#myModal").css({
				"display": "block"
			}); 
		},
		
		modalClose : {
			btnClose : function() {
				$("#myModal").css({
					"display": "none"
				});
			},
			clickClose : function() {
				
				if (event.target.id === "myModal") {
					$("#myModal").css({
						"display": "none"
					});
				}
			}
		},
		
		makeModal : function(boardNo) {
			var selectNo = boardNo;
			
			alert(selectNo);
			
			$.ajax({
				url 		: "<c:url value='makeBoard.do' />",
				type 		: "POST",
				dataType 	: "text",
				data		: {"selectNo" : selectNo},
				success 	: function(data) {
					
				}
			})
		}
	}
	
	$(function() {
		$("#selectYear").change(selectEvent.changeSelect);
		
		$("#selectMonth").change(selectEvent.monthSelect);
		
		Board.search("1");
			
		$("#myBtn").click(modalEvent.modalView)

		$(".close").click(modalEvent.modalClose.btnClose)

		$("html").click(modalEvent.modalClose.clickClose)
	      
	})	

</script>

 <div class="row slider-text align-items-center justify-content-center">
      <div class="col-md-10 text-center">
				
      	<div class="selectbox">
      	<a id="myBtn">Open Modal</a>
      		<select id="selectYear">
      			<option>연도를 선택해주세요</option>
      			<c:if test="${not empty planYears}">
	      			<c:forEach items="${planYears}" var="planYears">
	      				<option>${planYears.years}</option>
	      			</c:forEach>
	      		</c:if>
	      		<c:if test="${empty planYears}">
	      			<option>없음</option>
	      		</c:if>
			</select>
			<select id="selectMonth">
				<option>월을 선택해주세요</option>
    		</select>
      	</div>
      	
      	<br>
      	
      	<!-- 게시글 리스트 -->
      	
      	<div class="boardWrap">
		    
		</div>
		
		<!-- 게시글 페이지 -->
		<div class="pageWrap text-center">

		</div>

		<!-- 게시글 상세조회 모달 -->
		
		<!-- The Modal -->
		<div id="myModal" class="modal">
		
		  <!-- Modal content -->
		  <div id="modal-content" class="modal-content">
		    <span class="close">×</span>
			<span class="reg-id">작성자</span>
			<span class="reg-dt">날짜</span>

				<div class="main-content">
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Amet, sed quidem laboriosam unde ducimus aut distinctio in quos, ad exercitationem ea! Cum explicabo error, ad nihil porro voluptatem quae quo?</p>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Amet, sed quidem laboriosam unde ducimus aut distinctio in quos, ad exercitationem ea! Cum explicabo error, ad nihil porro voluptatem quae quo?</p>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Amet, sed quidem laboriosam unde ducimus aut distinctio in quos, ad exercitationem ea! Cum explicabo error, ad nihil porro voluptatem quae quo?</p>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Amet, sed quidem laboriosam unde ducimus aut distinctio in quos, ad exercitationem ea! Cum explicabo error, ad nihil porro voluptatem quae quo?</p>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Amet, sed quidem laboriosam unde ducimus aut distinctio in quos, ad exercitationem ea! Cum explicabo error, ad nihil porro voluptatem quae quo?</p>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Amet, sed quidem laboriosam unde ducimus aut distinctio in quos, ad exercitationem ea! Cum explicabo error, ad nihil porro voluptatem quae quo?</p>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Amet, sed quidem laboriosam unde ducimus aut distinctio in quos, ad exercitationem ea! Cum explicabo error, ad nihil porro voluptatem quae quo?</p>
				</div>
		  </div>
		<!-- 모달 끝 -->
		
      </div>
      </div>      
</div>
