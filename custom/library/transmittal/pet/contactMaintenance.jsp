<!-- 
Component: DOC_U14 PET Transmittals
Author: Miranda Mayle
Date: June/July 2007
Desc: displays all recipient information for the 
selected facility.  paged and sortable
 -->
 <%
//
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ page import="com.documentum.web.form.Form" %>
<%@ page import="com.documentum.web.form.control.databound.*" %>
<%@ page import="com.documentum.web.form.control.*" %>
<%@ page import="com.documentum.web.form.control.databound.DataProvider" %>
<%@ page import="com.bhpb.imp.wdk.webtop.transmittal.pet.RecipientMaintenance" %>


<dmf:webform/>
<dmf:form>
<table width='100%'>
<tr><td style='padding-left:10px'>

<table border='0' cellpadding='0' cellspacing='0' width='100%'  align='middle' >
	
	<tr><td></td><td>
	<dmf:button name="<%= RecipientMaintenance.ADD_CONTACT_BUTTON_CONTROL %>" cssclass='buttonLink' nlsid="MSG_ADD_CONTACT" onclick='onAddContact'
				height='16' imagefolder='images/dialogbutton' tooltipnlsid='MSG_ADD_CONTACT' runatclient='false'/>
	</td></tr>
	<tr>
		<td>
			<dmf:datagrid name="<%= RecipientMaintenance.CONTACTS_GRID_CONTROL %>" paged="true" pagesize="15">

				<tr>
					<td align="left">
						<dmf:datasortlink name='sortcode' nlsid='MSG_CONTACT_CODE' column='contact_code' cssclass='messagesBold'/>
					&nbsp;</td>
					<td align="left">
						<dmf:datasortlink name='sortname' nlsid='MSG_CONTACT_NAME' column='contact_name' cssclass='messagesBold'/>
					&nbsp;</td>
					<td align="left">
						<dmf:datasortlink name='sortname' nlsid='MSG_COMPANY' column='company' cssclass='messagesBold'/>
					&nbsp;</td>
					<td align="left">
						<dmf:datasortlink name='sorttitle' nlsid='MSG_JOB_TITLE' column='job_title' cssclass='messagesBold'/>
					&nbsp;</td>
					
					<td></td>
					<td></td>
				
				</tr>
			
				<dmf:datagridRow>
					<td align="left"><dmf:label datafield="contact_code"/></td>
					<td align="left"><dmf:label datafield="contact_name"/></td>
					<td align="left"><dmf:label datafield="company"/></td>
					<td align="left"><dmf:label datafield="job_title"/></td>
			 		<td align="left">&nbsp;&nbsp;<dmf:link name='lnkEdit' onclick='onClickEdit' label='Edit'>
							<dmf:argument name='contactCode' datafield='contact_code'/>
						</dmf:link></td>
					<td align="left">&nbsp;&nbsp;<dmf:link name='lnkDelete' onclick='onClickDelete' label='Delete'>
							<dmf:argument name='contactCode' datafield='contact_code'/>
						</dmf:link></td>
				</dmf:datagridRow>
	
				<dmf:nodataRow><td colspan="4"><i><dmf:label nlsid='MSG_NO_DATA'/></td> <td></td><td></td>
			    </dmf:nodataRow>
				<td colspan="4" align="center">
				<dmf:datapaging name="sd" showgotopage="true" showfirstandlast="true" />
				</td><td></td><td></td>
			</dmf:datagrid>	

		</td>
	
	<td>
	</td></tr>
</table>
</td></tr>

</table>
</dmf:form>
