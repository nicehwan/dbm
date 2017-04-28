<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 				prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" 	prefix="sec"  %>
<!--  p_IM header 공통영역 -->
	<sec:authentication var="user" property="principal" />
    <div class="headerWrap">
        <div class="header">
			<a href="<c:url value="${user.firstMenu.menuUrl}"/>" target="_self" alt="Omni-VM"><h1 class="headerLogo"><s:message code="tiles.header.title" text="Omni-VM"/></h1></a>
            <ul class="gnb">
                <li class=""><fmt:formatDate value="${user.comUserMngt.loginDt}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></li>
                <li class="user_select_wrap">
                	<a href="#" title="user" class="userSelect">
                		<span class="user">${user.comUserMngt.userNm}</span>
                		<p class="badge1" id="notiBadge" style="display:none"></p>
                	</a>
                    <div class="user_select_box" style="display:none">
                        <ul class="user_select_box_inner">
                            <c:forEach var="authGrp" items="${user.comAuthGrpMngts}">
                            <c:if test="${user.currAuthGrpMngt.authGrpMngtSeq eq authGrp.authGrpMngtSeq}"><li><a href="#" class="manager"><b>${authGrp.authGrpNm}*</b></a></li></c:if>
                            <c:if test="${user.currAuthGrpMngt.authGrpMngtSeq ne authGrp.authGrpMngtSeq}"><li><a href="javascript:goChangeAuth(${authGrp.authGrpMngtSeq});" class="operator">${authGrp.authGrpNm}</a></li></c:if>
                            </c:forEach>
                            <li style="border-top:1px solid #cccccc;"><a href="<c:url value="/common/NotiReceivedMngt/init.ls"/>" title="공지사항" class="notice"><s:message code="tiles.header.notiInfo" text="공지사항"/><p class="badge2" id="notiBadge" style="display:none"></p></a></li>
                            <%-- <li style="border-top:1px solid #cccccc;"><a href="<c:url value="/common/UserInfo/init.ls"/>" title="개인정보 변경" class="privacy"><s:message code="tiles.header.editUserInfo" text="개인정보 변경"/></a></li> --%>
                            <%-- li style="border-top:1px solid #cccccc;"><a href="javascript:popupChgPwd();" title="패스워드변경" class="password"><s:message code="tiles.header.changePasswd" text="패스워드변경"/></a></li--%>
                            <li style="border-top:1px solid #cccccc;"><a href="<c:url value="/login/logout.ls"/>" title="로그아웃" class="logout"><s:message code="tiles.header.logout" text="로그아웃"/></a>
                        </ul>
                    </div>
                </li>
                <!-- 
                <li class="lang_select_wrap"><a href="#" title="language" class="userSelect"><span class="">Language(<c:choose>
                	<c:when test="${locale.language eq 'en'}"><s:message code="tiles.locale.language.en" text="ENGLISH"/></c:when>
                	<c:when test="${locale.language eq 'zh'}"><s:message code="tiles.locale.language.zh" text="CHINESE"/></c:when>
                	<c:when test="${locale.language eq 'ko'}"><s:message code="tiles.locale.language.ko" text="KOREAN"/></c:when>
                	<c:otherwise><s:message code="tiles.locale.language.ko" text="KOREAN"/></c:otherwise>
                	</c:choose>)</span></a>
                    <div class="lang_select_box" style="display: none">
                        <ul class="lang_select_box_inner">
                           <li class="" style=""><a onclick="changeLocale('ko')" title="<s:message code="tiles.locale.language.ko" text="KOREAN"/>" class="ko"><s:message code="tiles.locale.language.ko" text="KOREAN"/></a></li>
                           <li class="" style="border-top:1px solid #cccccc;"><a onclick="changeLocale('zh')" title="<s:message code="tiles.locale.language.zh" text="CHINESE"/>" class="zh"><s:message code="tiles.locale.language.zh" text="CHINESE"/></a></li>
                           <li class="" style="border-top:1px solid #cccccc;"><a onclick="changeLocale('en')" title="<s:message code="tiles.locale.language.en" text="ENGLISH"/>" class="en"><s:message code="tiles.locale.language.en" text="ENGLISH"/></a></li>                           
                        </ul>
                    </div>
                </li>
                 -->
                <li class=""><a href="<c:url value="${user.firstMenu.menuUrl}"/>" title="HOME" class="home">HOME</a></li>
            </ul>
        </div>     
        <div class="lnbWrap">
            <h2 class="headerName">Omni-VM</h2>
			  <ul>
			  	<c:forEach var="menu" items="${user.topMenuList}">
			  	  	<c:if test="${menu.screnViewYn eq 'Y'}">
					<li <c:if test="${menu.menuMngtSeq eq user.selectedCurrMenu.upMenuMngtSeq}">class="on"</c:if>>
						<a href="<c:choose>
							<c:when test="${!empty menu.menuUrl}"><c:url value="${menu.menuUrl}"/></c:when>
							<c:when test="${!empty menu.childMenuMngts[0].menuUrl}"><c:url value="${menu.childMenuMngts[0].menuUrl}"/></c:when>
							<c:when test="${!empty menu.childMenuMngts[0].childMenuMngts[0].menuUrl}"><c:url value="${menu.childMenuMngts[0].childMenuMngts[0].menuUrl}"/></c:when>
						</c:choose>" class="${menu.treeIconVal}"><s:message code='${menu.mlangCdNm}' text="${menu.menuNm }"/></a>
					</li>
					</c:if>
				</c:forEach>
			  </ul>			      
        </div>
    </div>

