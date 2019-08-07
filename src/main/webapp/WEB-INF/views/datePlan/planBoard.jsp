<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<script>
	var Board = {
		
		/*
		*	게시글 조회 메서드
		*	====================
		*	pageNum : 게시글 페이지
		*/
		search	: function(pageNum) {
			var dataObj = {
				page 			: pageNum,
				selectKeyword	: field.selectKeyword	// 셀렉트 박스에서 선택된 값
			}
			
			// 페이징 처리 Ajax
			$.ajax({
				url	: "<c:url value= 'searchPage.do' />",
				data : dataObj,
				type : "POST",
				dataType : "html",
				success : function(data) {
					
					$(".pageWrap").empty().append(data);
				}
			})
			
			// 게시글 목록 Ajax
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
		
		// 게시글 페이지와 키워드 초기화 메서드
		resetList : function() {
			
			field.selectKeyword = "";
				
			this.search("1");
		}
				
	}
	
	// 셀렉트 박스에서 선택된 키워드가 저장될 오브젝트
	var field = {
		selectKeyword 	: ""
	}
	
	// 셀렉트 박스 관련 컨텍스트
	var selectEvent = {
		
		// 연도가 표시된 셀렉트 박스를 선택했을 때
		changeSelect : function() {
			var years = $(this).val();
				
			if (years === "연도를 선택해주세요") {
				$("#selectMonth").empty().append("<option>월을 선택해주세요</option>");
				
				// 게시글 목록을 처음 상태로
				Board.resetList();
			} else {
				
				// 해당 연도에 따른 데이터를 조회해 월을 선택하는 셀렉트 박스에 옵션을 추가.
				$.ajax({
					url 		: "<c:url value='selectMonth.do' />",
					type 		: "POST",
					dataType 	: "text",
					data		: {"years" : years},
					success 	: function(data) {
						var months 		= JSON.parse(data);
						var optionHTML 	= "<option>월을 선택해주세요</option>";
							
						console.log(months[0].days);
							
						for (var i = 0; i < months.length; i++) {
							optionHTML += "<option data-years=" + years + ">" + months[i].days + "</option>";							
						}
							
						$("#selectMonth").empty().append(optionHTML);
					}
				});
			}
		},	 // End chageSelect
		
		// 연도를 선택하고 월을 선택했을때
		monthSelect : function() {
			var selectKeyword = $("#selectMonth option:selected").data("years") + $("#selectMonth option:selected").text();
			
			field.selectKeyword = selectKeyword;
			
			Board.search("1");
		}
	}
	
	/*
	*	게시글 상세조회 관련 컨텍스트
	*	=====================
	*	# 게시글은 modal을 이용해 출력합니다.
	*/
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
		
		/*
		*	게시글 상세조회 메서드
		*	==================
		*	# boardNo : 선택한 게시글의 번호
		*/
		makeModal : function(boardNo) {
			var selectNo = boardNo;
			
			$.ajax({
				url 		: "<c:url value='makeBoard.do' />",
				type 		: "POST",
				dataType 	: "html",
				data		: {"selectNo" : selectNo},
				success 	: function(data) {
					console.log(data);
					
					$("#modal-content").empty().append(data);
				}
			});
			
			this.modalView();
		}
	}
	
	$(function() {
		$("#selectYear").change(selectEvent.changeSelect);
		
		$("#selectMonth").change(selectEvent.monthSelect);
		
		Board.search("1");

		$("#modal-content").on(".close").click(modalEvent.modalClose.btnClose)

		$("html").click(modalEvent.modalClose.clickClose)
	      
	})	

</script>

 <div class="row slider-text align-items-center justify-content-center">
      <div class="col-md-10 text-center">
				
      	<div class="selectbox">
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
		   
		  </div>
		<!-- 모달 끝 -->
		
      </div>
      </div>      
</div>
