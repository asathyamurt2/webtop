<!-- 
Component: COM_U02 Value List Maintenance
Author: Sudha Madheswaran
Date: June 2007
Desc:
Allows To select attribute which needs to be edited.
 -->
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ page import="com.documentum.web.form.Form" %>
<%@ page import="com.documentum.web.form.control.databound.*" %>
<%@ page import="com.documentum.web.form.control.*" %>
<%@ page import="com.bhpb.imp.wdk.webtop.valuelist.EditListValues" %>
<dmf:webform/>
<dmf:form>

<table width='100%'>
<tr><td style='padding-left:10px'>
<table border="0" bordercolor="blue" cellpadding="2" cellspacing="0" width="100%">
		<tr>
		  <td>
		    <dmf:label name = "<%=EditListValues.ERROR_LABEL%>" visible ="false" cssclass="validatorMessageStyle"/>
		  </td>
		  </tr>
		  <dmf:panel name="<%=EditListValues.ATTRIBUTE_PANE%>" visible='true'>
			<tr>
			    <td class="fieldlabel" align="right"><dmf:label nlsid='MSG_SELECT_ATTRIBUTES'/>
			    </td>
			    <td class="defaultcolumnspacer">:&nbsp;</td>
			    <td> <dmf:dropdownlist name="<%=EditListValues.DROP_DOWN_CONTROL%>"/>
			     </td>
			</tr>		
		</dmf:panel>
<tr>
<td height='10'>&nbsp;</td>
</tr>
</table>
</td></tr>
</table>
</dmf:form>
