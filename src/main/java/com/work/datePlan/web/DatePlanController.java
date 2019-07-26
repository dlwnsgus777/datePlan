package com.work.datePlan.web;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.work.cmmn.datePlanVO;
import com.work.datePlan.service.DatePlanService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class DatePlanController {
	
	@Resource
	private DatePlanService datePlanService;
	
	private static final Logger logger = LoggerFactory.getLogger(DatePlanController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/", "/home.do"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		
		return "datePlan/home.tiles";
	}
	
	@GetMapping(value = "/plan.do")
	public String plan(ModelMap model) throws Exception {
		
		return "datePlan/plan.tiles";
	}
	
	@GetMapping(value = "planBoard.do")
	public String planBoard(ModelMap model, @ModelAttribute datePlanVO vo) throws Exception {
		
		List<Map<String, Object>> planBoardList = datePlanService.selectPlanBoardListService(vo);
		List<Map<String, Object>> selectBoxName = datePlanService.selectPlanSelectBoxList();
		datePlanVO 				  datePlanVO    = datePlanService.selectPlanBoardCnt(vo);
		
		vo.setDatePlanInfo(datePlanVO);
		
		System.out.println(planBoardList);
		
		System.out.println(vo.toString());
		
		System.out.println(selectBoxName);
		
		model.addAttribute("planBoard"	, planBoardList);
		model.addAttribute("planPage"	, vo);
		model.addAttribute("planYears"	, selectBoxName);
		
		return "datePlan/planBoard.tiles";
	}
	
	@PostMapping(value = "getDateList.do")
	public void getDateList(@RequestParam String dateDay, HttpServletResponse response) throws Exception {
		
		System.out.println(dateDay);
				
		List<Map<String, Object>> dateDayList = datePlanService.selectDateDayListService(dateDay);
		
		if (dateDayList.size() > 0) {
			
			String[] dayArr = new String[dateDayList.size()];
			
			for (int i = 0; i < dateDayList.size(); i++) {
				
				dayArr[i] = dateDayList.get(i).get("DAYS_DATE").toString();
			}
			
			System.out.println(Arrays.toString(dayArr));
			
			System.out.println(dateDayList.get(0));
			
			for (int i = 0; i < dayArr.length; i++) {
				int j 	= dayArr[i].indexOf("월");
				
				dayArr[i] = (dayArr[i].substring(j + 1)).replaceAll("[일]", "");
				
			}
			
			System.out.println(Arrays.toString(dayArr).replaceAll("\\[", "").replaceAll("\\]", ""));
			
			response.setCharacterEncoding("utf-8");
			
			PrintWriter out = response.getWriter();
			
			out.write(Arrays.toString(dayArr).replaceAll("\\[", "").replaceAll("\\]", ""));
		}
	}
	
	@PostMapping(value = "selectMonth.do")
	public void selectMonth(@RequestParam String years, HttpServletResponse response) throws Exception {
		
		List<Map<String, Object>> selectMonth = datePlanService.selectMonthList(years);
		
		Gson gson 	= new Gson();
		
		System.out.println(selectMonth);
		
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		out.write(gson.toJson(selectMonth));
		
	}
	
	@PostMapping(value = "searchPage.do")
	public String searchPage(@ModelAttribute datePlanVO vo, ModelMap model) throws Exception {
		datePlanVO 	datePlanVO    = datePlanService.selectPlanBoardCnt(vo);
		
		vo.setDatePlanInfo(datePlanVO);
		
		model.addAttribute("planPage", vo);
		
		return "datePlan/board/page";
	}
	
	@PostMapping(value = "searchList.do")
	public String searchList(@ModelAttribute datePlanVO vo, ModelMap model) throws Exception {
		
		List<Map<String, Object>> planBoardList = datePlanService.selectPlanBoardListService(vo);
		
		System.out.println(vo.toString());
		
		model.addAttribute("planBoard"	, planBoardList);
		
		return "datePlan/board/list";
	}
	
	@PostMapping(value="makeBoard.do")
	public String makeBoard(ModelMap model, @RequestParam String selectNo) throws Exception {
		System.out.println(selectNo);
		
		Map<String, Object> selectBoard = datePlanService.selectBoardDetailInfo(selectNo);
		
		System.out.println(selectBoard);
		
		model.addAttribute("boardDetail", selectBoard); 
		
		return "datePlan/board/detail";
	}
	
}
