<%
//
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ page import="com.documentum.webcomponent.library.properties.Properties,
com.documentum.web.formext.component.DialogContainer"%>
<dmf:html>
<dmf:head>
<dmf:webform validation="true"/>
<dmf:title><dmf:label nlsid='MSG_TITLE'/> &nbsp;<dmf:label nlsid='MSG_OBJECT'/></dmf:title>
<script>
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
</script>
</dmf:head>
<dmf:body id="modal" marginheight='0' marginwidth='0'
topmargin='0' bottommargin='0' leftmargin='0' rightmargin='0'>
<dmf:form>
<dmf:hidden name = "DateValue" id = "DateValue" />
<dmf:paneset name="mainPaneset" rows="59,*,45" cssclass='defaultPanesetBackground'
minheight="300" minwidth="350" toppadding="0" bottompadding="0">
<dmf:pane name="headerareaPane" overflow="hidden">
<dmfx:fragment src='modal/modalContainerStart.jsp' />
<dmfx:clientenvpanel environment="portal" reversevisible="true">
<dmf:label nlsid='MSG_TITLE' cssclass='webcomponentTitle'/>
</dmfx:clientenvpanel>
<dmfx:fragment src='modal/modalTabbarStart.jsp'/>
<dmf:tabbar name='tabs' align='left' tabposition='top' onclick='onTabSelected' scrollable='true'/>
<dmfx:fragment src='modal/modalTabbarEnd.jsp'/>
</dmf:pane>
<dmf:paneset name="contentareaPaneset" cols="18,*,18" cssclass="contentBackground">
<dmf:pane name="leftcolumn" overflow="hidden" printable="false">
<dmfx:fragment src='modal/modalEdgesStart.jsp'/>
</dmf:pane>
<dmf:pane name="scrollingcontent" overflow="auto">
<dmfx:fragment src='modal/modalContentGutterStart.jsp' />
<table cellspacing="0" cellpadding="0" border="0" class="contentBackground">
<tr>
<td rowspan="3" valign="top"><dmfx:docbaseicon size='32' name="icon"/></td>
<td rowspan="3" class="spacer" nowrap width="10">&nbsp;</td>
<td class="modalsubhead" valign="top"><span class="propertiestitle"><dmf:label name='object_name' /></span><span class="bookmarklink"><dmf:bookmarklink name="bookmark"/></span></td>
</tr>
<tr>
<td class="modalsubhead" valign="top"><dmf:label nlsid='MSG_OBJ_TYPE' />&nbsp;<dmf:label name='r_object_type'/></td>
</tr>
<tr>
<td class="modalsubhead" valign="top">
<dmf:label nlsid='MSG_CONTENT_TYPE' />&nbsp;<dmf:label name='a_content_type'/>
<br><br><dmf:label name='error_msg' visible="false" style="color:red" cssclass="validatorMessageStyle"/>
<br><dmf:label name='DateError' style="color:red" cssclass="validatorMessageStyle"/>
<dmf:panel name='<%=Properties.LAST_REFRESHED_PANEL%>'>
<br><dmf:label nlsid='MSG_LAST_REFRESHED' />&nbsp;
<dmf:datevalueformatter>
<dmf:label name='r_last_refresh'/>
</dmf:datevalueformatter>
</dmf:panel>
<dmf:panel name='<%=Properties.GOTO_TARGET_PANEL%>'>
<br><dmf:link name='gototargetlink' nlsid='MSG_GOTO_TARGET' onclick='onGotoTargetClick'/>
</dmf:panel>
</td>
</tr>
</table>
<dmf:panel name='<%=Properties.THUMBNAIL_PANEL%>'>
<dmfx:thumbnail name='thumbnail'/>
</dmf:panel>
<dmfx:containerinclude/>
<dmfx:fragment src='modal/modalContentGutterEnd.jsp' />
</dmf:pane>
<dmf:pane name="rightcolumn" overflow="hidden" printable="false">
<dmfx:fragment src='modal/modalEdgesEnd.jsp' />
</dmf:pane>
</dmf:paneset>
<dmf:pane name="buttonareaPane" overflow="hidden">
<dmfx:fragment src='modal/modalButtonbarStart.jsp'/>
<dmf:button name='ok' cssclass="buttonLink" nlsid='MSG_OK' onclick='onOk' hotkeyid='HOTKEY_OK'
height='16' tooltipnlsid='MSG_OK_TIP'/>
<dmf:button name='cancel' cssclass='buttonLink' nlsid='MSG_CANCEL' onclick='onCancel' hotkeyid='HOTKEY_CANCEL'
height='16' tooltipnlsid='MSG_CANCEL_TIP'/>
<dmfx:fragment src='modal/modalButtonbarEnd.jsp' />
<dmfx:fragment src='modal/modalContainerEnd.jsp' />
</dmf:pane>
</dmf:paneset>
</dmf:form>
</dmf:body>
</dmf:html>
