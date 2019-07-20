package com.work.datePlan.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.work.cmmn.datePlanVO;

@Mapper
public interface DatePlanMapper {

	List<Map<String, Object>> selectPlanBoardListService(datePlanVO vo) throws Exception;

	List<Map<String, Object>> selectDateDayListService(String dateDay) throws Exception;

}
