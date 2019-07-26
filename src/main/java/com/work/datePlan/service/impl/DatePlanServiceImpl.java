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

	@Override
	public datePlanVO selectPlanBoardCnt(datePlanVO vo) throws Exception {
		
		return datePlanMapper.selectPlanBoardCnt(vo);
	}

	@Override
	public List<Map<String, Object>> selectPlanSelectBoxList() throws Exception {

		return datePlanMapper.selectPlanSelectBoxList();
	}

	@Override
	public List<Map<String, Object>> selectMonthList(String years) throws Exception {

		return datePlanMapper.selectMonthList(years);
	}

	@Override
	public Map<String, Object> selectBoardDetailInfo(String selectNo) throws Exception {
		
		return datePlanMapper.selectBoardDetailInfo(selectNo);
	}

}
