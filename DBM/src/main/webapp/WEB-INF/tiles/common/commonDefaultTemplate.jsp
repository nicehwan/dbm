<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"   prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/security/tags" 	prefix="sec"  %>
<sec:authentication var="user" property="principal" />
<!DOCTYPE html>
<html>
	<head>
		<title>Omni-VM</title>	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1.0, minimum-scale=1" />
		<meta http-equiv="Expires" content="-1"> 
		<meta http-equiv="Pragma" content="no-cache"> 
		<meta http-equiv="Cache-Control" content="No-Cache"> 	
		<link rel="shortcut icon" href="<c:url value="/resources/images/favicon.ico"/>"/>
		
		<!-- css block -->
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/axisj/ui/arongi/AXJ.min.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/sumoselect.css"/>" />
	
		<!-- js block -->
		<script type="text/javascript" src="<c:url value="/resources/js/axisj/jquery/jquery.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/timer/jquery.timer.js"/>"></script> 
		<script type="text/javascript" src="<c:url value="/resources/js/axisj/dist/AXJ.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/validator-min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/framework.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/json2.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/jquery.mask.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/jquery.placeholder.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/jquery.sumoselect.min.js"/>"></script>	<%-- sumoSelect --%>
		<script type="text/javascript" src="<c:url value="/resources/js/Highcharts/js/highcharts.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/Highcharts/js/themes/grid-light.js"/>"></script><%-- Chart Color --%>
		<script type="text/javascript" src="<c:url value="/resources/js/Highcharts/js/modules/exporting.js"/>"></script>	
		<script type="text/javascript" src="<c:url value="/resources/js/Highcharts/js/highcharts-more.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/Highcharts/js/modules/solid-gauge.js"/>"></script>
				
		<script type="text/javascript">
			var pageID = "LSWareWebPage";
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
		</script>	
	</head>
	<body>
		<div class="wrap">	
		<tiles:insertAttribute name="header" />	    
		<tiles:insertAttribute name="lnb" />	    
	    <!-- p_IM container / 좌측 메뉴 없을 경우 class 추가 : left_lnb_none -->
		<div class="container">		
			<div class="contentWrap" id="container">
			    <div class="content">
	                <div class="naviWrap">
	                    <div class="navi"> 
							<a href="<c:url value="${user.firstMenu.menuUrl}"/>" title="HOME" class="home">HOME</a>
							<c:if test="${!empty user.selectedCurrMenu.upMenuMngt}">
								<c:if test="${!empty user.selectedCurrMenu.upMenuMngt.upMenuMngt}">
								&gt; <a href="<c:url value="${user.selectedCurrMenu.upMenuMngt.upMenuMngt.menuUrl}init.ls"/>"><s:message code="${user.selectedCurrMenu.upMenuMngt.upMenuMngt.mlangCdNm}" text="${user.selectedCurrMenu.upMenuMngt.upMenuMngt.menuNm}" /></a>
								</c:if>
							&gt; <a href="<c:url value="${user.selectedCurrMenu.upMenuMngt.menuUrl}init.ls"/>"><s:message code="${user.selectedCurrMenu.upMenuMngt.mlangCdNm}" text="${user.selectedCurrMenu.upMenuMngt.menuNm}" /></a>
							</c:if> 
							&gt; <s:message code="${user.selectedCurrMenu.mlangCdNm}" text="${user.selectedCurrMenu.menuNm}" />
	                    </div>
	                </div>
	                <div class="contents_area">
	 					<tiles:insertAttribute name="content" />
	                </div>
	            </div>
	        </div>
			<tiles:insertAttribute name="bottom" />
		</div>
	    <!--  //p_IM container -->		
	</div>
	<!-- //p_IM wrap  -->	
	</body>	
</html>