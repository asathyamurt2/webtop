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
	<%} %>
<!-- END MKM CHANGE 2 of 2 -->


<dmfx:docbaseattributelist name="attrlist" object="obj" attrconfigid="attributes"/>
</table>
<p class="showProperties"><dmf:checkbox name='show_all' onclick='onShowAllClicked' nlsid='MSG_SHOW_ALL_PROPERTIES'/></p>
</div>
</dmf:form>
</dmf:body>
</dmf:html>
