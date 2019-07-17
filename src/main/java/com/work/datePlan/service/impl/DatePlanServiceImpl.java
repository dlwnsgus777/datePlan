package com.work.datePlan.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.work.datePlan.service.DatePlanService;

@Service
public class DatePlanServiceImpl implements DatePlanService {
	
	@Resource
	private DatePlanMapper datePlanMapper;
	
	@Override
	public List<Map<String, Object>> selectPlanBoardListService() throws Exception {
		
		return datePlanMapper.selectPlanBoardListService();
	}

}
