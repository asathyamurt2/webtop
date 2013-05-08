<%
//
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ page import="com.documentum.web.form.Form" %>
<%@ page import="com.documentum.webcomponent.navigation.doclist.DocList" %>
<html>
<head>
<dmf:webform/>
<script language='JavaScript1.2' src='<%=Form.makeUrl(request, "/wdk/include/dynamicAction.js")%>'></script>
<script language='JavaScript1.2' src='<%=Form.makeUrl(request, "/webcomponent/navigation/navigation.js")%>'></script>
<title><dmf:label nlsid="MSG_HOME_CABINET"/></title>
</head>
<body class='contentBackground homeCabinetClassisBodyMargin' marginheight='0' marginwidth='0'
topmargin='0' bottommargin='0'>
<dmf:form>
<%@ include file='/custom/library/navigation/doclist_body.jsp' %>
</dmf:form>
</body>
</html>
