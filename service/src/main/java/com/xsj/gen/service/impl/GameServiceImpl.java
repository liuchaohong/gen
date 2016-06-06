package com.xsj.gen.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.xsj.gen.dao.GameDao;
import com.xsj.gen.model.Game;
import com.xsj.gen.model.Page;
import com.xsj.gen.query.GameQuery;
import com.xsj.gen.service.GameService;

/**
 * [Game] 的Service接口实现
 * 
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 */
@Transactional
@Service("gameService")
public class GameServiceImpl implements GameService {

	protected static final Logger logger = LoggerFactory.getLogger(GameServiceImpl.class);
	
	@Autowired
	private GameDao gameDao;

	@Override
	public int insert(Game game) {
		Assert.notNull(game, "'game' must be not null");
		return gameDao.insert(game);
	}

	@Override
	public int update(Game game) {
		Assert.notNull(game, "'game' must be not null");
		return gameDao.update(game);
	}

	@Override
	public int[] batchInsert(List<Game> games) {
		Assert.notNull(games, "'games' must be not null");
		return gameDao.batchInsert(games);
	}

	@Override
	public int[] batchUpdate(List<Game> games) {
		Assert.notNull(games, "'games' must be not null");
		return gameDao.batchUpdate(games);
	}

	@Override
	public int deleteById(String gameId) {
		Assert.notNull(gameId, "'gameId' must be not null");
		return gameDao.deleteById(gameId);
	}

	@Override
	public Game getById(String gameId) {
		Assert.notNull(gameId, "'gameId' must be not null");
		return gameDao.getById(gameId);
	}

	@Override
	public List<Game> getList(GameQuery gameQuery) {
		Assert.notNull(gameQuery, "'gameQuery' must be not null");
		return gameDao.getList(gameQuery);
	}

	@Override
	public int getCount(GameQuery gameQuery) {
		Assert.notNull(gameQuery, "'gameQuery' must be not null");
		return gameDao.getCount(gameQuery);
	}
	
	@Override
	public Page<Game> getPage(GameQuery gameQuery) {
		Assert.notNull(gameQuery, "'gameQuery' must be not null");
		Page<Game> page = new Page<>();
		page.setRows(getList(gameQuery));
		page.setTotal(getCount(gameQuery));
		return page;
	}
}
