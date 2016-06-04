package com.xsj.adplatform.model;

import java.io.Serializable;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;



/**
 * tableName: game [Game] 
 * 
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 */
public class Game  implements Serializable{
	
	private static final long serialVersionUID = -5028250099821281373L;
	
	/** 游戏ID */
	private String gameId;
	/** 游戏名 */
	private String gameName;
	
	public String getGameId() {
		return gameId;
	}

	public void setGameId(String gameId) {
		this.gameId = gameId;
	}

	public String getGameName() {
		return gameName;
	}

	public void setGameName(String gameName) {
		this.gameName = gameName;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getGameId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(this == obj) return true;
		if(obj instanceof Game == false) return false;
		Game other = (Game)obj;
		return new EqualsBuilder()
			.append(getGameId(),other.getGameId())
			.isEquals();
	}
}

