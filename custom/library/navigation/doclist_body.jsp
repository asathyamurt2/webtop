<%@ page import="com.documentum.webcomponent.navigation.doclist.DocList,
com.documentum.web.dragdrop.IDropTarget"%>
<%@ page import="com.documentum.web.common.AccessibilityService"%>
<%--
--%>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<dmfx:dragdrop/>
<dmfx:actionmultiselect name='multi'>
<dmfx:argument name='objectId' contextvalue='objectId'/>
<dmfx:argument name='type' contextvalue='type'/>
<dmfx:argument name='folderId' contextvalue='folderId'/>
<dmfx:argument name='folderPath' contextvalue='folderPath'/>
<dmf:argument name='startworkflowId' value='startworkflow'/>
<dmfx:dragdropregion name='namedtopdragdropregion' enableddroppositions="<%=IDropTarget.DROP_POSITION_OVER%>" ondrop='onDrop' isbackground='true'>
<dmfx:argument name='objectId' contextvalue='objectId'/>
<dmf:datagrid name='<%=DocList.CONTROL_GRID%>' paged='true' preservesort='false'
width="100%" cellspacing='0' cellpadding='0' bordersize='0' rowselection="true" fixedheaders="true" focus="true">
<dmf:panel name='<%=DocList.CONTROL_HEADER_PANEL%>'>
<tr>
<td colspan="23" class="headerBackground">
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td class="leftAlignment" colspan="2">
<dmf:breadcrumb name='<%=DocList.CONTROL_BREADCRUMB%>' cssclass='webcomponentBreadcrumb' onclick='onClickFolderPath'/>
</td>
</tr>
<tr>
<td class="leftAlignment">
<div class='webcomponentBreadcrumbTitle'><dmf:noopformatter><dmf:label name='<%=DocList.CONTROL_TITLE%>' cssclass='webcomponentTitle'/></dmf:noopformatter></div><div class="bookmarkicon"><dmf:bookmarklink name='<%=DocList.CONTROL_BOOKMARK%>' /></div>
</td>
<td>
<table class="floatRightAlignment" cellspacing='0' cellpadding='0' border='0'>
<tr>
<td class="rightAlignment" nowrap>
<dmf:datacolumnbeginswith name='namecolumnbeginswith' column='object_name' autocompleteid='ac_namecolumnbeginswith' size="24" nlsid="MSG_BEGINSWITH_FILTER"/>
</td>
<td width="5" nowrap class="spacer">&nbsp;</td>
<td class="rightAlignment" nowrap>
<dmf:dropdownlist name='<%=DocList.CONTROL_FILTER%>' onselect='onSelectTypeFilter' tooltipnlsid="MSG_FILE_FILTER">
</dmf:dropdownlist>
</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
<dmf:panel name='<%=DocList.BANNER_BACKGROUND_CONTROL%>'>
<tr class="bannerBackground">
<td colspan="23">
<dmfx:bannerbox>
<dmfx:roombanner name='<%=DocList.BANNER_CONTROL%>' height='36px'/>
<dmfx:richtextpanel>
<%--
PLEASE LEAVE THIS STYLE INLINE. on IE7 the expression doesn't work from a .css file and
max-height doesn't work in quirks mode, and not at all in IE6.
--%>
<div id="description" style="max-height: 150px;overflow: auto;height:expression(this.scrollHeight > 150 ? '150px' : 'auto');">
<dmfx:richtextdisplay name='<%=DocList.FOLDER_DESCRIPTION%>'/>
</div>
</dmfx:richtextpanel>
</dmfx:bannerbox>
</td>
</tr>
</dmf:panel>
<tr>
<td colspan="23" height="24" class="pagerBackground">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr >
<td nowrap class="leftAlignment" style="padding-left:3px;"><dmf:button name='<%=DocList.CONTROL_BUTTON_THUMBNAILS%>' onclick='onClickThumbnails' src="images/titlebar/btn_thumbnail_off.gif" srcdisabled="images/titlebar/btn_thumbnail.gif" tooltipnlsid='MSG_THUMBNAILS'/></td>
<td><dmf:button name='<%=DocList.CONTROL_BUTTON_DETAILS%>' onclick='onClickDetails' src="images/titlebar/btn_list_off.gif" srcdisabled="images/titlebar/btn_list.gif" tooltipnlsid='MSG_DETAILS'/></td>
<td align="center" width="100%"><dmf:datapaging name='pager1' gotopageclass='doclistPager'/></td>
<td class="rightAlignment" nowrap valign="middle"><dmf:label nlsid='MSG_SHOW_ITEMS'/>&nbsp;</td>
<td valign="middle" nowrap><dmf:datapagesize name='sizer' preference='application.display.classic' tooltipnlsid='MSG_SHOW_ITEMS'/>&nbsp;</td>
</tr>
</table>
</td>
</tr>
<tr>
<td colspan="23" height="1" class="spacer"></td>
</tr>
</dmf:panel>
<%
if (AccessibilityService.isAllAccessibilitiesEnabled())
{
%>
<table width=100% border=0 cellspacing=0 cellpadding=0 summary='Data'>
<%
}
%>
<tr class='colHeaderBackground'>
<dmf:datagridTh scope='col' nowrap="true" cssclass='doclistcheckbox leftAlignment'>
<dmfx:actionmultiselectcheckall name='checkall' cssclass='doclistbodyDatasortlink'>
<dmfx:argument name='objectId' contextvalue='objectId'/>
<dmfx:argument name='type' contextvalue='type'/>
<dmfx:argument name='folderId' contextvalue='folderId'/>
</dmfx:actionmultiselectcheckall>
</dmf:datagridTh>
<dmf:datagridTh scope='col' nowrap="true" cssclass='doclistlocicon leftAlignment'>
<dmf:datasortimage name='sortimg' datafield='r_lock_owner' cssclass='doclistbodyDatasortlink' reversesort='true' image='icons/sort/sortByLock.gif'/>
</dmf:datagridTh>
<dmf:celllist>
<dmf:celltemplate field='object_name'>
<dmf:datagridTh scope='col' nowrap="true" cssclass='doclistfilenamedatagrid objectlistheaderspacing leftAlignment' resizable="true">
<nobr><dmf:datasortlink name='sort1' datafield='object_name' cssclass='doclistbodyDatasortlink'/></nobr>
</dmf:datagridTh>
<dmf:datagridRowModifier>
<dmf:datagridTh scope='col' align='center' nowrap="true" cssclass='spacer'>
<dmf:image name='prop' nlsid='MSG_PROPERTIES'  src='images/space.gif'/>
</dmf:datagridTh>
</dmf:datagridRowModifier>
</dmf:celltemplate>
<dmf:celltemplate field='attachment_count'>
<dmf:datagridTh scope='col' align='center' cssclass='doclisticon'>
<dmf:datasortimage name='attachmentcount' datafield='attachment_count' cssclass='doclistbodyDatasortlink'
image='icons/indicator/Attachmentheader_16.gif'/>
</dmf:datagridTh>
</dmf:celltemplate>
<dmf:celltemplate field="attachment">
<dmf:datagridTh scope='col' align='center' cssclass='doclisticon'>
<dmf:datasortimage name='sortattachment' datafield='attachment' cssclass='doclistbodyDatasortlink'
image='icons/sort/sortByAttachment.gif'/>
</dmf:datagridTh>
</dmf:celltemplate>
<dmf:celltemplate field="event_type">
<dmf:datagridTh scope='col' align='center' cssclass='doclisticon'>
<dmf:image src="icons/sort/sortByRecurrence.gif" nlsid="MSG_EVENT_TYPE"/>
</dmf:datagridTh>
</dmf:celltemplate>
<dmf:celltemplate field="event_organizer">
<dmf:datagridTh scope='col' cssclass='doclistfilenamedatagrid leftAlignment' resizable="true">
<nobr><dmf:datasortlink name='sorteventorganizer' datafield='event_organizer' cssclass='doclistbodyDatasortlink'/></nobr>
</dmf:datagridTh>
</dmf:celltemplate>
<dmf:celltemplate field='topic_status'>
<dmf:datagridTh scope='col' cssclass='doclisticon leftAlignment'>
<dmf:datasortimage name='sorttopic' datafield='topic_status' cssclass='doclistbodyDatasortlink'
image='icons/sort/sortByDisc.gif'/>
</dmf:datagridTh>
</dmf:celltemplate>
<dmf:celltemplate field='room_status'>
<dmf:datagridTh scope='col' align='center' cssclass='doclisticon'>
<dmf:datasortimage name='sortroom' datafield='room_status' cssclass='doclistbodyDatasortlink'
image='icons/sort/sortByRoom.gif'/>
</dmf:datagridTh>
</dmf:celltemplate>
<dmf:celltemplate field='title'>
<dmf:datagridTh scope='col' cssclass='doclistfilenamedatagrid leftAlignment' resizable="true">
<nobr><dmf:datasortlink name='sort2' datafield='title' cssclass='doclistbodyDatasortlink'/></nobr>
</dmf:datagridTh>
</dmf:celltemplate>
<dmf:celltemplate field='authors'>
<dmf:datagridTh scope='col' cssclass='doclistfilenamedatagrid leftAlignment' resizable="true">
<nobr><dmf:datasortlink name='sort3' datafield='authors' cssclass='doclistbodyDatasortlink'/></nobr>
</dmf:datagridTh>
</dmf:celltemplate>
<dmf:celltemplate type='number'>
<dmf:datagridTh scope='col' cssclass='doclistfilenamedatagrid rightAlignment' resizable="true">
<nobr><dmf:datasortlink name='sort4' datafield='CURRENT' mode='numeric' cssclass='doclistbodyDatasortlink'/></nobr>
</dmf:datagridTh>
</dmf:celltemplate>
<dmf:celltemplate type='date'>
<dmf:datagridTh scope='col' cssclass='doclistfilenamedatagrid leftAlignment' resizable="true">
<nobr><dmf:datasortlink name='sort5' datafield='CURRENT' mode='numeric' cssclass='doclistbodyDatasortlink'/></nobr>
</dmf:datagridTh>
</dmf:celltemplate>
<dmf:celltemplate>
<dmf:datagridTh scope='col' cssclass='doclistfilenamedatagrid leftAlignment' resizable="true">
<nobr><dmf:datasortlink name='sort6' datafield='CURRENT' cssclass='doclistbodyDatasortlink'/></nobr>
</dmf:datagridTh>
</dmf:celltemplate>
</dmf:celllist>
<dmf:datagridTh valign="middle" cssclass="doclisticon">
<dmf:image src="icons/columnprefs_16.gif" nlsid="MSG_COLUMN_PREFERENCES" onclick="onClickColumnsPrefs">
<dmf:argument name="usemodalpopup" value="true"/>
<dmf:argument name="modalpopupwindowsize" value="large"/>
<dmf:argument name="refreshparentwindow" value="onok"/>
</dmf:image>
</dmf:datagridTh>
<dmf:datagridTh width="99%">&nbsp;</dmf:datagridTh>
</tr>
<dmf:datagridRow tooltipdatafield='object_name' cssclass='defaultDatagridRowStyle' altclass="defaultDatagridRowAltStyle">
<dmf:datagridRowTd height="24" nowrap="true" cssclass="doclistcheckbox">
<dmfx:actionmultiselectcheckbox name='check' value='false' cssclass='actions'>
<dmf:argument name='objectId' datafield='r_object_id'/>
<dmf:argument name='type' datafield='r_object_type'/>
<dmf:argument name='lockOwner' datafield='r_lock_owner'/>
<dmfx:argument name='folderId' contextvalue='objectId'/>
<dmfx:argument name='folderPath' contextvalue='folderPath'/>
<dmf:argument name='ownerName' datafield='owner_name'/>
<dmf:argument name='contentSize' datafield='r_content_size'/>
<dmf:argument name='contentType' datafield='a_content_type'/>
<dmf:argument name="isVirtualDoc" datafield='r_is_virtual_doc'/>
<dmf:argument name="linkCount" datafield='r_link_cnt'/>
<dmf:argument name='startworkflowId' value='startworkflow'/>
<dmf:argument name='workflowRuntimeState' value='-1'/>
<dmf:argument name='isReference' datafield='i_is_reference'/>
<dmf:argument name='isReplica' datafield='i_is_replica'/>
<dmf:argument name='assembledFromId' datafield='r_assembled_from_id'/>
<dmf:argument name='isFrozenAssembly' datafield='r_has_frzn_assembly'/>
<dmf:argument name='compoundArchitecture' datafield='a_compound_architecture'/>
<dmf:argument name='roomId' datafield='room_status'/>
<dmf:argument name='topicStatus' datafield='topic_status'/>
<dmf:argument name='attach' datafield='attachment'/>
<dmf:argument name='eventType' datafield='event_type'/>
<dmf:argument name='events' datafield='events'/>
<dmf:argument name='notificationStatus' datafield='notification_status'/>
</dmfx:actionmultiselectcheckbox>
</dmf:datagridRowTd>
<dmf:datagridRowTd nowrap="true" cssclass="doclistlocicon" style="width:18px">
<dmfx:docbaselockicon datafield='r_lock_owner' size='16'/>
</dmf:datagridRowTd>
<dmf:celllist>
<dmf:celltemplate field='object_name'>
<dmf:datagridRowTd nowrap="true" scope='row' cssclass='doclistfilenamedatagrid'>
<dmf:stringlengthformatter maxlen='32'>
<dmfx:dragdropregion datafield='object_name' enableddroppositions="<%=IDropTarget.DROP_POSITION_OVER%>" ondrop='onDrop' dragenabled='true'>
<dmf:argument name='objectId' datafield='r_object_id'/>
<dmfx:argument name='parentObjectId' contextvalue='objectId'/>
<dmf:argument name='lockOwner' datafield='r_lock_owner'/>
<!--MKM added folder id to docbaseicon for link image-->
<dmfx:docbaseicon formatdatafield='a_content_type' typedatafield='r_object_type' linkcntdatafield='r_link_cnt' isvirtualdocdatafield='r_is_virtual_doc' assembledfromdatafield='r_assembled_from_id' isfrozenassemblydatafield='r_has_frzn_assembly' isreplicadatafield='i_is_replica' isreferencedatafield='i_is_reference' folderiddatafield='i_folder_id' size='16'/>
<dmf:datagridRowEvent eventname="dblclick">
<dmf:link onclick='onClickObject' name='objectLink' runatclient='true' datafield='object_name'>
<dmf:argument name='id' datafield='r_object_id'/>
<dmf:argument name='type' datafield='r_object_type'/>
<dmf:argument name='isFolder' datafield='isfolder'/>
<dmf:argument name="isVirtualDoc" datafield='r_is_virtual_doc'/>
<dmf:argument name='assembledFromId' datafield='r_assembled_from_id'/>
<dmf:argument name="linkCount" datafield='r_link_cnt'/>
</dmf:link>
</dmf:datagridRowEvent>
</dmfx:dragdropregion>
</dmf:stringlengthformatter>
</dmf:datagridRowTd>
<dmf:datagridRowModifier>
<dmf:datagridRowTd align="center" valign="middle">
<dmfx:actionimage name='propact' nlsid='MSG_PROPERTIES' action='properties'
src='icons/info.gif' showifdisabled='false'>
<dmf:argument name='objectId' datafield='r_object_id'/>
<dmf:argument name='type' datafield='r_object_type'/>
</dmfx:actionimage>
</dmf:datagridRowTd>
</dmf:datagridRowModifier>
</dmf:celltemplate>
<dmf:celltemplate field="attachment_count">
<dmf:datagridRowTd nowrap="true" cssclass='doclisticon'>
<dmf:msgattachmenticon>
<dmf:argument name='attachmentcount' datafield='attachment_count'/>
</dmf:msgattachmenticon>
</dmf:datagridRowTd>
</dmf:celltemplate>
<dmf:celltemplate field="attachment">
<dmf:datagridRowTd cssclass='doclisticon'>
<dmfx:attachmenticon name="attachment" nlsid='MSG_NO_ATTACHMENT' src="icons/none.gif" height='16' width='16'>
<dmf:argument name='objectId' datafield='r_object_id'/>
<dmf:argument name='type' datafield='r_object_type'/>
<dmf:argument name='attach' datafield='attachment'/>
</dmfx:attachmenticon>
</dmf:datagridRowTd>
</dmf:celltemplate>
<dmf:celltemplate field="event_type">
<dmf:datagridRowTd cssclass='doclisticon' align="center">
<dmfx:calendareventtypeicon name="eventtype" nlsid='NO_EXCEPTION' src="icons/none.gif" height='16' width='16'/>
</dmf:datagridRowTd>
</dmf:celltemplate>
<dmf:celltemplate field="event_organizer">
<dmf:datagridRowTd cssclass='doclistfilenamedatagrid'>
<dmfx:objectidformatter datafield="event_organizer">
<dmf:label datafield='CURRENT'/>
</dmfx:objectidformatter>
</dmf:datagridRowTd>
</dmf:celltemplate>
<dmf:celltemplate field="topic_status">
<dmf:datagridRowTd cssclass='doclisticon'>
<dmfx:topicstatus name='status'  nlsid='MSG_NO_COMMENTS' action='showtopicaction'  src='icons/none.gif' height='16' width='16' showifdisabled='false' >
<dmf:argument name='objectId' datafield='r_object_id'/>
<dmf:argument name='type' datafield='r_object_type'/>
<dmf:argument name='topicStatus' datafield='topic_status'/>
<dmfx:argument name='folderId' contextvalue='objectId'/>
</dmfx:topicstatus>
</dmf:datagridRowTd>
</dmf:celltemplate>
<dmf:celltemplate field='room_status' >
<dmf:datagridRowTd cssclass='doclisticon'>
<dmfx:governedicon name='room' action='view' src='icons/none.gif' height='16' width='16'  >
<dmf:argument name='objectId' datafield='r_object_id'/>
<dmf:argument name='governing' datafield='room_status'/>
<dmf:argument name='type' value='dmc_room'/>
<dmfx:argument name='folderId' contextvalue='objectId'/>
</dmfx:governedicon>
</dmf:datagridRowTd>
</dmf:celltemplate>
<dmf:celltemplate field='title'>
<dmf:datagridRowTd cssclass='doclistfilenamedatagrid'>
<dmf:stringlengthformatter maxlen='14'>
<dmf:label datafield='title'/>
</dmf:stringlengthformatter>
</dmf:datagridRowTd>
</dmf:celltemplate>
<dmf:celltemplate field='authors'>
<dmf:datagridRowTd cssclass='doclistfilenamedatagrid'>
<dmf:label datafield='authors'/>
</dmf:datagridRowTd>
</dmf:celltemplate>
<dmf:celltemplate field='r_version_label'>
<dmf:datagridRowTd cssclass='doclistfilenamedatagrid'>
<dmfx:folderexclusionformatter datafield='r_object_type'>
<dmf:htmlsafetextformatter>
<dmf:label datafield='r_version_label'/>
</dmf:htmlsafetextformatter>
</dmfx:folderexclusionformatter>
</dmf:datagridRowTd>
</dmf:celltemplate>
<dmf:celltemplate field='a_content_type'>
<dmf:datagridRowTd nowrap="true" cssclass='doclistfilenamedatagrid'>
<dmf:stringlengthformatter maxlen='14'>
<dmfx:docformatvalueformatter>
<dmf:label datafield='CURRENT'/>
</dmfx:docformatvalueformatter>
</dmf:stringlengthformatter>
</dmf:datagridRowTd>
</dmf:celltemplate>
<dmf:celltemplate field='r_content_size'>
<dmf:datagridRowTd nowrap="true" cssclass='doclistfilenamedatagrid rightAlignment'>
<dmfx:docsizevalueformatter datafield='r_object_type'>
<bdo dir= "ltr">
<dmf:label datafield='r_content_size'/>
</bdo>
</dmfx:docsizevalueformatter>
</dmf:datagridRowTd>
</dmf:celltemplate>
<dmf:celltemplate field='r_current_state'>
<dmf:datagridRowTd nowrap="true" cssclass='doclistfilenamedatagrid'>
<dmfx:policystatenameformatter datafield='r_policy_id'>
<dmf:label datafield='r_current_state'/>
</dmfx:policystatenameformatter>
</dmf:datagridRowTd>
</dmf:celltemplate>
<dmf:celltemplate type='date'>
<dmf:datagridRowTd nowrap="true" cssclass='doclistfilenamedatagrid'>
<dmf:datevalueformatter>
<dmf:label datafield='CURRENT'/>
</dmf:datevalueformatter>
</dmf:datagridRowTd>
</dmf:celltemplate>
<dmf:celltemplate field='message_importance'>
<dmf:datagridRowTd nowrap="true" cssclass='doclistfilenamedatagrid'>
<dmf:messageimportanceformatter lownlsid="MSG_IMPORTANCE_LOW" normalnlsid="MSG_IMPORTANCE_NORMAL"  hinlsid="MSG_IMPORTANCE_HIGH">
<dmf:label datafield='message_importance'/>
</dmf:messageimportanceformatter>
</dmf:datagridRowTd>
</dmf:celltemplate>
<dmf:celltemplate field='from_addr'>
<dmf:datagridRowTd nowrap="false" cssclass='doclistfilenamedatagrid'>
<dmf:messageaddressformatter datafield='from_addr'>
<dmf:argument name='objectId' datafield='r_object_id'/>
<dmf:argument name='FromToCC' value="From"/>
</dmf:messageaddressformatter>
</dmf:datagridRowTd>
</dmf:celltemplate>
<dmf:celltemplate field='to_addr'>
<dmf:datagridRowTd nowrap="false" cssclass='doclistfilenamedatagrid'>
<dmf:messageaddressformatter datafield='to_addr'>
<dmf:argument name='objectId' datafield='r_object_id'/>
<dmf:argument name='FromToCC' value="To"/>
</dmf:messageaddressformatter>
</dmf:datagridRowTd>
</dmf:celltemplate>
<dmf:celltemplate field='cc_addr'>
<dmf:datagridRowTd nowrap="false" cssclass='doclistfilenamedatagrid'>
<dmf:messageaddressformatter datafield='cc_addr'>
<dmf:argument name='objectId' datafield='r_object_id'/>
<dmf:argument name='FromToCC' value="cc"/>
</dmf:messageaddressformatter>
</dmf:datagridRowTd>
</dmf:celltemplate>
<dmf:celltemplate>
<dmf:datagridRowTd nowrap="true" cssclass='doclistfilenamedatagrid'>
<dmf:label datafield='CURRENT'/>
</dmf:datagridRowTd>
</dmf:celltemplate>
</dmf:celllist>
<dmf:datagridRowTd>&nbsp;</dmf:datagridRowTd>
<dmf:datagridRowTd width="99%">&nbsp;</dmf:datagridRowTd>
<dmf:datagridFooter>
<table cellspacing='0' cellpadding='0' border='0'>
<tr>
<td>
<dmfx:topicpanel>
<dmfx:componentinclude name='showtopic' component='embeddedtopic'>
<dmfx:argument name="objectId" contextvalue='objectId'/>
</dmfx:componentinclude>
</dmfx:topicpanel>
</td>
</tr>
</table>
</dmf:datagridFooter>
</dmf:datagridRow>
<dmf:nodataRow>
<td colspan="23" height="24">
<dmf:label nlsid='MSG_NO_DOCUMENTS'/>
</td>
<dmf:datagridFooter>
<table cellspacing='0' cellpadding='0' border='0'>
<tr>
<td>
<dmfx:topicpanel>
<dmfx:componentinclude name='showtopic' component='embeddedtopic'>
<dmfx:argument name="objectId" contextvalue='objectId'/>
</dmfx:componentinclude>
</dmfx:topicpanel>
</td>
</tr>
</table>
</dmf:datagridFooter>
</dmf:nodataRow>
<dmf:hidden name='<%=DocList.CONTROL_FOLDERPATH%>' encrypt='true'/>
<%
if (AccessibilityService.isAllAccessibilitiesEnabled())
{
%>
</table>
<%
}
%>
</dmf:datagrid>
</dmfx:dragdropregion>
</dmfx:actionmultiselect>
