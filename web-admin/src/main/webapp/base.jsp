<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<html>
<head>
	<!-- jquery -->
	<script src="${ctx}/js/jquery.min.js"></script>
	<script src="${ctx}/js/jquery.cookie.js"></script>
	<script src="${ctx}/js/date.js"></script>
	
	<!-- bootstrap -->
	<link href="${ctx}/lib/bootstrap/bootstrap.min.css" rel="stylesheet"  media="screen"/>
	<script src="${ctx}/lib/bootstrap/bootstrap.min.js"></script>
	
	<!-- bootstrap-table -->
	<link href="${ctx}/lib/bootstrap-table/bootstrap-table.css" rel="stylesheet">
	<script src="${ctx}/lib/bootstrap-table/bootstrap-table.js"></script>
	<script src="${ctx}/lib/bootstrap-table/bootstrap-table-export.js"></script>
	<script src="${ctx}/lib/bootstrap-table/tableExport.js"></script>
	<script src="${ctx}/lib/bootstrap-table/bootstrap-table-zh-CN.js"></script>

	<script src="${ctx}/js/highcharts/highcharts.js"></script>
	<script src="${ctx}/js/highcharts/modules/exporting.js"></script> 
	<script src="${ctx}/js/highcharts/highchartsUtil.js"></script>
   
	<!-- multiple-select -->
	<script src="${ctx}/lib/multiple-select/jquery.multiple.select.js"></script>
	<link href="${ctx}/lib/multiple-select/multiple-select.css" rel="stylesheet"  media="screen"/>
	
	<script src="${ctx}/lib/My97DatePicker/WdatePicker.js"></script>
	
	<rapid:block name="head">
	</rapid:block>
	
	<style type="text/css">
	</style>
	
	<script type="text/javascript">
	
		
	</script>
</head>

<body>
    
    <div class="main">
		<%@ include file="/commons/messages.jsp"  %>
		<rapid:block name="content"/>
    </div>
	
</body>

</html>