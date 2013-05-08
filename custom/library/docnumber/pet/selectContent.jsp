<!-- 
Component: DOC_U11 PET Generate Number Format
Author: Miranda Mayle
Date: May/June 2007
Desc:
Select document number format content to edit
 -->
<%
//
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ page import="com.bhpb.imp.wdk.webtop.docnumber.pet.EditFormatContent" %>
<dmf:webform/>
<dmf:form>

<table width='100%'>
<tr><td style='padding-left:10px'>
<table border="0" bordercolor="blue" cellpadding="2" cellspacing="0" width="100%">
					
			<tr>
			    <td class="fieldlabel" align="right"><b><dmf:label cssclass="defaultDocbaseAttributeStyle" nlsid="MSG_FACILITY"/>
			    </td>
			    <td class="defaultcolumnspacer">:&nbsp;</td>
			    <td> <dmf:dropdownlist name="<%=EditFormatContent.FACILITY_CONTROL %>" onselect="onSelectFacility">
			    </dmf:dropdownlist>
			    </td>
			</tr>
			
			<tr>
			    <td class="fieldlabel" align="right"><b><dmf:label cssclass="defaultDocbaseAttributeStyle" nlsid="MSG_CONTENT"/>
			    </td>
			    <td class="defaultcolumnspacer">:&nbsp;</td>
			    <td> <dmf:dropdownlist name="<%=EditFormatContent.CONTENT_CONTROL %>" >
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
