<%@ page import="com.documentum.web.form.Form,
com.bhpb.imp.wdk.webtop.report.ACLDetails,
com.documentum.web.form.control.databound.Datagrid"%>
<%@ page contentType="text/html"%>
<%@ page errorPage="/wdk/errorhandler.jsp"%>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>

<script language="javascript1.2">
function handlePrintReportButtonClick()
{
	window.print();
}
</script>
<dmf:html>
	<dmf:head>
		<dmf:webform/>
	</dmf:head>
	<dmf:body>
		<h2><dmf:label nlsid="MSG_RPT_ACL_DETAIL"/></h2>
		<dmf:form>
			<p><dmf:label nlsid="MSG_RPT_DATE"/>: <dmf:label name="REPORT_DATE"/><br>
			   <dmf:label nlsid="MSG_RPT_USER"/>: <dmf:label name="REPORT_BY"/><br>
			   <dmf:label nlsid="MSG_RPT_TOTAL"/>: <dmf:label name='TOTAL'/><BR>
			   <dmf:label nlsid="MSG_RPT_PARAM"/>: <dmf:label name='REPORT_PARAM'/>
			</p>
				<% 
ACLDetails form = (ACLDetails)pageContext.getAttribute(ACLDetails.FORM, PageContext.REQUEST_SCOPE);
Datagrid datagrid = (Datagrid)form.getControl("acldetail", Datagrid.class);
%>
			
			<dmf:datagrid name="acldetail" paged="false">
				<tr>
					<td colspan='4'>
									<dmf:button name="saveReport" onclick="onSaveReportButtonClicked" nlsid="MSG_SAVE_REPORT"/>
									<dmf:button name="printReport" onclick="handlePrintReportButtonClick" runatclient="true" nlsid="MSG_PRINT_REPORT" />
				                    <dmf:button name='cancel' onclick="onClose" nlsid="MSG_CLOSE"/>
				    </td>
				</tr>				
				<tr>
					<td colspan='5' align='right'></td>
					<td colspan='3' align='right' nowrap>
					</td>
				</tr>
				<tr>
					<th>ACL Name</th>					
					<th>Owner</th>			
					<th>Permissions</th>
					<th>Group</th>
				</tr>
				<dmf:datagridRow>
				<%
// Resultset now returns actual value not NLS so ExcelReportBuilder exports value not NLS
//String permitNLS = datagrid.getDataProvider().getDataField("accessor_permit_desc");
				%>
					<td><dmf:label datafield="acl_name"/></td>
					<td><dmf:label datafield="owner"/></td>
					<td><dmf:label datafield="accessor_permit_desc"/></td>
					<td><dmf:label datafield="accessor_name"/></td>
				</dmf:datagridRow>
			</dmf:datagrid>
			<dmf:label name="ERROR_MSG"/>
		</dmf:form>
	</dmf:body>
</dmf:html>
