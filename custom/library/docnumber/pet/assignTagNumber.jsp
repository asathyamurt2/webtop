<!-- 
Component: COM_U02 Value List Maintenance
Author: Sudha Madheswaran
Date: June 2007
Desc:
 Alows to add an existing tag number to a single or multiple bhpb_pet_controlled_doc object(s).
 -->
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ page import="com.documentum.web.form.Form" %>
<%@ page import="com.documentum.web.form.control.databound.*" %>
<%@ page import="com.documentum.web.form.control.*" %>
<%@ page import="com.bhpb.imp.wdk.webtop.docnumber.pet.AssignTagNumber" %>
<dmf:webform/>
<dmf:form>

<table width='100%'>
<tr><td style='padding-left:10px'>
<table border="0" bordercolor="blue" cellpadding="2" cellspacing="0" width="100%" >
	<tr>

	    <td colspan="3" ><dmf:label nlsid='MSG_USER_INFO'/>
	    </td>
	</tr>
	<tr><td height='10'>&nbsp;</td></tr>
	<tr>
	    <td class="fieldlabel" align="right" width="110"><b><dmf:label cssclass="defaultDocbaseAttributeStyle" label="Tag No."/>
	    </td>
	    <td class="defaultcolumnspacer">:&nbsp;</td>
	    <td> <dmf:text name='<%=AssignTagNumber.TAG_NO_CTRL%>'/>
	   <dmf:label name='<%=AssignTagNumber.ERROR_LABEL%>' nlsid = 'MSG_DOESNOT_EXIST' visible='false' cssclass="validatorMessageStyle"/>

	</tr>

	<tr>
	    <td colspan="3" class='defaultLinkStyle' align="center" >
	    <dmf:link name='select_documents' nlsid='MSG_SELECT_DOCUMENT' onclick='onSelectDocuments' >
		<dmf:argument name='multiselect' value='true'/>
		</dmf:link>
	    </td>

	</tr>
	<tr>
	 <td colspan="3" ><br/><br/><br/>
	 <dmf:label name='<%=AssignTagNumber.RESULTS_LABEL%>'/>
	    </td>
	</tr>
	<tr>
	<td height='10'>&nbsp;</td>
	</tr>
</table>
</td></tr>
</table>


</dmf:form>
