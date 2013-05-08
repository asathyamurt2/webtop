<!-- 
Component: DOC_U14 PET Transmittals
Author: Miranda Mayle
Date: June/July 2007
Desc: allows users to select recipient(s) and approved
document(s) for tranmission.  Contacts can be added
to document permanently.
 -->
<%//

			%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="/wdk/errorhandler.jsp"%>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf"%>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx"%>
<%@ taglib uri="/WEB-INF/tlds/impform_1_0.tld" prefix="imp"%>
<%@ page import="com.documentum.web.form.Form" %>
<%@ page import="com.documentum.web.form.control.databound.*" %>
<%@ page import="com.documentum.web.form.control.*" %>
<%@ page import="com.documentum.web.form.control.databound.DataProvider" %>
<%@ page
	import="com.bhpb.imp.wdk.webtop.transmittal.pet.ManualTransmittal"%>

<dmf:webform />
<dmf:form>

	<dmf:paneset name="manualtransmit" rows="175,15,*,2" leftpadding="2" rightpadding="2" toppadding="0" bottompadding="2">

		<dmf:pane name="selectrecip" overflow="auto">
		
		
		<table>
		<tr><td>
			<dmf:link name="<%=ManualTransmittal.COMMENTS_LINK %>" onclick='onShowOrHideComments' nlsid="MSG_SHOW_COMMENTS">
			</dmf:link>
		</td></tr>
		<dmf:panel name="<%= ManualTransmittal.COMMENTS_PANEL %>">
		<tr><td>

		<dmf:textarea name = "<%= ManualTransmittal.COMMENTS_TEXTAREA %>" rows="3" cols="80"/>
		
		</td></tr>
		
		
		</dmf:panel>
		</table>
		
			<!-- dmf:datagrid name="<%= ManualTransmittal.RECIPIENT_MULTI %>"	paged="true" pagesize='50'-->
			<imp:datagrid name="<%= ManualTransmittal.RECIPIENT_MULTI %>"  paged="true" pagesize='50'>


			<dmf:row> 
				<td colspan='5' align='left'> 
					<dmf:datapaging name='pager1'/>
				</td>
			</dmf:row>

				<tr>
					<td align="left" valign="top">&nbsp;<!-- dmf:label cssclass="messagesBold" nlsid="MSG_PROCESS"/--></td>
					<td align="left" valign="top"><dmf:datasortlink name='sortcode'
						nlsid='MSG_CONTACT_CODE' column='contact_code'
						cssclass='messagesBold' /></td>
					<td align="left" valign="top"><dmf:datasortlink name='sortcompany'
						nlsid='MSG_COMPANY' column='company' cssclass='messagesBold'/></td>
					<td align="left" valign="top"><dmf:datasortlink name='sortname'
						nlsid='MSG_CONTACT_NAME' column='contact_name'
						cssclass='messagesBold'/></td>
					<td align="left" valign="top"><dmf:datasortlink name='sortjobtitle'
						nlsid='MSG_JOB_TITLE' column='job_title' cssclass='messagesBold'/></td>
				</tr>

				<dmf:datagridRow>
					<td><dmf:checkbox name="recipcheck" datafield="recipcheck" onclick="onClickRecipCheckbox" >
						<dmf:argument name="<%= ManualTransmittal.SELECT_CONTACT_ARG %>" datafield="contact_code"/>
					</dmf:checkbox></td>
					<td><dmf:label datafield="contact_code" /></td>
					<td><dmf:label datafield="company" /></td>
					<td><dmf:label datafield="contact_name" /></td>
					<td><dmf:label datafield="job_title" /></td>

				</dmf:datagridRow>

			
				



				<dmf:nodataRow>
					<td colspan="12" align="center"><i><dmf:label
						nlsid='MSG_NO_RECIPIENTS' /></i></td>
				</dmf:nodataRow>

			</imp:datagrid>

		</dmf:pane>


		<dmf:pane name="seperator" overflow="hidden">
			<table  width="100%">
				<tr>
					<td>
					<hr />
					</td>
				</tr>
			</table>
		</dmf:pane>

		<dmf:pane name="selectdoc" overflow="auto">

			<!-- dmf:datagrid name="<%= ManualTransmittal.DOCUMENT_MULTI %>" paged="true" pagesize='50'-->
			<imp:datagrid name="<%= ManualTransmittal.DOCUMENT_MULTI %>" paged="true" pagesize='50'>
				
			<dmf:row> 
				<td colspan='8' align='left'> 
					<dmf:datapaging name='pager2'/>
				</td>
			</dmf:row>
				
				<tr>
					<td align="left" valign="top">&nbsp;<!-- dmf:label cssclass="messagesBold" nlsid="MSG_PROCESS"/--></td>
					<td align="left" valign="top"><dmf:datasortlink
						name='sortdocnumber' nlsid='MSG_DOCUMENT_NUMBER'
						column='object_name' cssclass='messagesBold' /></td>
					<td align="left" valign="top"><dmf:datasortlink name='sortrevision'
						nlsid='MSG_REV_NO' column='bhpb_pet_bhpbrev_no'
						cssclass='messagesBold' /></td>
					<td align="left" valign="top"><dmf:datasortlink name='sortdoctitle'
						nlsid='MSG_TITLE' column='title' cssclass='messagesBold' /></td>
					<td align="left" valign="top"><dmf:datasortlink name='sortversion'
						nlsid='MSG_VERSION' column='r_version_label'
						cssclass='messagesBold' /></td>
					<td align="left" valign="top"><dmf:datasortlink name='sortvendor'
						nlsid='MSG_VENDOR' column='bhpb_pet_vendordoc'
						cssclass='messagesBold' /></td>
					<td align="left" valign="top"><dmf:datasortlink
						name='sortvendorrevision' nlsid='MSG_VENDOR_REV'
						column='bhpb_pet_vendor_rev_no' cssclass='messagesBold' /></td>
					<td align="left" valign="top"><dmf:label cssclass="messagesBold" nlsid="MSG_MAKE_PERMANENT"/></td>
				</tr>
				<dmf:datagridRow>

					<td><dmf:checkbox name="doccheck" datafield="doccheck" onclick="onClickDocCheckbox" >
						<dmf:argument name="<%= ManualTransmittal.SELECT_DOC_ARG %>" datafield="r_object_id"/>
					</dmf:checkbox>
					</td>
					<td>
					<dmf:label name="<%= ManualTransmittal.OBJECT_NAME_LABEL %>"
						cssclass="defaultDocbaseAttributeStyle" datafield="object_name" /></td>
					<td><dmf:label name="<%= ManualTransmittal.REV_NO_LABEL %>"
						cssclass="defaultDocbaseAttributeStyle"
						datafield="bhpb_pet_bhpbrev_no" /></td>
					<td><dmf:label name="<%= ManualTransmittal.TITLE_LABEL %>"
						cssclass="defaultDocbaseAttributeStyle" datafield="title" /></td>
					<td><dmf:label name="<%= ManualTransmittal.VERSION_LABEL %>"
						cssclass="defaultDocbaseAttributeStyle"
						datafield="r_version_label" /></td>
					<td><dmf:label name="<%= ManualTransmittal.VENDOR_LABEL %>"
						cssclass="defaultDocbaseAttributeStyle"
						datafield="bhpb_pet_vendordoc" /></td>
					<td><dmf:label name="<%= ManualTransmittal.VENDOR_REV_LABEL %>"
						cssclass="defaultDocbaseAttributeStyle"
						datafield="bhpb_pet_vendor_rev_no" /></td>
					<td><dmf:checkbox name="makeperm" datafield="makeperm" onclick="onClickMakePermCheckbox" >
						<dmf:argument name="<%= ManualTransmittal.SELECT_DOC_ARG %>" datafield="r_object_id"/>
					</dmf:checkbox></td>

				</dmf:datagridRow>

				<dmf:nodataRow>
					<td colspan="12" align="center"><i><dmf:label
						nlsid='MSG_NO_DOCUMENTS' /></i></td>
				</dmf:nodataRow>
			</imp:datagrid>
			
					</dmf:pane>
					
		<dmf:pane name="force" overflow="hidden">
			<table border='0' class='defaultDatagridStyle' width="100%">
				<tr>
					<td>
					&nbsp;
					</td>
				</tr>
			</table>
		</dmf:pane>



	</dmf:paneset>



</dmf:form>
