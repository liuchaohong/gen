package com.xsj.gen.service;

import java.util.List;

import com.xsj.gen.model.Game;
import com.xsj.gen.model.Page;
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
	public int insert(Game game);

	/** 
	 * 更新Game
	 **/
	public int update(Game game);

	/** 
	 * 批量创建Game
	 **/
	public int[] batchInsert(List<Game> games);

	/** 
	 * 批量更新Game
	 **/
	public int[] batchUpdate(List<Game> games);

	/** 
	 * 删除Game
	 **/
	public int deleteById(String gameId);

	/** 
	 * 根据ID得到Game
	 **/  
	public Game getById(String gameId);

	/** 
	 * 查询列表
	 **/
	public List<Game> getList(GameQuery query);	
	
	/**
	 * 查询数量
	 * @param query
	 * @return
	 */
	public int getCount(GameQuery query);
	
	/**
	 * 分页查询
	 * @param query
	 * @return
	 */
	public Page<Game> getPage(GameQuery query);
}
