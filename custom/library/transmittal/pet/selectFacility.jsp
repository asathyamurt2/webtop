<!-- 
Component: DOC_U14 PET Transmittals
Author: Scott Davies
Date: June 2007
Desc:
Collects facility information for transmittal and recipient maintenance control.
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
<table border="0" bordercolor="blue" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td colspan="3"><dmf:label nlsid="MSG_FACILITY_INSTRUCTIONS"/></td>
</tr>

	<tr>
	    <td class="fieldlabel" align="right"><b><dmf:label cssclass="defaultDocbaseAttributeStyle" nlsid="MSG_FACILITY"/>
	    </td>
	    <td class="defaultcolumnspacer">:&nbsp;</td>
	    <td> 
	    <dmf:dropdownlist name="<%= Transmittal.FACILITY_CONTROL %>" >
	    </dmf:dropdownlist>
	    </td>
	</tr>
<tr>
<td height='10'>&nbsp;</td>
</tr>
</table>
</td></tr>
</table>
</dmf:form>
