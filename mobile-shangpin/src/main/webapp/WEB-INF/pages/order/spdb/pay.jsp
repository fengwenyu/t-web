
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.inc.jsp"%>


<rapid:override name="custum">
	<script src="${cdn:js(pageContext.request)}/styles/shangpin/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${cdn:js(pageContext.request)}/styles/shangpin/js/spdb_pay.js" type="text/javascript" charset="utf-8"></script>
</rapid:override > 


<%-- 浏览器标题 --%>
<rapid:override name="title">
	我的订单
</rapid:override>

<%-- 页标题 --%>
<rapid:override name="page_title">
	订单管理
</rapid:override>

<rapid:override name="content">

<body>
 
	<form id="spdb_form" action="${gatewayUrl}" method="post">
	<c:forEach var="pa" items="${requestParams}">
		<input type="hidden" id="${pa.key }" name="${pa.key }" value="${pa.value }"/>
	</c:forEach>
	</form>
<!-- <script type="text/javascript">document.froms['#spsb_form'].submit()</script> -->
</body>
  
</rapid:override> 

 <%-- 页面的尾部 --%>      
 <rapid:override name="footer">
 
 </rapid:override> 

<%@ include file="/WEB-INF/pages/common/common.jsp" %> 
