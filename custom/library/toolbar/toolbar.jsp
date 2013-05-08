<%
//
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ page import="com.documentum.web.form.Form" %>
<html>
<head>
<dmf:webform/>
<script language='JavaScript1.2' src='<%=Form.makeUrl(request, "/wdk/include/dynamicAction.js")%>'></script>
</head>
<body class="webtopToolbarSurround" marginheight='0' marginwidth='0' leftmargin='0' rightmargin='0' topmargin='0' bottommargin='0'>
<dmf:form>
<table border='0' cellpadding='0' cellspacing='0' width="100%" class="toolbarbackground" class="webtopToolbarSurround">
<tr>
<td width="95%" class="leftAlignment" nowrap height="23">&nbsp;</td>
<td><dmf:image src="images/toolbar/toolbar_crnr_lft.gif"/></td>
<td nowrap class="webtopToolbarBackground rightAlignment">
<table cellpadding="0" cellspacing="0" border="0">
<tr>
<td nowrap><dmfx:actionlink cssclass='toolbaractions' dynamic="singleselect" name="autovue" action="autovue" nlsid="MSG_AUTOVUE" tooltipnlsid="MSG_AUTOVUE" src="icons/toolbar/icon_checkin_16.gif" srcdisabled="icons/toolbar/icon_checkin_disabled_16.gif" linkspacer="10" showifdisabled="true" showifinvalid='true'/></td>
<td nowrap><dmfx:actionlink cssclass='toolbaractions' dynamic="multiselect" name='checkin' action='checkin' nlsid='MSG_CHECKIN' tooltipnlsid='MSG_CHECKIN' src="icons/toolbar/icon_checkin_16.gif" srcdisabled="icons/toolbar/icon_checkin_disabled_16.gif" linkspacer="10" showifdisabled="true" showifinvalid='true'/></td>
<td nowrap><dmfx:actionlink cssclass='toolbaractions' dynamic="multiselect" name='checkout' action='checkout' nlsid='MSG_CHECKOUT' tooltipnlsid='MSG_CHECKOUT' src="icons/toolbar/icon_checkout_16.gif" srcdisabled="icons/toolbar/icon_checkout_disabled_16.gif" linkspacer="10" showifdisabled="true" showifinvalid='true'/></td>
<td nowrap><dmfx:actionlink cssclass='toolbaractions' dynamic="multiselect" name='edit' action='editfile' nlsid='MSG_EDIT' tooltipnlsid='MSG_EDIT'  src="icons/toolbar/icon_edit_16.gif" srcdisabled="icons/toolbar/icon_edit_disabled_16.gif" linkspacer="10" showifinvalid='true'/></td>
<td nowrap><dmfx:actionlink cssclass='toolbaractions' dynamic="multiselect" name='add' action='addtoclipboard' nlsid='MSG_ADD_TO_CLIPBOARD' tooltipnlsid='MSG_ADD_TO_CLIPBOARD' src="icons/toolbar/icon_copy_16.gif" srcdisabled="icons/toolbar/icon_copy_disabled_16.gif" linkspacer="10" showifdisabled="true" showifinvalid='true'/></td>
<td nowrap><dmfx:actionlink cssclass='toolbaractions' dynamic="multiselect" name='cancelcheckout' action='cancelcheckout' nlsid='MSG_CANCEL_CHECKOUT' tooltipnlsid='MSG_CANCEL_CHECKOUT' src="icons/toolbar/icon_cancel_16.gif" srcdisabled="icons/toolbar/icon_cancel_disabled_16.gif" linkspacer="10" showifdisabled="true" showifinvalid='true'/></td>
</tr>
</table>
</td>
<td><dmf:image src="images/toolbar/toolbar_crnr_rt.gif"/></td>
</tr>
</table>
</dmf:form>
</body>
</html>
