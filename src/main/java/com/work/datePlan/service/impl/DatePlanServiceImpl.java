package com.work.datePlan.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.work.cmmn.datePlanVO;
import com.work.datePlan.service.DatePlanService;

@Service
public class DatePlanServiceImpl implements DatePlanService {
	
	@Resource
	private DatePlanMapper datePlanMapper;
	
	@Override
	public List<Map<String, Object>> selectPlanBoardListService(datePlanVO vo) throws Exception {
		
		return datePlanMapper.selectPlanBoardListService(vo);
	}

	@Override
	public List<Map<String, Object>> selectDateDayListService(String dateDay) throws Exception {

		return datePlanMapper.selectDateDayListService(dateDay);
	}

}
