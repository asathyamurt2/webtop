<%
//
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ taglib uri="/WEB-INF/tlds/dmfxsearch_1_0.tld" prefix="dmfxs" %>
<%@ page import="com.documentum.web.form.Util,
com.documentum.web.formext.control.docbase.search.RepositorySearch,
com.documentum.web.formext.control.docbase.search.SearchAttribute,
com.documentum.webcomponent.library.advsearch.AdvSearchEx,
com.documentum.web.form.IParams,
com.documentum.web.form.Form,
com.documentum.web.util.JavascriptUtil"%>
<%@ page import="com.documentum.web.formext.component.DialogContainer"%>
<dmf:html>
<dmf:head>
<dmf:webform/>
<%
AdvSearchEx advsearch = (AdvSearchEx)pageContext.getAttribute(IParams.FORM,PageContext.REQUEST_SCOPE);
//
%>
<script language='JavaScript1.2' src='<%=Form.makeUrl(request, "/wdk/include/windows.js")%>'></script>
<script>
function <%=JavascriptUtil.namespaceScriptlet(request, "executeSavedSearch()")%>
{
<dmf:postserverevent handlerid='<%=advsearch.getElementName()%>' handlermethod='executeSavedSearch'/>
}
registerClientEventHandler(null, '<%=JavascriptUtil.namespaceScriptlet(request, "executeSavedSearch")%>', <%=JavascriptUtil.namespaceScriptlet(request, "executeSavedSearch")%>);
</script>
</dmf:head>
<dmf:body cssclass='contentBackground' marginheight='6' marginwidth='6'
topmargin='6' bottommargin='0' leftmargin='6' rightmargin='0'>
<dmf:form>
<dmfxs:repositorysearch name='repossearchctrl'>
<table>
<tr>
<td align=right valign=top nowrap><dmf:label nlsid='MSG_LOOKIN_LOCATION' cssclass="fieldlabel"/></td>
<dmfxs:searchlocation visible='false' name='searchlocationctrl'/>
<td align=left valign=top nowrap>
<table valign=top border=0 cellspacing=0 cellpadding=0 ><tr>
<td nowrap>
<dmf:stringlengthformatter maxlen='80' wrapped='false' postfix='...'>
<dmf:radio name='specificlocationradio' group='locationradiogroup' onclick='onLocationRadioClicked'/>
</dmf:stringlengthformatter>
</td>
<td nowrap width=20>&nbsp;</td>
<td nowrap><dmf:link name='locationlink' nlsid='MSG_CHANGE_LOCATION' onclick='onBrowseLocations'/></td>
</tr>
<tr>
<td align=left valign=top nowrap>
<dmf:stringlengthformatter maxlen='80' wrapped='false' postfix='...'>
<dmf:radio name='currentlocationradio' group='locationradiogroup' onclick='onLocationRadioClicked'/>
</dmf:stringlengthformatter>
</td>
<td colspan=2>&nbsp;</td>
</tr>
</table>
</td>
</tr>
<tr><td colspan='2' class='spacer' height='12'>&nbsp;</td></tr>
<tr>
<td align=right valign=top nowrap><dmf:label nlsid='MSG_OBJECT_TYPE' cssclass="fieldlabel"/></td>
<td align=left valign=top nowrap>
<dmfxs:searchobjecttypedropdownlist name='objecttypectrl' width='<%=SearchAttribute.DEFAULT_FIELD_WIDTH%>'/>&nbsp;&nbsp;
</td>
</tr>
<tr><td colspan='2' class='spacer' height='10'>&nbsp;</td></tr>

<tr>
<td align=right valign=top nowrap><dmf:label nlsid='MSG_PROPERTIES' cssclass="fieldlabel"/></td>
<td align=left valign=top nowrap>
<%
%>

<!-- 
	Customisation Starts:
		1. Add custom search fields
		
		2. Attributes searched by the custom search fields should be excluded from the 
		searchattributegroup control, otherwise they are automatically populated
		when the user chooses to edit their search and they had searched on any of
		these custom attributes before.
-->

