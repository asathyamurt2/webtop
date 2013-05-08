<%@ page import="com.documentum.web.formext.component.DialogContainer"%>
<%
//
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<dmf:html>
<dmf:head>
<dmf:webform/>
<dmf:title><dmf:label nlsid='MSG_TITLE'/></dmf:title>
</dmf:head>
<dmf:body id="modal" marginheight='0' marginwidth='0'
topmargin='0' bottommargin='0' leftmargin='0' rightmargin='0'>
<dmf:form>
<dmf:paneset name="mainPaneset" rows="59,*,45" cssclass='defaultPanesetBackground'
minheight="300" minwidth="350" toppadding="0" bottompadding="0">
<dmf:pane name="headerareaPane" overflow="hidden">
<dmfx:fragment src='modal/modalContainerStart.jsp'/>
<span class="dialogTitle dialogTitleTopMargin"><dmf:label name="transtitle" />:&nbsp;
<dmf:label cssclass='doclistFolderPath' name="docbasePath"/></span>
<dmfx:fragment src='modal/modalNavbarStart.jsp'/>

<dmfx:fragment src='modal/modalNavbarEnd.jsp'/>
</dmf:pane>
<dmf:paneset name="contentareaPaneset" cols="18,*,18" cssclass="contentBackground">
<dmf:pane name="leftcolumn" overflow="hidden" printable="false">
<dmfx:fragment src='modal/modalEdgesStart.jsp'/>
</dmf:pane>
<dmf:pane name="scrollingcontent" overflow="auto">
<dmfx:fragment src='modal/modalContentGutterStart.jsp'/>
<dmfx:containerinclude/>
<dmfx:fragment src='modal/modalContentGutterEnd.jsp'/>
</dmf:pane>
<dmf:pane name="rightcolumn" overflow="hidden" printable="false">
<dmfx:fragment src='modal/modalEdgesEnd.jsp'/>
</dmf:pane>
</dmf:paneset>
<dmf:pane name="buttonareaPane" overflow="hidden">
<dmfx:fragment src='modal/modalButtonbarStart.jsp'/>
<table class="rightAlignment" border='0' cellpadding='0' cellspacing='0'>
<tr>
<td>
<dmf:button name='prev' cssclass="buttonLink" nlsid='MSG_PREV' onclick='onPrev'
height='16' tooltipnlsid='MSG_PREV_TIP'/>
</td>
<td width=5></td>
<td>
<dmf:button name='next' cssclass='buttonLink' nlsid='MSG_NEXT' onclick='onNext'
height='16' tooltipnlsid='MSG_NEXT_TIP'/>
</td>
<td width=5></td>
<td>
<dmf:button name='ok' cssclass="buttonLink" nlsid='MSG_OK' onclick='onOk'
height='16' tooltipnlsid='MSG_OK_TIP'/>
</td>
<td width=5></td>
<td>
<dmf:button name='cancel' cssclass='buttonLink' nlsid='MSG_CANCEL' onclick='onCancel'
height='16' tooltipnlsid='MSG_CANCEL_TIP'/>
</td>
<td width=5></td>
<td>
<dmf:button name='close' cssclass="buttonLink" nlsid='MSG_CLOSE' onclick='onClose'
height='16' tooltipnlsid='MSG_CLOSE_TIP'/>
</td>
</tr>
</table>
<dmfx:fragment src='modal/modalButtonbarEnd.jsp'/>
<dmfx:fragment src='modal/modalContainerEnd.jsp'/>
</dmf:pane>
</dmf:paneset>
</dmf:form>
</dmf:body>
</dmf:html>
