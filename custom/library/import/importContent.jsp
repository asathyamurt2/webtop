<%--
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ page import="com.bhpb.imp.controldoc.importcomp.BhpbControlldocImport,com.documentum.web.form.Form" %>
<%@page import="com.documentum.web.form.IParams"%>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<dmf:html>
<dmf:head>
<dmf:webform validation = "false"/>
<%
Form form = (Form)pageContext.getAttribute(IParams.FORM,PageContext.REQUEST_SCOPE);
String s_FormElementName = form.getElementName();
//
%>
<script type="text/javascript">
registerClientEventHandler(null, "updateDate", updateDate);
function updateDate(msg)
{
var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	
	var yyyy = today.getFullYear();
	if(dd<10)
	{dd='0'+dd} if(mm<10){mm='0'+mm} 
	today = mm+'/'+dd+'/'+yyyy+' '+today.getHours()+':'+today.getMinutes() + ':' + today.getSeconds();	
	document.getElementById('DateValue').value = today;	
}

registerClientEventHandler(null, "onDisplayWarning", DisplayWarning);
function DisplayWarning(msg)
{
alert(msg);
}
</script>
<script language='JavaScript1.2' src='<%=Form.makeUrl(request,"/custom/xforms/scripts/dojo/dojo.js")%>'></script>
<script type="text/javascript">
dojo.addOnLoad(function(){
dojo.query(".dateTime > input").forEach(function(node, index, arr){
if(index %2 == 1) {
node.style.visibility = "hidden";
}                
});
});
</script>
<script language='JavaScript1.2' src='<%=Form.makeUrl(request, "/wdk/include/dynamicAction.js")%>'></script>
<script language='JavaScript1.2' src='<%=Form.makeUrl(request, "/custom/library/import/importContent.js")%>'></script>
</dmf:head>
<dmf:body cssclass='contentBackground'>
<dmf:form autofocusneeded='true'>
<dmf:hidden name = "DateValue" id = "DateValue" />
<table border="0" cellpadding="0" cellspacing="0">
<dmfx:clientenvpanel environment="appintg">
<tr>
<td valign="top"><dmfx:docbaseicon size='32' name="obj_icon"/></td>
<td width="10" class="spacer">&nbsp;</td>
<td scope="row" valign="top">
<dmf:label name='location' cssclass='textSmallDisabled'/>
<span style="font-size: 1px;"><dmf:image src='images/space.gif'/><center></center></span>
<dmf:label name="file" cssclass='titleTextDark' />
</td>
</tr>
<tr><td height='12' colspan='3'><dmf:image src='images/space.gif'/></td></tr>
</dmfx:clientenvpanel>
<dmfx:clientenvpanel environment="appintg" reversevisible="true" >
<tr>
<td class="fieldlabel rightAlignment">
<%--      Current local file name--%>
<dmf:label nlsid="MSG_FILE"/>
</td>
<td class="defaultcolumnspacer">:&nbsp;</td>
<td><dmf:label name="filename"/></td>
</tr>
</dmfx:clientenvpanel>
<%-- Object name--%>
<tr>
<td class="fieldlabel rightAlignment">
<b><dmf:label cssclass="defaultDocbaseAttributeStyle" nlsid="MSG_NAME"/></td>
<td class="defaultcolumnspacer">:&nbsp;</td>
<td nowrap valign="top">
<dmfx:clientenvpanel environment='appintg'>
<dmf:text name="attribute_object_name" id="attribute_object_name" disableenter="true" 
cssclass="defaultDocbaseAttributeStyle" size="51" tooltipnlsid="MSG_NAME" autocompleteid="DBAttr_object_name"/>
&nbsp;<dmf:requiredfieldvalidator name="validator" controltovalidate="attribute_object_name" 

nlsid="MSG_MUST_HAVE_NAME"/>
<dmf:utf8stringlengthvalidator name="attribute_object_name_lengthValidator" 

controltovalidate="attribute_object_name" maxbytelength="255" nlsid="MSG_NAME_TOO_LONG"/>
</dmfx:clientenvpanel>
<dmfx:clientenvpanel environment='appintg'  reversevisible='true' >
<dmf:text name="attribute_object_name" cssclass="" size="51" tooltipnlsid="MSG_NAME" 

autocompleteid="DBAttr_object_name" />
<dmf:requiredfieldvalidator name="validator" controltovalidate="attribute_object_name" nlsid="MSG_MUST_HAVE_NAME" />
<dmf:regexpvalidator name="validator" controltovalidate="attribute_object_name" expression=".{1,255}" 