<dmfxs:searchattributegroup name='attributesearchcriteria' excludetypes='time' excludenames='r_content_size,r_full_content_size,a_is_hidden,object_name,bhpb_pet_vendordoc,title,subject,keywords,bhpb_pet_tag_no,bhpb_pet_doc_function,bhpb_pet_vendor_name,bhpb_pet_vendor_detail,bhpb_pet_subvendor,bhpb_pet_contractor,bhpb_pet_po_no,bhpb_pet_po_desc,r_current_state' casevisible='false' width="160" opened="true">
</dmfxs:searchattributegroup>
</td>
</tr>
<tr><td colspan='2' class='spacer' height='10'>&nbsp;</td></tr>

<tr><td colspan='2' class='spacer' height='10'><hr></td></tr>
<!-- Doc No. Field -->
<tr>
<td align=right valign=top nowrap><dmf:label nlsid="MSG_DOCNO" cssclass="fieldlabel"/></td>
<td align=left valign=top nowrap>
<%
%>
<dmfxs:searchattribute andorvisible="false" name="docno" attribute="object_name" removable="false">
</dmfxs:searchattribute>
</td>
</tr>

<!-- Text Field -->
<tr>
<td align=right valign=top nowrap><dmf:label nlsid="MSG_TEXT" cssclass="fieldlabel"/></td>
<td align=left valign=top nowrap>
<%
%>
<dmfxs:searchattribute andorvisible="false" name="text" attribute="title" removable="false">
</dmfxs:searchattribute>
</td>
</tr>

<tr>
<td align=right valign=top nowrap><dmf:label nlsid="MSG_CONTAINING_WORDS" cssclass="fieldlabel"/></td>
<td align=left valign=top nowrap><dmfxs:searchfulltext name='fulltextctrl' size='<%=SearchAttribute.DEFAULT_FIELD_SIZE%>'/></td>
</tr>
<tr><td colspan='2' class='spacer' height='6'>&nbsp;</td></tr>

<!-- Tag No. Field -->
<tr>
<td align=right valign=top nowrap><dmf:label nlsid="MSG_TAGNO" cssclass="fieldlabel"/></td>
<td align=left valign=top nowrap>
<%
%>
<dmfxs:searchattribute andorvisible="false" name="tagno" attribute="bhpb_pet_tag_no" removable="false">
</dmfxs:searchattribute>
</td>
</tr>

<tr>
<td align=right valign=top nowrap></td>
</tr>

<tr><td colspan='2' class='spacer' height='10'>&nbsp;</td></tr>

<!-- Doc. Function Field -->
<tr>
<td align=right valign=top nowrap></td>
<td align=left valign=top nowrap>
<%
%>
<dmf:checkbox name="docfunctioncheckbox" nlsid="MSG_DOCFUNCTION" labelalign="right" onclick="onDocFunctionCheckboxClicked"/>
</td>
</tr>

<dmf:panel name='docfunctionpanel'>
<tr>
<td align=right valign=top nowrap></td>
<td align=left valign=top nowrap>
<%
%>
<dmf:multiselector name="docfunctionmultiselector" multiselect="true" listboxwidth="350"/>
</td>
</tr>
</dmf:panel>

<!-- Vendor Field -->
<tr>
<td align=right valign=top nowrap><dmf:label nlsid="MSG_VENDOR" cssclass="fieldlabel"/></td>
<td align=left valign=top nowrap>
<%
%>
<dmfxs:searchattribute andorvisible="false" name="vendor" attribute="bhpb_pet_vendor_name" removable="false">
</dmfxs:searchattribute>
</td>
</tr>

<!-- PO No. Field -->
<tr>
<td align=right valign=top nowrap><dmf:label nlsid="MSG_PO_NO" cssclass="fieldlabel"/></td>
<td align=left valign=top nowrap>
<%
%>
<dmfxs:searchattribute andorvisible="false" name="pono" attribute="bhpb_pet_po_no" removable="false">
</dmfxs:searchattribute>

<!-- Exclude Withdrawn documents from Search -->
<tr>
<td align=right valign=top nowrap></td>
<td align=left valign=top nowrap>
<%
%>
<dmf:checkbox name="excludewithdrawn" nlsid="MSG_EXCLUDE_WITHDRAWN" labelalign="right"/>
</br>
</td>
</tr>
</td>
</tr>
<tr><td colspan='2' class='spacer' height='10'><hr></td></tr>
<!-- Customisation Ends -->