<script type="text/javascript">
	var pwdModal = new AXModal();

	<%-- 패스워드를 변경한다. --%>
	function popupChgPwd(){
		pwdModal.open({
			url: '<c:url value="/common/UserInfo/popupUserPasswdChg.ls"/>',
			pars: {${_csrf.parameterName}:'${_csrf.token}'},
			top:20,
			width:400,
			height:300
		});	
	}

	<%-- 권한을 변경한다. --%>
	function goChangeAuth(vAuthGrpMngtSeq){
		location.href = '<c:url value="/changeAuthGrp.ls"/>?authGrpMngtSeq=' + vAuthGrpMngtSeq;
	}
	
	<%-- 언어를 변경한다. --%>
	function changeLocale(language) {
		location.href = '<c:url value="/login/changeLocale.ls"/>?language=' +language;
	}
	
	<%-- 공지를 닫는다. --%>
	function noticeComfirm(vNotiMngtSeq){
		$.post('<c:url value="/common/NotiReceivedMngt/closeNotiUserMap.json"/>',
			{ 
				notiMngtSeq				: vNotiMngtSeq,
				${_csrf.parameterName} 	: '${_csrf.token}'
			},
			function(data){
				<%-- 읽기 처리는 했지만 할 일은 없다. --%>
			}
		);	
	}
	
	<%-- 공통 오류 표시기 --%>
	function commonAjaxErrorDialog(data){
		if(data.isError == 'true' ){
			dialog.push({body:'<b><s:message code="framework.common.error.defaultMsg" text="장애가 발견 되었습니다.\n 관리자에게 문의하세요."/></b>\nMessage : ' + data.errorMsg, type:'Caution'});
			return true;
		}else{
			return false;
		}
	}
	
	$(document).ready(function(){
		
		// header_gnb 권한설정
		$(".user_select_wrap").click(function(){
			$(".user_select_box").slideToggle(100);
		});

		// header_lang 다국어 설정
		$(".lang_select_wrap").click(function(){
			$(".lang_select_box").slideToggle(100);
		});
		
		<%-- 세션에 새로운 메시지가 있는지 확인한다. --%>
		var noticeIntervalId = setInterval(function(){
			$.getJSON(
		        url="<c:url value='/notification/checkSessionAndNotify.json'/>",
		        function(notification){
		        	if(notification.notificationDTO == '' || notification.notificationDTO.cnt == -1){
		        		dialog.push({
						    body:'<s:message code="tiles.header.sessionout.forceLogout" text="<b>접속이 종료되었습니다.<b>창을 닫습니다."/>'
						    , top:0, type:'Caution', buttons:[
                                {buttonValue:'<s:message code="tiles.header.sessionout.closeWindow.y" text="예"/>', buttonClass:'Red', 
                                	onClick:function(){
                                		if(navigator.appVersion.indexOf("MSIE 6.0")>=0) { 
            		        		        parent.window.close(); 
            		        		    }else { 
            		        		        parent.window.open('about:blank','_self').close(); 	    
            		        		    }
            						}
                                	
                                },
                                {buttonValue:'<s:message code="tiles.header.sessionout.closeWindow.n" text="아니오"/>', buttonClass:'Blue', 
                                	onClick:function(){
                                		location.href = '<c:url value="/login/loginForm.ls"/>';
            						}                                	
                                }
						    ]});
		        		clearInterval(noticeIntervalId);
		        	}else{
		        		if(notification.notificationDTO.cnt > 0){
		        			$("p[id=notiBadge]").html(notification.notificationDTO.cnt);
		        			$("p[id=notiBadge]").show();
		        		}else{
		        			$("p[id=notiBadge]").hide();
		        		}
		        		
		        		if(Object.keys(notification.notificationDTO.noticeMap).length > 0){
		        			for(var i = 0; i < Object.keys(notification.notificationDTO.noticeMap).length; i++){
			        			$.getJSON(
		        			        url="<c:url value='/notification/toastNotice.json'/>",
		        			        {notiMngtSeq : Object.keys(notification.notificationDTO.noticeMap)[i]},
		        			        function(notce){
		        			        	if(notce.noticeDTO){
		        			        		var vTitle = '<b>' + notce.noticeDTO.notiTitl + '</b>\n';
		        			        		var vBody = notce.noticeDTO.notiCont;
		        			        		var vType = notce.noticeDTO.notiSendGrdCd == 'NORMAL' ? 'Complete' : 'Caution';
		        			        		var vData = notce.noticeDTO.notiMngtSeq;		        			        		
		        			        		toast.push(
		        			        				{
		        			        					body:vTitle + vBody, 
		        			        					type:vType,
		        			        					onConfirm:function(){
		        			        						noticeComfirm(vData);
		        			        					}, 
		        			        					data:vData
		        			        				}
		        			        			);
		        			        	}
		        			        }
			        			);
		        			}
		        		}
		        	}
		        }
		    );
		}, 1000);
	});
</script>
<!--  //p_IM header 공통영역 -->