package com.xsj.adplatform.query;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;


/**
 * [Game] 查询对象
 * 
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 */
public class GameQuery extends PageQuery implements Serializable {
	
    private static final long serialVersionUID = 3148176768559230877L;

	/** 游戏ID */
	private String gameId;
	/** 游戏名 */
	private String gameName;

	public String getGameId() {
		return this.gameId;
	}
	
	public GameQuery setGameId(String gameId) {
		this.gameId = gameId;
		return this;
	}
	
	public String gameId() {
		return this.gameId;
	}

	public GameQuery gameId(String gameId) {
		this.gameId = gameId;
		return this;
	}
	
	public String getGameName() {
		return this.gameName;
	}
	
	public GameQuery setGameName(String gameName) {
		this.gameName = gameName;
		return this;
	}
	
	public String gameName() {
		return this.gameName;
	}

	public GameQuery gameName(String gameName) {
		this.gameName = gameName;
		return this;
	}
	
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
}

