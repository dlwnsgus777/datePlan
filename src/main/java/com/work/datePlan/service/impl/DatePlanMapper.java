package com.work.datePlan.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DatePlanMapper {

	List<Map<String, Object>> selectPlanBoardListService() throws Exception;

	List<Map<String, Object>> selectDateDayListService() throws Exception;

}
