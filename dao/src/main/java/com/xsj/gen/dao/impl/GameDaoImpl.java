package com.xsj.gen.dao.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.support.DataAccessUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSourceUtils;
import org.springframework.stereotype.Repository;

import com.github.rapid.common.beanutils.PropertyUtils;
import com.github.rapid.common.jdbc.dao.support.BaseSpringJdbcDao;
import com.github.rapid.common.util.ObjectUtil;
import com.xsj.gen.dao.GameDao;
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
@Repository("gameDao")
public class GameDaoImpl extends BaseSpringJdbcDao implements GameDao {

	protected static final Logger logger = LoggerFactory.getLogger(GameDaoImpl.class);
	
	private RowMapper<Game> entityRowMapper = new BeanPropertyRowMapper<Game>(getEntityClass());
	
	static final private String COLUMNS = "gameId, gameName";
	static final private String SELECT_FROM = "select " + COLUMNS + " from game";
	
	@Override
	public Class<Game> getEntityClass() {
		return Game.class;
	}
	
	@Override
	public String getIdentifierPropertyName() {
		return "gameId";
	}
	
	public RowMapper<Game> getEntityRowMapper() {
		return entityRowMapper;
	}

	@Override
	public int insert(Game game) {
		String sql = "insert into game " 
				 + " (gameId,gameName) " 
				 + " values "
				 + " (:gameId,:gameName)";
		return insertWithGeneratedKey(game,sql); 
		//其它主键生成策略
		//insertWithOracleSequence(entity,"sequenceName",sql); //oracle sequence: 
		//insertWithDB2Sequence(entity,"sequenceName",sql); //db2 sequence:
		//insertWithUUID(entity,sql); //uuid
		//insertWithAssigned(entity,sql); //手工分配
	}

	@Override
	public int update(Game game) {
		List<Game> games = Arrays.asList(game);
		return batchUpdate(games).length;
	}

	@Override
	public int[] batchInsert(List<Game> games) {
		String sql = "insert into game " 
				 + " (gameId,gameName) " 
				 + " values "
				 + " (:gameId,:gameName)";
		SqlParameterSource[] params = SqlParameterSourceUtils.createBatch(games.toArray());
		return getNamedParameterJdbcTemplate().batchUpdate(sql, params);
	}

	@Override
	public int[] batchUpdate(List<Game> games) {
		String sql = "update game set gameName=:gameName where gameId = :gameId";
		SqlParameterSource[] params = SqlParameterSourceUtils.createBatch(games.toArray());
		return getNamedParameterJdbcTemplate().batchUpdate(sql, params);
	}
	
//	public int update(Game game) {
//		String sql = "update game set "
//					+ " gameName=:gameName "
//					+ " where gameId = :gameId ";
//		return getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(game));
//	}

	
//	public int deleteById(String gameId) {
//		String sql = "delete from game where  gameId = ? ";
//		return  getJdbcTemplate().update(sql,  gameId);
//	}
//
//	public Game getById(String gameId) {
//		String sql = SELECT_FROM + " where  gameId = ? ";
//		return (Game)DataAccessUtils.singleResult(getJdbcTemplate().query(sql, getEntityRowMapper(), gameId));
//	}

	@Override
	public int deleteById(String gameId) {
		String sql = "delete from game where gameId = ? ";
		return  getJdbcTemplate().update(sql,  gameId);
	}

	@Override
	public Game getById(String gameId) {
		String sql = SELECT_FROM + " where  gameId = ? ";
		return (Game)DataAccessUtils.singleResult(getJdbcTemplate().query(sql, getEntityRowMapper(), gameId));
	}

	@Override
	public List<Game> getList(GameQuery query) {
		StringBuilder sql = new StringBuilder("select "+ COLUMNS + " from game where 1=1 ");
		if(ObjectUtil.isNotEmpty(query.getGameId())) {
            sql.append(" and gameId = :gameId ");
        }
		if(ObjectUtil.isNotEmpty(query.getGameName())) {
            sql.append(" and gameName = :gameName ");
        }
		if (ObjectUtil.isNotEmpty(query.getOffset()) && ObjectUtil.isNotEmpty(query.getLimit())) {
			sql.append(" limit ").append(" :offset ").append(",").append(" :limit ");
		}
		Map<String ,Object> paramMap = new HashMap<String ,Object> (PropertyUtils.describe(query));
		return getNamedParameterJdbcTemplate().query(sql.toString(), paramMap, getEntityRowMapper());
	}

	
}
