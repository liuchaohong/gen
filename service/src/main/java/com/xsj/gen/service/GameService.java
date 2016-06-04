/*
 * Copyright [rapid-framework.com]
 * Web Site: http://www.rapid-framework.com
 * Since 2005 - 2016
 */

package com.xsj.gen.service;

import java.util.List;

import com.github.rapid.common.util.page.Page;
import com.xsj.gen.model.Game;
import com.xsj.gen.query.GameQuery;

/**
 * [Game] 的Service接口
 * 
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 */
public interface GameService {

	/** 
	 * 创建Game
	 **/
	public Game create(Game game);
	
	/** 
	 * 更新Game
	 **/	
    public Game update(Game game);
    
    /**
     *  join取回Game的关联信息,如一对多，多对一等的关联信息
     */
    public Game join(Game game);
    
	/** 
	 * 删除Game
	 **/
    public void removeById(String gameId);
    
	/** 
	 * 根据ID得到Game
	 **/    
    public Game getById(String gameId);
    
	/** 
	 * 分页查询: Game
	 **/      
	public Page<Game> findPage(GameQuery query);
	
	/**
	 *  查询所有游戏
	 * @return
	 */
	public List<Game> findAll();
}
