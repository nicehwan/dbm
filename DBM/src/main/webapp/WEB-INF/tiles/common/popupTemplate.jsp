<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"   prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/security/tags" 	prefix="sec"  %>
<sec:authentication var="user" property="principal" />
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=10" />
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1.0, minimum-scale=1" />
		<meta http-equiv="Expires" content="-1"> 
		<meta http-equiv="Pragma" content="no-cache"> 
		<meta http-equiv="Cache-Control" content="No-Cache"> 	
		<link rel="shortcut icon" href="<c:url value="/resources/images/favicon.ico"/>"/>
		
		<!-- css block -->
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/axisj/ui/arongi/AXJ.min.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/axisj/ui/arongi/font-awesome.min.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/axisj/ui/arongi/AXInput.css"/>">
		
		<!-- Omni-VM css block -->
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/table_listTag.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>" />
	
		<!-- js block -->
		<script type="text/javascript" src="<c:url value="/resources/js/axisj/jquery/jquery.min.js"/>"></script> 
		<script type="text/javascript" src="<c:url value="/resources/js/axisj/dist/AXJ.min.js"/>"></script> 
		<script type="text/javascript" src="<c:url value="/resources/js/validator-min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/framework.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/jquery.mask.js"/>"></script>
	</head>
	<body>
		<div class="bodyHeightDiv">
			<tiles:insertAttribute name="content" />
		</div>
		<script type="text/javascript">
			var pageID = "AXModal";
			var globalPageInLoading = "<s:message code='tiles.axisj.globalPageInLoading' text="Loading page. Please wait a minute."/>";
			$(document).ready(function(){
				Date.prototype.yyyymmddhhmi = function() {
					var yyyy = this.getFullYear().toString();
					var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based
					var dd  = this.getDate().toString();
					var hh = this.getHours().toString();
					var mi = this.getMinutes().toString();
					return yyyy + "-" + (mm[1]?mm:"0"+mm[0]) + "-" + (dd[1]?dd:"0"+dd[0]) + " " + (hh[1]?hh:"0"+hh[0]) + ":" + (mi[1]?mi:"0"+mi[0]); // padding
				};
				
				Date.prototype.yyyymmdd = function() {
					var yyyy = this.getFullYear().toString();
					var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based
					var dd  = this.getDate().toString();
					return yyyy + "-" + (mm[1]?mm:"0"+mm[0]) + "-" + (dd[1]?dd:"0"+dd[0]); // padding
				};	
			});
			
			<%-- 공통 오류 표시기 --%>
			function commonAjaxErrorDialog(data){
				if(data.isError == 'true' ){
					dialog.push({body:'<b><s:message code="framework.common.error.defaultMsg" text="There are error in this page.\n Please ask to administrator."/></b>\nMessage : ' + data.errorMsg, type:'Caution'});
					return true;
				}else{
					return false;
				}
			}
		</script>
	</body>
</html>