/*
 * Copyright [rapid-framework.com]
 * Web Site: http://www.rapid-framework.com
 * Since 2005 - 2016
 */

package com.xsj.adplatform.service;

import com.github.rapid.common.util.page.Page;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.xsj.adplatform.model.*;
import com.xsj.adplatform.dao.*;
import com.xsj.adplatform.query.*;

import java.util.Date;
import java.util.List;

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
