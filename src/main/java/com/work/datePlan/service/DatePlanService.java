package com.work.datePlan.service;

import java.util.List;
import java.util.Map;

public interface DatePlanService {

	List<Map<String, Object>> selectPlanBoardListService() throws Exception;

	List<Map<String, Object>> selectDateDayListService() throws Exception;

}
