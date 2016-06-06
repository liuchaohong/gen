package com.xsj.gen.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.alibaba.fastjson.JSON;
import com.github.rapid.common.util.CollectionUtil;
import com.github.rapid.common.util.CsvFileUtil;
import com.github.rapid.common.web.scope.Flash;
import com.xsj.gen.model.Game;
import com.xsj.gen.model.Page;
import com.xsj.gen.query.GameQuery;
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
@RequestMapping("/game")
public class GameController {

	/*
	* 请删除无用的方法，本代码生成器的理念是: 1. 一次生成，后期手工修改代码 2. 删除代码比手写重复代码快捷，所以请删除无用代码
	*/
	
	private static Logger logger = LoggerFactory.getLogger(GameController.class);
	
	@Autowired
	private GameService gameService;
	
	private final String LIST_ACTION = "redirect:/game/index.do";
	
	private static String INSERT_SUCCESS = "新增成功";
	private static String UPDATE_SUCCESS = "更新成功";
	private static String DELETE_SUCCESS = "删除成功";
	
	/** 列表 */
	@RequestMapping
	public String index(ModelMap model, GameQuery gameQuery) {
//		List<Game> games = gameService.getList(gameQuery);
//		model.put("games", games);
		return "/game/index";
	}
	
	
	
	/**
	 * 分页查询
	 * @param gameQuery
	 * @return
	 */
	@RequestMapping
	@ResponseBody
	public String getPage(GameQuery gameQuery, HttpServletResponse response){
		response.setContentType("text/html; charset=UTF-8");  
		Page<Game> page = gameService.getPage(gameQuery);
		String jsonStr = JSON.toJSONString(page);
		return jsonStr;
	}
	
	
	/** 显示 */
	@RequestMapping
	public String show(String gameId, ModelMap model) throws Exception {
		Game game = gameService.getById(gameId);
		model.put("game", game);
		return "/game/show";
	}
	
	/** 进入新增 */
	@RequestMapping
	public String add(ModelMap model) throws Exception {
		return "/game/add";
	}
	
	/** 保存新增 **/
	@RequestMapping(method=RequestMethod.POST)
	public String insert(Game game, ModelMap model) throws Exception {
		gameService.insert(game);
		Flash.current().success(INSERT_SUCCESS);
		return LIST_ACTION;
	}
	
	/** 进入编辑 **/
	@RequestMapping
	public String edit(String gameId, ModelMap model) throws Exception {
		Game game = gameService.getById(gameId);
		model.put("game", game);
		return "/game/edit";
	}
	
	/** 保存更新 **/
	@RequestMapping(method=RequestMethod.POST)
	public String update(Game game, ModelMap model) throws Exception {
		gameService.update(game);
		Flash.current().success(UPDATE_SUCCESS);
		return LIST_ACTION;
	}
	
	/** 删除 */
	@RequestMapping
	public String delete(String gameId, ModelMap model) {
		gameService.deleteById(gameId);
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}
	
	/** 上传csv文件保存  */
	@RequestMapping(method=RequestMethod.POST)
	public String upload(@RequestParam("file")  CommonsMultipartFile file) throws Exception {
		Assert.isTrue(file.getOriginalFilename().endsWith(".csv"), "只能上传.csv文件");
		int skipLines = 1;
		List<Map> maps = CsvFileUtil.readCsv2Maps(file.getInputStream(), "UTF-8", "gameId, gameName", skipLines);
		List<Game> items = CollectionUtil.toBeanList(maps, Game.class);
		int successCount = 0;
		int errorCount = 0;
		for(Game item : items) {
			try {
				gameService.insert(item);
				successCount++;
			}catch(Exception e) {
				errorCount++;
				logger.info("upload error",e);
			}
		}
		
		Flash.current().success("上传成功,创建成功条数:"+successCount+",失败条数:"+errorCount);
		return LIST_ACTION;
	}
}

