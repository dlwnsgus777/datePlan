package com.work.datePlan.service;

import java.util.List;
import java.util.Map;

import com.work.cmmn.datePlanVO;

public interface DatePlanService {

	List<Map<String, Object>> selectPlanBoardListService(datePlanVO vo) throws Exception;

	List<Map<String, Object>> selectDateDayListService(String dateDay) throws Exception;

	datePlanVO selectPlanBoardCnt(datePlanVO vo) throws Exception;

	List<Map<String, Object>> selectPlanSelectBoxList() throws Exception;

	List<Map<String, Object>> selectMonthList(String years) throws Exception;

}
