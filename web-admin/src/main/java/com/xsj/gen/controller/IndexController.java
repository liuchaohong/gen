package com.xsj.gen.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xsj.gen.service.GameService;

/**
 * [Game] 的Controller
 * 
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 *
 */
@Controller
@RequestMapping("/")
public class IndexController {

	
	private static Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	private GameService gameService;
	
	private final String LIST_ACTION = "redirect:/game/index.do";
	
	private static String CREATED_SUCCESS = "创建成功";
	private static String UPDATE_SUCCESS = "更新成功";
	private static String DELETE_SUCCESS = "删除成功";
	

}

