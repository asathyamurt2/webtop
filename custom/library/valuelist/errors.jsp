<!-- 
Component: COM_C02	Value List Maintenance
Author: Miranda Mayle
Date: June/July 2007
Desc: this page displays errors encountered when 
editing registered tables
 -->
 <%
//
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ page import="com.bhpb.imp.wdk.webtop.valuelist.EditListValues" %>


<dmf:webform/>
<dmf:form>
<table width='100%'>
<tr><td style='padding-left:10px'>

<table border="0" bordercolor="red" cellpadding="2" cellspacing="0" width="100%">
	<tr>
	<td>	<dmf:label name="<%=EditListValues.RESULT_FAIL_LABEL%>" cssclass="validatorMessageStyle"/>
	</td>
	</tr>
</table>

</td>
</tr>
</table>

</dmf:form>
