<!-- 
Component: DOC_U14 PET Transmittals
Author: Miranda Mayle
Date: June/July 2007
Desc: this page displays candidate recipient and document
information.  Contacts can be added, removed and ignored on documents
and new documents can be added to contacts.
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

<%
	int i = 1;
%>

<dmf:form>

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr><td style='padding-left:4px'>&nbsp;
	</td>
		<td  width='100%'>
		
		<table>
		<tr><td>
		<dmf:link name="<%=AutomaticTransmittal.COMMENTS_LINK %>" onclick='onShowOrHideComments' nlsid="MSG_SHOW_COMMENTS">
		</dmf:link></td></tr>
		<dmf:panel name="<%= AutomaticTransmittal.COMMENTS_PANEL %>">
		<tr><td>

		<dmf:textarea name = "<%= AutomaticTransmittal.COMMENTS_TEXTAREA %>" rows="3" cols="80"/>
		
		</td></tr>
		</table>
		
		</dmf:panel>
		
			<!--  MKM 13/2/09 paged = false was limiting to ten and diplaying last page only.. hence 50 -->
			<dmf:datagrid name="<%= AutomaticTransmittal.RECIPIENT_GRID_CONTROL %>" pagesize='50'>
			

			
			<tr>
					<td align="left" colspan="6"><dmf:label cssclass="messagesBold" nlsid="MSG_RECIPIENTS"/></td>
					<td align="left" colspan="6"><dmf:label cssclass="messagesBold" nlsid="MSG_DOCUMENTS"/></td>								
			</tr>
			
			<tr>
					<td align="left" valign="top">&nbsp;<!-- dmf:label cssclass="messagesBold" nlsid="MSG_PROCESS"/--></td>
					<td align="left" valign="top"><dmf:label cssclass="messagesBold" nlsid="MSG_CODE"/></td>
					<td align="left" valign="top"><dmf:label cssclass="messagesBold" nlsid="MSG_NAME"/></td>
					<td align="left" valign="top"><dmf:label cssclass="messagesBold" nlsid="MSG_JOB_TITLE"/></td>
					<td align="left" valign="top"><dmf:label cssclass="messagesBold" nlsid="MSG_COMPANY"/></td>
					<td align="left" valign="top">&nbsp;<!-- dmf:label cssclass="messagesBold" nlsid="MSG_ADD_DOCUMENT"/--></td>												
					
					<td colspan="6"></td>
					
					
			</tr>	
			
			
			
			<dmf:datagridRow>
						
				<td><dmf:checkbox name="<%= AutomaticTransmittal.RECIPIENT_PROCESS_CHECK %>" value="true"/></td>
				<td><dmf:label name="<%= AutomaticTransmittal.CONTACT_CODE_LABEL %>" cssclass="defaultDocbaseAttributeStyle" datafield="contact_code"/></td>
				<td><dmf:label name="<%= AutomaticTransmittal.CONTACT_NAME_LABEL %>" cssclass="defaultDocbaseAttributeStyle" datafield="contact_name"/></td>
				<td><dmf:label name="<%= AutomaticTransmittal.JOB_TITLE_LABEL %>"cssclass="defaultDocbaseAttributeStyle" datafield="job_title"/></td>					
				<td><dmf:label name="<%= AutomaticTransmittal.COMPANY_LABEL %>" cssclass="defaultDocbaseAttributeStyle" datafield="company"/></td>
				<td nowrap>
					<dmf:link name="<%= AutomaticTransmittal.ADD_DOC_LINK %>" onclick='onClickAddDoc' nlsid="MSG_ADD_DOCUMENT">
						<dmf:argument name="<%= AutomaticTransmittal.ADD_DOC_ARG %>" datafield="contact_code"/>
					</dmf:link>
				</td>
				<td colspan="6" >
	
					<dmf:datagrid name="<%=AutomaticTransmittal.DOCUMENT_GRID_CONTROL + i%>" paged="false" width="100%">
				    	<%i++;%>
				    	<tr>
			    		<td  align="left" valign="top">&nbsp;<!--dmf:label cssclass="messagesBold" nlsid="MSG_PROCESS"/--></td>
						<td  align="left" valign="top" nowrap><dmf:label cssclass="messagesBold" nlsid="MSG_DOCUMENT_NUMBER"/></td>
						<td  align="left" valign="top" nowrap><dmf:label cssclass="messagesBold" nlsid="MSG_REV_NO"/></td>
						<td align="left" valign="top"><dmf:label cssclass="messagesBold" nlsid="MSG_TITLE"/></td>
						<td  align="left" valign="top">&nbsp;<!-- dmf:label cssclass="messagesBold" nlsid="MSG_VERSION"/--></td>
						<td  align="left" valign="top"><dmf:label cssclass="messagesBold" nlsid="MSG_PERMANENT"/></td>
					
			    		</tr>
			    		
						<dmf:datagridRow>
							<td ><dmf:checkbox name="<%= AutomaticTransmittal.DOCUMENT_PROCESS_CHECK %>" value="true"/>
							<dmf:hidden name="<%= AutomaticTransmittal.OBJECT_ID_HIDDEN %>" datafield="r_object_id"/></td>
							<td  nowrap><dmf:label name="<%= AutomaticTransmittal.OBJECT_NAME_LABEL %>"  cssclass="defaultDocbaseAttributeStyle" datafield="object_name"/></td>
							<td  nowrap><dmf:label  name="<%= AutomaticTransmittal.REV_NO_LABEL %>" cssclass="defaultDocbaseAttributeStyle" datafield="bhpb_pet_bhpbrev_no"/></td>
							<td ><dmf:label  name="<%= AutomaticTransmittal.TITLE_LABEL %>" cssclass="defaultDocbaseAttributeStyle" datafield="title"/></td>
							<td ><dmf:label  name="<%= AutomaticTransmittal.VERSION_LABEL %>"  cssclass="defaultDocbaseAttributeStyle" datafield="r_version_label"/></td>
							<td nowrap>
								<dmf:link name="<%= AutomaticTransmittal.UPDATE_CONTACT_LABEL %>" onclick='onUpdateContact' datafield="updateContact">
									<dmf:argument name="<%= AutomaticTransmittal.CONTACT_CODE_ARG %>" datafield="contact_code"/>
									<dmf:argument name="<%= AutomaticTransmittal.DOC_ID_ARG %>" datafield="r_object_id"/>
								</dmf:link>
								&nbsp;
								
								<dmf:link name="<%= AutomaticTransmittal.IGNORE_CONTACT_LABEL %>" onclick='onIgnoreContact' datafield="ignoreContact">
									<dmf:argument name="<%= AutomaticTransmittal.CONTACT_CODE_ARG %>" datafield="contact_code"/>
									<dmf:argument name="<%= AutomaticTransmittal.DOC_ID_ARG %>" datafield="r_object_id"/>
								</dmf:link>
						
							</td>
								
						</dmf:datagridRow>
						
						<dmf:nodataRow><td colspan="6"><i><dmf:label nlsid='MSG_NO_DATA'/></td> 
					    </dmf:nodataRow>
					</dmf:datagrid>
				</td>				
				
			</dmf:datagridRow>
			
			<dmf:nodataRow>
				<td colspan="12" align="center"><i><dmf:label nlsid='MSG_NO_TRANSMITTALS'/></i></td>
			</dmf:nodataRow>
			
		</dmf:datagrid>
		</td>
	</tr>
	
	
	
</table>
</dmf:form>
