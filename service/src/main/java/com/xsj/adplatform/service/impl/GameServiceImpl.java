/*
 * Copyright [rapid-framework.com]
 * Web Site: http://www.rapid-framework.com
 * Since 2005 - 2016
 */

package com.xsj.adplatform.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.xsj.adplatform.service.GameService;
import com.github.rapid.common.util.holder.BeanValidatorHolder;
import com.github.rapid.common.util.page.Page;
import com.xsj.adplatform.model.*;
import com.xsj.adplatform.dao.*;
import com.xsj.adplatform.query.*;

import java.util.Date;
import java.util.List;

/**
 * [Game] 的Service接口实现
 * 
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 */
@Service("gameService")
@Transactional
public class GameServiceImpl implements GameService {

	protected static final Logger logger = LoggerFactory.getLogger(GameServiceImpl.class);
	
	/*
	* 请删除无用的方法，本代码生成器的理念是: 1. 一次生成，后期手工修改代码 2. 删除代码比手写重复代码快捷，所以请删除无用代码
	*/
	
	private GameDao gameDao;
	/**增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,请注意大小写*/
	public void setGameDao(GameDao dao) {
		this.gameDao = dao;
	}
	
	/** 
	 * 创建Game
	 **/
	public Game create(Game game) {
	    Assert.notNull(game,"'game' must be not null");
	    gameDao.insert(game);
	    return game;
	}
	
	/** 
	 * 更新Game
	 **/	
    public Game update(Game game) {
        Assert.notNull(game,"'game' must be not null");
        gameDao.update(game);
        return game;
    }	
    
    /**
     *  join取回Game的关联信息,如一对多，多对一等的关联信息
     */
    public Game join(Game game) {
    	return game;
    }
    
	/** 
	 * 删除Game
	 **/
    public void removeById(String gameId) {
        gameDao.deleteById(gameId);
    }
    
	/** 
	 * 根据ID得到Game
	 **/    
    public Game getById(String gameId) {
        return gameDao.getById(gameId);
    }

	@Override
	public Page<Game> findPage(GameQuery query) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Game> findAll() {
		// TODO Auto-generated method stub
		return null;
	}
}
