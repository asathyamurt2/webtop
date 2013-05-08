<!-- 
Component: DOC_U14 PET Transmittals
Author: Miranda Mayle
Date: June/July 2007
Desc: this page displays coversheet details where no tranmittal acknowledgement
has been recieved
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
<%@ page import="com.bhpb.imp.wdk.webtop.transmittal.pet.AcknowledgementReport" %>


<dmf:webform/>
<dmf:form>
<table width='100%'>
<tr><td style='padding-left:10px'>

<table border='0' cellpadding='0' cellspacing='0' width='100%'  align='middle' >
	
	<tr>
		<td  align='middle'>
			<dmf:datagrid name="<%=AcknowledgementReport.REPORT_GRID_CONTROL %>" paged="true" pagesize="15">

				<tr>
					<td align="left"><dmf:label cssclass="messagesBold" nlsid="MSG_OBJECT_NAME"/></td>
					<td align="left"><dmf:label cssclass="messagesBold" nlsid="MSG_CREATION_DATE"/></td>
					<!-- this info is in the object name field td align="left"><dmf:label cssclass="messagesBold" nlsid="MSG_CONTACT_CODE"/></td-->
					<td align="left"><dmf:label cssclass="messagesBold" nlsid="MSG_CONTACT_NAME"/></td>
					<td align="left"><dmf:label cssclass="messagesBold" nlsid="MSG_JOB_TITLE"/></td>
					<td align="left"><dmf:label cssclass="messagesBold" nlsid="MSG_COMPANY"/></td>
				</tr>
			
				<dmf:datagridRow>
					<td align="left"><dmf:label datafield="object_name"/></td>
					<td align="left"><dmf:label datafield="r_creation_date"/></td>
					<!-- this info is in the object name field td align="left"><dmf:label datafield="bhpb_pet_contact_code"/></td-->
					<td align="left"><dmf:label datafield="bhpb_pet_contact_name"/></td>
					<td align="left"><dmf:label datafield="bhpb_pet_job_title"/></td>
					<td align="left"><dmf:label datafield="bhpb_pet_company"/></td>
				</dmf:datagridRow>
	
				<dmf:nodataRow><td colspan="6" align="center"><i><dmf:label nlsid='MSG_NO_REPORT'/></i></td>
			    </dmf:nodataRow>

				<td colspan="6" align="center">
				<dmf:datapaging name="reportPager" showgotopage="true" showfirstandlast="true"/>
				</td>
			</dmf:datagrid>	

		</td>
	</tr>

</table>

</td></tr>
</table>

</dmf:form>
