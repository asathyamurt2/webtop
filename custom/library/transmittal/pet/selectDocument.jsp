<!-- 
Component: DOC_U14 PET Transmittals
Author: Miranda Mayle
Date: June/July 2007
Desc: tthis page displays a list of approved documents for the selected 
facility where they are not already associated with the contact
for which the add document link was selected.
 -->
 <%
//
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ page import="com.bhpb.imp.wdk.webtop.transmittal.pet.AutomaticTransmittal" %>

<dmf:webform/>
<dmf:form>
<% //AutomaticTransmittal form = (AutomaticTransmittal)pageContext.getAttribute(Form.FORM, PageContext.REQUEST_SCOPE); %>
<table width='100%'>
<tr><td style='padding-left:10px'>


<table border='0' cellpadding='0' cellspacing='0' width='100%'  align='middle' >
	
	<tr>
		<!-- bugfix 432: Strings not accessible from nls properties in websphere... (form.getString("MSG_BLAH")) -->
		<td><dmf:multiselector name="<%= AutomaticTransmittal.SELECT_NEW_MULTI %>" itemslabel="Approved Documents within facility" selecteditemslabel="Documents to add to transmission" listboxwidth="300" multiselect="true" size="20" orderingenabled="false"/></td>
	</tr>

	<tr>
		<td><dmf:hidden name="<%= AutomaticTransmittal.CONTACT_CODE_HIDDEN %>" id="<%= AutomaticTransmittal.CONTACT_CODE_HIDDEN %>"/>
		</td>
	</tr>
	
</table>


</td></tr></table>

</dmf:form>
