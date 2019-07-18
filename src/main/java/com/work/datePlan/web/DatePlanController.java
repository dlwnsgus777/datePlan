package com.work.datePlan.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		/*
		 * logger.info("Welcome home! The client locale is {}.", locale);
		 * 
		 * Date date = new Date(); DateFormat dateFormat =
		 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		 * 
		 * String formattedDate = dateFormat.format(date);
		 * 
		 * model.addAttribute("serverTime", formattedDate );
		 */
		
		return "datePlan/home.tiles";
	}
	
	@GetMapping(value = "/plan.do")
	public String plan(ModelMap model) throws Exception {
		
		List<Map<String, Object>> dateDayList = datePlanService.selectDateDayListService();
		
		model.addAttribute("dateDay", dateDayList);
		
		System.out.println(dateDayList);
		
		return "datePlan/plan.tiles";
	}
	
	@GetMapping(value = "planBoard.do")
	public String planBoard(ModelMap model) throws Exception {
		
		List<Map<String, Object>> planBoardList = datePlanService.selectPlanBoardListService();
		
		System.out.println(planBoardList);
		
		model.addAttribute("planBoard", planBoardList);
		
		return "datePlan/planBoard.tiles";
	}
	
}
