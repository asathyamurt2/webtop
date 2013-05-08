<!-- 
Component: DOC_U14 PET Transmittals
Author: Miranda Mayle
Date: June/July 2007
Desc: this page allows user to edit existing recipient
information or add a new recipient to the contact_codes
table
 -->
 <%
//
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ page import="com.bhpb.imp.wdk.webtop.transmittal.pet.Transmittal" %>


<dmf:webform/>
<dmf:form>
<table width='100%'>
<tr><td style='padding-left:10px'>

<table border="0" bordercolor="red" cellpadding="2" cellspacing="0" width="100%">
	<tr>
	<td><dmf:label name="<%=Transmittal.RESULT_SUCCESS_LABEL%>"/><br/>
	<dmf:label name="<%=Transmittal.RESULT_FAIL_LABEL%>" cssclass="validatorMessageStyle"/>
	</td>
	</tr>
</table>

</td>
</tr>
</table>

</dmf:form>
