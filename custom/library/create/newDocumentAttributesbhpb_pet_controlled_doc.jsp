<!-- 
Component: DOC_U10 PET Controlled Document Create
Author: Miranda Mayle
Date: May/June 2007 (updated to 6.5 Sept 2009)
Desc:
This screen allows user to acces the editdocumentnumberbase component.  This page is sourced 
from the attributes component (attributes_dm_document.jsp located webcomponent\library\attributes)
 -->

<%
//
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>

<!--  START MKM CHANGE 1of 2 -->
<%@ page import="com.documentum.web.form.Form" %>
<%@ page import="com.bhpb.imp.wdk.webtop.create.NewDocumentAttributes" %>
<!--  END MKM CHANGE 1 of 2 -->
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
<dmf:html>
<dmf:head>
<dmf:webform/>
</dmf:head>
<dmf:body cssclass='contentBackground' id='attributes_dm_document' titlenlsid='MSG_TITLE' >
<dmf:form>

<dmfx:docbaseobject name="obj" configid="attributes"/>
<div class="attributeList">
<table cellpadding="0" cellspacing="0">

<!-- START MKM CHANGE 2 of 2 -->
	<%
	NewDocumentAttributes newDocAttribs = (NewDocumentAttributes)pageContext.getAttribute(Form.FORM, PageContext.REQUEST_SCOPE);
	boolean blnPetControlledDoc = newDocAttribs.isPetControlledDoc();
	if (blnPetControlledDoc)
	{
	%>
<tr id="viewdoctype" >
<td class="fieldlabel rightAlignment" >
<dmf:label cssclass="defaultDocbaseAttributeStyle" nlsid="DOC_TYPE"/></td>
<td class="defaultcolumnspacer">:&nbsp;</td>
<td class="leftAlignment"><dmf:datadropdownlist width="270" name="dcoTypeList" cssclass="defaultDocbaseAttributeStyle" onselect="ondcoSelectType" tooltipnlsid="DOC_TYPE">
<dmf:option value="Production" nlsid="MSG_PROD" />
<dmf:option value="Development" nlsid="MSG_DEV" />
<dmf:option value="OBOJIU" nlsid="MSG_OBO" />
<dmf:option value="Function" nlsid="MSG_FUN" />
</dmf:datadropdownlist></td></tr>
	<tr>
	<td align="right" scope="row" nowrap class='fieldlabel'>
		<span class="defaultDocbaseAttributeStyle">
			<dmfx:docbaseattributelabel object="obj" attribute="bhpb_pet_document_no_base"/>
		</span>
	</td>
	<td nowrap align='left' class='defaultcolumnspacer'>:</td>
	<td>
		<span  class='defaultDocbaseAttributeStyle'>
			<dmfx:docbaseattributevalue object="obj" attribute="bhpb_pet_document_no_base"/>
		</span>
	</td>
	<td></td>
	</tr>
<tr id="hidden" style="display:none;">
<td class="fieldlabel rightAlignment" >
<dmfx:docbaseattribute name="bhpb_pet_doctype" object="obj"  attribute="bhpb_pet_doctype"  /></td>
</tr>
<!-- table border="0" cellpadding="2" cellspacing="0" width="100%" -->
<dmf:panel name="defaultattlist" visible="true">
<dmfx:docbaseattribute object="obj" attribute="r_object_id"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_facility"  size="48"  pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="title"   size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="subject"   size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_criticality"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_doc_function"   size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_transmittal_number"   size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_purpose"   size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_bhpbrev_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_bhpbrev_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
</dmf:panel>

<dmf:panel name="panproduction" visible="true">
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_archive_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_vendor_rev_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_requestor"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_requestor_comments"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_date_registered"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_completion_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<tr><th></th><th></th><th><dmf:label name = "DateError" align = "right" style = "color:red;"/></th></tr>
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_procedure_owner"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_vendor_name"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_vendordoc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_po_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_moc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_tag_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_storage_prov"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_discipline"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_frcp_std_desc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_hsec_std_desc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_regulations_desc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
</dmf:panel>
<dmf:panel name="pandevelopment" visible="false">
<dmfx:docbaseattribute object="obj" attribute="authors"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_archive_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_requestor"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_requestor_comments"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_date_registered"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_completion_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<tr><th></th><th></th><th><dmf:label name = "DateError" align = "right" style = "color:red;"/></th></tr>
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_procedure_owner"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_date_received"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_date_bhpb_return"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_date_sent"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_date_due"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_vendor_name"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_vendor_rev_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_vendordoc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_po_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
</dmf:panel>
<dmf:panel name="panobojiu" visible="false">
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_requestor"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_requestor_comments"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_date_registered"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_completion_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<tr><th></th><th></th><th><dmf:label name = "DateError" align = "right" style = "color:red;"/></th></tr>
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_procedure_owner"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_vendor_name"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_vendor_rev_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_vendordoc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
</dmf:panel>
<dmf:panel name="panfunction" visible="false">
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_archive_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_requestor"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_requestor_comments"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_date_registered"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_completion_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<tr><th></th><th></th><th><dmf:label name = "DateError" align = "right" style = "color:red;"/></th></tr>
<dmfx:docbaseattribute object="obj" attribute="bhpb_pet_procedure_owner"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
</dmf:panel>
<!-- /table -->
	<%} else { %>
<!-- END MKM CHANGE 2 of 2 -->


<dmfx:docbaseattributelist name="attrlist" object="obj" attrconfigid="attributes"/>
<% } %>
</table>
<p class="showProperties"><dmf:checkbox name='show_all' onclick='onShowAllClicked' nlsid='MSG_SHOW_ALL_PROPERTIES'/></p>
</div>
</dmf:form>
</dmf:body>
</dmf:html>