<dmf:panel name='datepanel'>
<tr><td colspan='2' class='spacer' height='12'>&nbsp;</td></tr>
<tr>
<td align=right valign=top nowrap><dmf:label nlsid='MSG_DATE' cssclass="fieldlabel"/></td>
<td align=left valign=top nowrap>
<dmfxs:searchattributegroup name='datesearchcriteria' excludetypes='number,id,string,boolean' defaultattribute="r_modify_date" addvisible='false'>
<dmfxs:searchdateattribute name='dateattributes' >
</dmfxs:searchdateattribute>
</dmfxs:searchattributegroup>
</td>
</tr>
</dmf:panel>
<dmf:panel name='contentsizepanel'>
<tr><td colspan='2' class='spacer'height='10'>&nbsp;</td></tr>
<tr>
<td align=right valign=top nowrap><dmf:label nlsid='MSG_SIZE' cssclass="fieldlabel"/></td>
<td align=left valign=top nowrap>
<%
%>
<dmfxs:searchsizeattribute name='contentsizeattr' removable='false'>
</dmfxs:searchsizeattribute>
</td>
</tr>
</dmf:panel>
<dmf:panel name='additionalpanel'>
<tr><td colspan='2' class='spacer' height='10'>&nbsp;</td></tr>
<tr>
<td align=right valign=top nowrap><dmf:label nlsid='MSG_ADDTIONAL' cssclass="fieldlabel"/></td>
<td align=left valign=top nowrap>
<table align=left valign=top border=0 cellpadding=0 cellspacing=0>
<tr align=left valign=top><td align=left valign=top nowrap>
<dmfxs:searchscopecheckbox name='findhiddencheck' scopename='<%=RepositorySearch.SCOPE_FIND_HIDDEN%>' checkedvalue='true' uncheckedvalue='false' nlsid='MSG_FIND_HIDDEN' tooltipnlsid="MSG_FIND_HIDDEN" />
</td></tr>
<dmf:panel name='findversionpanel'>
<tr align=left valign=top><td align=left valign=top nowrap>
<dmfxs:searchscopecheckbox name='findversioncheck' scopename='<%=RepositorySearch.SCOPE_FIND_ALL_VERSIONS%>' checkedvalue='true' uncheckedvalue='false' nlsid='MSG_FIND_VERSIONS' tooltipnlsid="MSG_FIND_VERSIONS" />
</td></tr>
</dmf:panel>
</table>
</td>
</tr>
</dmf:panel>
</table>
</dmfxs:repositorysearch>
<dmf:panel name='searchbtnpanel'>
<br>
<table>
<tr>
<td>
<table align='left' cellspacing='4' cellpadding='0' border='0'>
<tr><td>
<dmf:helpimage onclick='onClickHelp' nlsid='MSG_HELP' runatclient='true' src="icons/help_16.gif"/>
</td></tr>
</table>
</td>
<td>
<table align='right' cellspacing='4' cellpadding='0' border='0'>
<tr>
<td>
<dmf:button name='submitsearch' cssclass='buttonLink' nlsid='MSG_SEARCH' onclick="onClickSearch" height='16' imagefolder='images/dialogbutton' default='true' tooltipnlsid="MSG_SEARCH_TIP" />
</td>
<td width=5>
</td>
<td>
<dmf:button name='clearsearch' cssclass='buttonLink' nlsid='MSG_CLEAR' onclick="onClickClear" height='16' imagefolder='images/dialogbutton' tooltipnlsid="MSG_CLEAR_TIP"/>
</td>
<td width=5>
</td>
<dmf:panel name='closepanel'>
<td>
<dmf:button name='cancelsearch' cssclass='buttonLink' nlsid='MSG_CLOSE' onclick="onCloseSearch" height='16' imagefolder='images/dialogbutton' tooltipnlsid="MSG_CLOSE_TIP"/>
</td>
<td width=5>
</td>
</dmf:panel>
</tr>
</table>
</td>
</tr>
</table>
</dmf:panel>
</dmf:form>
</dmf:body>
</dmf:html>