nlsid="MSG_NAME_TOO_LONG"/>
</dmfx:clientenvpanel>
<dmfx:docbaseattributeproxy name="docbaseobjectnameproxy" object="docbaseObj" controltorepresent="attribute_object_name"  attribute="object_name"/>
</td>
</tr>
<%--        Object type selection--%>
<tr>
<td class="fieldlabel rightAlignment">
<dmf:label cssclass="defaultDocbaseAttributeStyle" nlsid="MSG_TYPE"/></td>
<td class="defaultcolumnspacer">:&nbsp;</td>
<td class="leftAlignment"><dmf:datadropdownlist width="270" name="objectTypeList" cssclass="defaultDocbaseAttributeStyle" onselect="onSelectType" tooltipnlsid="MSG_TYPE" >
<dmf:dataoptionlist>
<dmf:option datafield="type_name" labeldatafield="label_text"/>
</dmf:dataoptionlist>
</dmf:datadropdownlist>
</td>
</tr>
<%--    Format selection --%>
<tr>
<td class="fieldlabel rightAlignment">
<dmf:label nlsid="MSG_FORMAT"/></td>
<td class="defaultcolumnspacer">:&nbsp;</td>
<td><dmf:datadropdownlist width="270" name="formatList" tooltipnlsid="MSG_FORMAT">
<dmf:dataoptionlist>
<dmf:option datafield="name" labeldatafield="description"/>
</dmf:dataoptionlist>
</dmf:datadropdownlist>
<dmfx:docbaseattributeproxy name="docbaseobjectformatproxy" object="docbaseObj" controltorepresent="formatList"  attribute="a_content_type"/>
</td>
</tr>
<dmf:panel name="unknownFormatInfoLabelPanel" >
<tr>
<td class="fieldlabel rightAlignment"></td>
<td class="defaultcolumnspacer"></td>
<td><dmf:label name='unknownFormatWarningLabel' nlsid='MSG_ENFORCE_SELECT_FORMAT' 

cssclass="validatorMessageStyle"/></td>
</tr>
</dmf:panel>
<%-- Continue edit checkbox --%>
<dmfx:clientenvpanel environment="appintg">
<dmfx:clientenvpanel environment="msoutlook" reversevisible="true">
<tr>
<td class="fieldlabel" align="right"></td>
<td class="defaultcolumnspacer"></td>
<td class="fieldlabel">
<dmf:checkbox name="checkboxContinueEdit" nlsid="MSG_CONTINUE_EDIT" value="true"/>
</td>
</tr>
</dmfx:clientenvpanel>
</dmfx:clientenvpanel>
<%--      Other attributes--%>
<dmf:panel name="dynamicpanel">
<tr id="viewdoctype" style="display:none;" >
<td class="fieldlabel rightAlignment" >
<dmf:label cssclass="defaultDocbaseAttributeStyle" nlsid="DOC_TYPE"/></td>
<td class="defaultcolumnspacer">:&nbsp;</td>
<td class="leftAlignment"><dmf:datadropdownlist width="270" name="dcoTypeList" cssclass="defaultDocbaseAttributeStyle" onselect="ondcoSelectType" tooltipnlsid="DOC_TYPE">
<dmf:option value="" label="" />
<dmf:option value="Production" nlsid="MSG_PROD" />
<dmf:option value="Development" nlsid="MSG_DEV" />
<dmf:option value="OBOJIU" nlsid="MSG_OBO" />
<dmf:option value="Function" nlsid="MSG_FUN" />
</dmf:datadropdownlist>
</td>
</tr>
</dmf:panel>
<tr id="hidden" style="display:none;">
<td class="fieldlabel rightAlignment" >
<dmfx:docbaseattribute name="bhpb_pet_doctype" object="docbaseObj"  attribute="bhpb_pet_doctype"  /></td>
<td class="fieldlabel rightAlignment" >
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_facility" /></td>
<td class="fieldlabel rightAlignment" >
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_completion_date" /></td>

</tr>

<dmfx:docbaseobject name="docbaseObj"/>
<dmf:panel name="dynamicpanel1">
<dmfx:docbaseattributelist name="attrlist" object="docbaseObj" attrconfigid="import"/>
</dmf:panel>
<%
BhpbControlldocImport getdoctype = (BhpbControlldocImport)pageContext.getAttribute(Form.FORM, PageContext.REQUEST_SCOPE);

String development = "false";
		String production = "false";
		String function = "false";
		String obojiu = "false";		
		String sattrlst1 = "false";
		String phase = (String)getdoctype.getPageContext().getSession().getAttribute("phase");
		if (phase != null && !phase.trim().equals("")) {
			if (phase.equals("Development")) {
				sattrlst1 = "true";
				development = "true";
			}  else if (phase.equals("Production")) {
				sattrlst1 = "true";
				production = "true";
			} else if (phase.equals("Function")) {
				sattrlst1 = "true";
				function = "true";
			} else if (phase.equals("OBO/JIU")) {
				sattrlst1 = "true";
				obojiu = "true";
			}
			else {
			}
			
			
		}
