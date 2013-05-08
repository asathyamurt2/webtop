<%
//
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ taglib uri="/WEB-INF/tlds/dmda_1_0.tld" prefix="dmda" %>
<%@ page import="com.documentum.web.form.Form" %>
<%@ page import="com.bhpb.imp.wdk.common.properties.UserAccess" %>
<%--  webcomponent/library/permissions/permissions.jsp was used as --%>
<%-- starting point and significantly re-hashed for this jsp --%>
<dmf:html>
<dmf:head>
<dmf:webform/>
<script language='JavaScript1.2' src='<%=UserAccess.makeUrl(request, "/wdk/include/dynamicAction.js")%>'></script>
</dmf:head>
<dmf:body cssclass='contentBackground' id="extpermissions">
<dmf:form>
<table border="0" cellpadding="0" cellspacing="0">
<tr>
<td colspan="4">
<dmf:label name="governancelabel" cssclass="fieldlabel"/>
</td>
</tr>
<tr>
<td align="right"  class="fieldlabel" valign="top">
<dmf:label nlsid="MSG_PERMISSION_SET"/>
</td>
<td align="left" valign="top" class="defaultcolumnspacer">:&nbsp;</td>
<td class="fieldlabel" valign="top"></td>
<td valign="top" align="left"><dmf:label name="permissionset"/></td>
</td>
</tr>
<tr>
<td align="right"  class="fieldlabel" valign="top">
<dmf:label nlsid="MSG_DESCRIPTION"/>
</td>
<td align="left" valign="top" class="defaultcolumnspacer">:&nbsp;</td>
<td colspan="2" valign="top">
<dmf:label name="description"/>
</td>
</tr>
<tr>
<td align="right"  class="fieldlabel" valign="top">
<dmf:label nlsid="MSG_OWNER" />
</td>
<td align="left" valign="top" class="defaultcolumnspacer">:&nbsp;</td>
<td colspan="2" valign="top">
<dmf:label name="owner"/>
</td>
</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td align="left" class="fieldlabel" valign="top">
<dmf:label nlsid="MSG_GLOBAL_GROUP_PERMISSIONS"/>:
</td>
<td align="left" valign="top" class="defaultcolumnspacer">&nbsp;</td>
<td colspan="2">&nbsp;</td>
</tr>
<tr>
<td colspan="3"><%@ include file ='gbluseraccesstable.jspf' %></td>
</tr>
<tr>
<td class="spacer" height="10" colspan="4">&nbsp;</td>
</tr>
<tr>
<td align="left" class="fieldlabel" valign="top">
<dmf:label nlsid="MSG_USER_GROUP_PERMISSIONS"/>:
</td>
<td align="left" valign="top" class="defaultcolumnspacer">&nbsp;</td>
<td colspan="2">&nbsp;</td>
</tr>
<tr>
<td colspan="3"><%@ include file ='useraccesstable.jspf' %></td>
</tr>
<tr>
<td colspan="3"><BR><BR></td>
</tr>
</table>
<br>
</dmf:form>
</dmf:body>
</dmf:html>
