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
		<h2><dmf:label nlsid='MSG_ACL_DISCREP_RPT'/></h2>
		<dmf:form>
			<p><dmf:label nlsid="MSG_RPT_DATE"/>: <dmf:label name="REPORT_DATE"/><br>
			   <dmf:label nlsid="MSG_RPT_USER"/>: <dmf:label name="REPORT_BY"/><br>
			   <dmf:label nlsid="MSG_RPT_TOTAL"/>: <dmf:label name='TOTAL'/><BR>
   			   <dmf:label nlsid="MSG_RPT_PARAM"/>: <dmf:label name='REPORT_PARAM'/>
			</p>
			<dmf:datagrid name="folderdescrepancyacl" paged="false">
				<tr>
					<td colspan='4'>
									<dmf:button name="saveReport" onclick="onSaveReportButtonClicked" nlsid="MSG_SAVE_REPORT"/>
									<dmf:button name="printReport" onclick="handlePrintReportButtonClick" runatclient="true" nlsid="MSG_PRINT_REPORT" />
				                    <dmf:button name='cancel' onclick="onClose" nlsid="MSG_CLOSE"/>
				    </td>
				</tr>				
				<tr>
					<td colspan='5' >
					<!--dmf:datapaging name='docpager' showgotopage='true' showdisplayinginfo='true' showfirstandlast='true' showimages='true'/-->
						</td>
					<td colspan='3' align='right' nowrap>
						<!--dmf:datapagesize name='docpager' pagesizevalues='10,50,100'/-->
					</td>
				</tr>
				<tr>
					<th>Document Name</th>					
					<th>Folder Path</th>			
					<th>ACL Name</th>
					<th>Owner</th>
				</tr>
				<dmf:datagridRow>
					<td><dmf:label datafield="document_name"/></td>
					<td><dmf:label datafield="folder_name"/></td>
					<td><dmf:label datafield="acl_name"/></td>
					<td><dmf:label datafield="owner_name"/></td>
				</dmf:datagridRow>
			</dmf:datagrid>
			<dmf:label name="ERROR_MSG"/>
		</dmf:form>
	</dmf:body>
</dmf:html>