%>
<dmf:panel name="defaultattlist" visible="<%=sattrlst1%>">
<dmfx:docbaseattribute object="docbaseObj" attribute="r_object_id"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_facility"  size="48"  pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="title"   size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="subject"   size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_criticality"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_doc_function"   size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_transmittal_number"   size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_purpose"   size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_bhpbrev_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_bhpbrev_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
</dmf:panel>

<dmf:panel name="panproduction" visible="<%=production%>">
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_archive_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_vendor_rev_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_requestor"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_requestor_comments"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_date_registered"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_completion_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<tr><th></th><th></th><th><dmf:label name = "DateError" align = "right" style = "color:red;"/></th></tr>
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_procedure_owner"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_vendor_name"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_vendordoc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_po_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_moc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_tag_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_storage_prov"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_discipline"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_frcp_std_desc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_hsec_std_desc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_regulations_desc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
</dmf:panel>
<dmf:panel name="pandevelopment" visible="<%=development%>">
<dmfx:docbaseattribute object="docbaseObj" attribute="authors"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_archive_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_requestor"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_requestor_comments"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_date_registered"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_completion_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<tr><th></th><th></th><th><dmf:label name = "DateError" align = "right" style = "color:red;"/></th></tr>
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_procedure_owner"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_date_received"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_date_bhpb_return"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_date_sent"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_date_due"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_vendor_name"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_vendor_rev_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_vendordoc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_po_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
</dmf:panel>
<dmf:panel name="panobojiu" visible="<%=obojiu%>">
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_requestor"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_requestor_comments"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_date_registered"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_completion_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<tr><th></th><th></th><th><dmf:label name = "DateError" align = "right" style = "color:red;"/></th></tr>
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_procedure_owner"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_vendor_name"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_vendor_rev_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_vendordoc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
</dmf:panel>
<dmf:panel name="panfunction" visible="<%=function%>">
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_archive_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_requestor"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_requestor_comments"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_date_registered"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_completion_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<tr><th></th><th></th><th><dmf:label name = "DateError" align = "right" style = "color:red;"/></th></tr>
<dmfx:docbaseattribute object="docbaseObj" attribute="bhpb_pet_procedure_owner"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
</dmf:panel>

<dmfx:clientenvpanel environment="msoutlook" reversevisible="true">
<dmf:panel name="oleScanPanel">
<tr>
<td class="fieldlabel rightAlignment" nowrap>
<dmf:label nlsid="MSG_OLE_SCAN_ENABLE"/>
</td>
<td class="defaultcolumnspacer">:&nbsp;</td>
<td class="leftAlignment">
<dmf:checkbox name='oleScanEnable' tooltipnlsid="MSG_OLE_SCAN_ENABLE"/><dmf:label nlsid="MSG_OLE_SCAN_ENABLE_DESCRIPTION"/>
</td>
</tr>
</dmf:panel>

</dmfx:clientenvpanel>
</table>
<%--  BOCS write option --%>
<dmf:panel name="bocswriteoption">
<dmf:panel name="bocswriteoptiontop">
<div style="margin-top: 0px;border-bottom: 1px solid #333;clear:both"></div>
<p class="inlinehelpmessage inlinehelppara"><dmf:label align="left" nlsid="MSG_BOCS_WRITE_OPTION_NOTICE" /></p>
</dmf:panel>
<table border="0" cellpadding="0" cellspacing="0">
<tr>
<br>
<td class="fieldlabel" align="right" valign="top" scope="row" nowrap>
<dmf:label nlsid="MSG_BOCS_WRITE_OPTION"/>
</td>
<td class="defaultcolumnspacer" align="left" valign="top">:&nbsp;</td>
<td align="left" valign="top">
<p class="radiopara"><span class="radio"><dmf:radio name="bocssyncwrite" group="group2" 

tooltipnlsid="MSG_BOCS_SYNC_WRITE"/></span><span class="radiolabel"><dmf:label nlsid="MSG_BOCS_SYNC_WRITE"/></p>
<p class="inlinehelpmessage inlinehelppara" style="padding-left:21px"><dmf:label 

nlsid="MSG_BOCS_SYNC_WRITE_HELP_MESSAGE"/></p>
<p class="radiopara"><span class="radio"><dmf:radio name="bocsasyncwrite" group="group2" 

tooltipnlsid="MSG_BOCS_ASYNC_WRITE"/></span><span class="radiolabel"><dmf:label nlsid="MSG_BOCS_ASYNC_WRITE"/></p>
<p class="inlinehelpmessage inlinehelppara" style="padding-left:21px"><dmf:label 

nlsid="MSG_BOCS_ASYNC_WRITE_HELP_MESSAGE"/></p>
</td>
</tr>
</table>
<dmf:panel name="bocswriteoptionbottom">
<div style="margin-top: 0px;border-bottom: 1px solid #333;clear:both"></div>
</dmf:panel>
</dmf:panel>
</dmf:form>
</dmf:body>
</dmf:html>
