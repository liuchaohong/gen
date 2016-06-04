<%@page import="com.xsj.adplatform.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title>Game 信息</title>
</rapid:override>

<rapid:override name="content">
	<h2 id="title" class="text-center">查看 Game</h2>
	
	<form:form modelAttribute="game" cssClass="form-horizontal"  >
		
			<div class="form-group">
				<label class="col-sm-4 control-label">游戏ID:</label>	
				<div class="col-sm-4">
					<div class="form-control">
						<c:out value='${game.gameId}'/>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">游戏名:</label>	
				<div class="col-sm-4">
					<div class="form-control">
						<c:out value='${game.gameName}'/>
					</div>
				</div>
			</div>
		
			<div class="form-group">
				<div class="text-center">
					<a class="btn btn-default" href="${ctx}/game/index.do">返回列表</a>&nbsp;&nbsp;&nbsp;
					<input type="button" class="btn btn-default" value="后退" onclick="history.back();"/>
				</div>
			</div>

	</form:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>