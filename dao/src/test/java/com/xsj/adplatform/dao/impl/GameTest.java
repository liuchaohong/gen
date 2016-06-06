package com.xsj.adplatform.dao.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.xsj.gen.dao.GameDao;
import com.xsj.gen.model.Game;

@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:spring/*.xml"})
public class GameTest extends AbstractJUnit4SpringContextTests {

	@Autowired
	private GameDao gameDao;
	
	@Test
	public void insert(){
		for (int i = 1; i < 100; i++) {
			Game game = new Game();
			game.setGameId(String.valueOf(i));
			game.setGameName("游戏"+i);
			gameDao.insert(game);
		}
	}
	
}
