<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %> 

<script>
	var initMenu = {
			
		/*
		*	페이지 로딩시 실행되는 클릭 관련 기능 실행
		*	=============================
		*	# this : menuEvent
		*
		*/
		pageInit	: function() {
			$(".navbar-nav li").click(this.navClickMenu);
			
			$("#home").click(this.nameClickMenu);
		}
	}
	
	var menuEvent	= {
			
			// 메뉴 이동 메서드
			goMenu 		: function(parameter) {
				$("#homeFrm").attr("action", parameter + ".do");
				
				$("#navMenu").val(parameter);
				
				alert(parameter);
				
				$("#homeFrm").submit();
			},
			
			// 하이라이트 처리 메서드
			menuHighlight	: function() {
				var pageName = "<c:out value= "${param.navMenu}" />";
				
				$(".navbar-nav li").removeClass("active");
				
				$("#" + pageName).parent().addClass("active");
			},
			
			// 우측 상단에 있는 글자를 클릭했을 때
			navClickMenu	: function() {
				var parameter = $(this).children().attr("id");
				
				if (parameter === "navHome") {
					parameter = "home";
				}
				
				menuEvent.goMenu(parameter);
			},
			
			// 좌측 상단에 있는 글자, plan.jsp 화면의  "데이트할래" 버튼 클릭시
			nameClickMenu	: function() {
				var parameter = $(this).attr("id");
				
				menuEvent.goMenu(parameter);
			}	
	}
	
	$(function() {
		initMenu.pageInit.call(menuEvent);
		
		menuEvent.menuHighlight();		
	}); 
</script>
<form id="homeFrm" method="get" action="">
	<input type="hidden" id="navMenu" name="navMenu">
</form>
 <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
      <div class="container">
        <a class="navbar-brand" href="javascript:;" id="home">데이트할래?</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active"><a id="navHome" href="javascript:;" class="nav-link">Home</a></li>
            <li class="nav-item"><a id="planBoard" href="#" class="nav-link">전체글</a></li>     
          </ul>
        </div>
      </div>
    </nav>