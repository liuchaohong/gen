<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title>Game 列表</title>
	
	
	<script type="text/javascript" >
		$(document).ready(function() {
		});
	</script>
</rapid:override>


<rapid:override name="content">

	<form id="queryForm" name="queryForm" method="get" action="${ctx}/game/index.do">
	
	<div class="panel panel-default">
	
		<div class="panel-heading">Game 列表</div>
		<div class="panel-body">
			
			<div class="row">
				<div class="col-sm-3">
					<div class="form-group">
						<label for="gameName" class="control-label">游戏名</label>
						<input name="gameName" id="gameName" value="${query.gameName}" placeholder=""  class="form-control input-from-control"   maxlength="20"  class=""/>
					</div>
				</div>
			</div>

				
			<div style="margin-top:20px"  class="row text-left">
				<div class="col-sm-5">
					<a href="#" class="btn btn-primary btn-sm"  onclick="$(this).closest('form').action='${ctx}/game/index.do'; $(this).closest('form').submit();return false;"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> 搜索</a>
					<a class="btn btn-primary btn-sm" href="${ctx}/game/add.do"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新增</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="panel panel-default table-responsive">
		
		<table class="table table-hover scrolltable sortable">
		  <thead>
			  <tr>
				<th style="width:1px;"> </th>
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="gameId" >游戏ID</th>
				<th sortColumn="gameName" >游戏名</th>
				<th>操作</th>
			  </tr>
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.itemList}" var="row" varStatus="status">
		  	  
			  <tr>
				<td>${page.paginator.startRow + status.index}</td>
				
				<td><c:out value='${row.gameId}'/>&nbsp;</td>
				<td><c:out value='${row.gameName}'/>&nbsp;</td>
				
				<td>
					<a class="btn btn-primary btn-xs" href="${ctx}/game/show.do?gameId=${row.gameId}"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> 查看</a>&nbsp;&nbsp;
					<a class="btn btn-primary btn-xs" href="${ctx}/game/edit.do?gameId=${row.gameId}"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 修改</a>&nbsp;&nbsp;
					
				</td>
			  </tr>
			  
		  	  </c:forEach>
		  </tbody>
		</table>
		
	</div>
	
	</form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>

