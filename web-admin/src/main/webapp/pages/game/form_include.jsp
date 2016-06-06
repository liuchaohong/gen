<%@page import="com.xsj.adplatform.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<div class="form-group">
		<label for="gameName" class="col-sm-4 control-label">游戏ID:</label>
		<div class="col-sm-4">
			<input name="gameId" id="gameId" value="${game.gameId}" placeholder="游戏ID"  maxlength="20"  class="form-control"  required />
		</div>
	 </div>
	 
	<div class="form-group">
		<label for="gameName" class="col-sm-4 control-label">游戏名:</label>
		<div class="col-sm-4">
			<input name="gameName" id="gameName" value="${game.gameName}" placeholder="游戏名"  maxlength="20"  class="form-control"  required />
		</div>
	 </div>
	 
		