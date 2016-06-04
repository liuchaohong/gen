package com.xsj.gen.dao;

import java.util.List;

import com.xsj.gen.model.Game;
import com.xsj.gen.query.GameQuery;

/**
 * tableName: game
 * [Game] 的Dao操作
 * 
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
*/
public interface GameDao {
	
	public int insert(Game game);

	public int update(Game game);
	
	public int[] batchInsert(List<Game> games);
	
	public int[] batchUpdate(List<Game> games);
	
	public int deleteById(String gameId);
	
	public Game getById(String gameId);

	public List<Game> getList(GameQuery query);	
	
}
