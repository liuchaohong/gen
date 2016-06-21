<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title>Game 列表</title>
	
	
	<script >
		$(document).ready(function() {
		});
		
	    function editFormatter(value, row) {
	        var doView = '<a class="btn btn-primary btn-xs" href="${ctx}/game/show.do?gameId=' + row.gameId + '"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> 查看</a>&nbsp;&nbsp;';
			var doEdit = '<a class="btn btn-primary btn-xs" href="${ctx}/game/edit.do?gameId=' + row.gameId + '"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 修改</a>&nbsp;&nbsp;';
			var doDelete = '<a class="btn btn-danger btn-xs" href="${ctx}/game/delete.do?gameId=' + row.gameId + '" onclick="Javascript:return confirm(\'确定要删除吗？\');"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除</a>';
			var html = doView + doEdit + doDelete;
	        return html;
	    }
	    
	    function query(){
	    	var gameName = $("#gameName").val();
	    	var $table = $("#gameTable");
	    	$table.bootstrapTable('refresh', {url: "/game/page.do?gameName="+gameName});
	    }
	    
	</script>
</rapid:override>


<rapid:override name="content">

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
					<a href="#" class="btn btn-primary btn-sm"  onclick="query();"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> 搜索</a>
					<a class="btn btn-primary btn-sm" href="${ctx}/game/add.do"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新增</a>
					<a class="btn btn-primary btn-sm" href="/pages/game/upload.jsp"><span class="glyphicon glyphicon-import" aria-hidden="true"></span> 批量导入</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="panel panel-default table-responsive">

		<table id="gameTable" data-toggle="table" data-sort-name="id" data-sort-order="desc" data-classes="table table-no-bordered" data-show-export="true" 
              	   data-pagination="true"
		       data-side-pagination="server"
		       data-url="/game/page.do"
                  data-page-list="[10, 20, 50, 100, 200]">
		  <thead>
			  <tr>
				<th data-field="gameId" data-sortable="true">游戏ID</th>
				<th data-field="gameName" data-sortable="true">游戏名</th>
				<th data-formatter="editFormatter">操作</th>	
			  </tr>
		  </thead>
		  <!-- 
		  <tbody>
		  	<c:forEach items="${games}" var="item" varStatus="status">
				<tr>
					<td>${item.gameId}</td>
					<td>${item.gameName}</td>
					<td>
						<a class="btn btn-primary btn-xs" href="${ctx}/game/show.do?gameId=${row.gameId}"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> 查看</a>&nbsp;&nbsp;
						<a class="btn btn-primary btn-xs" href="${ctx}/game/edit.do?gameId=${row.gameId}"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 修改</a>&nbsp;&nbsp;					
					</td>
				</tr>
		  	</c:forEach>
		  </tbody>	
		   -->	  
		</table>
				
	</div>
	
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>

