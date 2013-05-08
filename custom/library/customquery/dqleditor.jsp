<!-- 
Component: Custom Query
Author: Miranda Mayle
Date: October 2009
Desc: allows custom query to be exported to csv
extended dql (not dqleditor) component (/webcomponent/admin/utilities/dqleditor.jsp) 
Other modifications to look & feel outside of start/finish comments - sorry!
 -->
<%
//
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ page import="com.documentum.fc.common.IDfAttr" %>
<%@ page import="com.documentum.web.form.Form" %>
<%@ page import="com.documentum.webcomponent.admin.utilities.DqlEditor" %>
<html>
<head>
<dmf:webform/>
<%
DqlEditor dqlEditor = (DqlEditor) pageContext.getAttribute(Form.FORM, PageContext.REQUEST_SCOPE);
%>
<title><dmf:label nlsid="MSG_TITLE"/></title>
</head>
<body class='contentBackground' topmargin='10' bottommargin='10'
leftmargin='10' rightmargin='0' marginheight='10' marginwidth='10'>
<div id='content' class='content' >
<dmf:form>
<table border=0 bordercolor='blue' cellspacing=8 cellpadding=0>
<tr>
<td scope="row" colspan='2'>
<dmf:label cssclass='webcomponentTitle' nlsid="MSG_TITLE"/>
</td>
<tr>
<td colspan='2'>
<dmf:textarea style='font-family:Courier New,Courier;font-size:11px' name='<%=DqlEditor.CONTROL_DQL%>' rows='3' cols='90' tooltipnlsid="MSG_TITLE"/>
</td>
</tr>
<tr>
<td colspan='2'>
<!--MKM 2/10/09 - export mod -->
<table width="100%" cellpadding="0" cellspacing="0" border="0" bordercolor="yellow">
<tr>
	<td align="left">
		<dmf:button default='true' nlsid='MSG_EXECUTE' onclick="onClickExecute" tooltipnlsid='MSG_EXECUTE'/>
		<dmf:panel name='<%=DqlEditor.SQL_PANEL%>'>
		&nbsp; <dmf:checkbox name='<%=DqlEditor.SQL_CHECKBOX%>' nlsid='MSG_SHOW_SQL' labelalign='right' visible='false'/>
		</dmf:panel>
		&nbsp;&nbsp;&nbsp;
		<dmf:button name="CLOSE_BUTTON" nlsid='MSG_CLOSE' onclick="onClickClose" tooltipnlsid='MSG_CLOSE'/>
	</td>
	
	<td align="right">
	<dmfx:actionbutton name="EXPORT_BUTTON" nlsid='MSG_EXPORT' action="exporttocsv" tooltipnlsid='MSG_EXPORT'/>
	</td>
</tr>
</table>
<br/>
<!--MKM END-->
</td>
</tr>
<dmf:panel name='<%=DqlEditor.SQL_RESULT_PANEL%>'>
<tr>
<td scope="row" colspan='2'>
<dmf:textarea style='font-family:Courier New,Courier;font-size:11px' name='<%=DqlEditor.SQL_RESULT%>' rows='5' cols='90' tooltipnlsid="MSG_RESULTS" />
</td>
</tr>
</dmf:panel>
</table>

<dmf:panel name='<%=DqlEditor.RESULTS_PANEL%>'>
<dmf:datagrid name='<%=DqlEditor.CONTROL_GRID%>' paged='true' preservesort='false' cssclass='doclistbodyDatagrid' width='100%' cellspacing='0' cellpadding='0' bordersize='0'>
	<tr class='headerBackground'>
	<td colspan='100'>
	
		<table width='100%' cellspacing=0 cellpadding=0 border=0 bordercolor='red'>
		<tr>
		<td class="leftAlignment">
		<dmf:label name='header' nlsid= 'MSG_RESULTS' cssclass='webcomponentTitle'/>
		</td>
		</tr>
		</table>
	
	</td>
	</tr>
	<tr class=pagerBackground>
	<td colspan='100' class="leftAlignment" height='24'>
	
		<table border=0 cellspacing=0 cellpadding=0 nowrap bordercolor='green'align='left'>
		<tr>
			<td class="leftAlignment" width="200">
			<dmf:datapaging name='pager1' gotopageclass='doclistPager'/>
			</td>
			<td width="330">&nbsp;</td>
			<td class="leftAlignment" nowrap><dmf:label nlsid='MSG_SHOW_ITEMS'/>&nbsp;</td>
			<td valign="left" nowrap><dmf:datapagesize name='sizer' preference='application.display.classic' tooltipnlsid='MSG_SHOW_ITEMS'/>
			</td>
		</tr>
		</table>
	
	</td>
	</tr>
	<tr>
	<%for(int index =0; index < dqlEditor.getAttributeCount(); index++)
	{%>
	<th class="leftAlignment" scope='col' nowrap>&nbsp;
	<dmf:datasortlink name='<%=dqlEditor.getColumnLabelControlName(index)%>' label='<%=dqlEditor.getColumnLabel(index)%>' column='<%=dqlEditor.getColumnLabel(index)%>' cssclass='doclistbodyDatasortlink'/>
	&nbsp;</th>
	<%}%>
	</tr>
	<tr height='1' class='doclistbodySeparator'>
	<td colspan='50' class='rowSeparator'><dmf:image src='images/space.gif' width='1' height='1'/></td>
	</tr>
	<dmf:datagridRow>
	<%for(int index =0; index < dqlEditor.getAttributeCount(); index++)
	{%>
	<td class="leftAlignment" valign="top" scope='row'>
	<%if (dqlEditor.getColumnType(index) == IDfAttr.DM_TIME)
	{
	%>
	<dmf:datevalueformatter>
	<dmf:label datafield='<%=dqlEditor.getColumnLabel(index)%>'/>
	</dmf:datevalueformatter>
	<%
	}
	else
	{%>
	<dmf:label datafield='<%=dqlEditor.getColumnLabel(index)%>'/>
	<%}%>
	&nbsp;
	</td>
	<%}%>
	<tr height='1' class='doclistbodySeparator'>
	<td colspan='50' class='rowSeparator'><dmf:image src='images/space.gif' width='1' height='1'/></td>
	</dmf:datagridRow>
	<dmf:nodataRow>
	<td colspan=20 height=24>
	<dmf:label nlsid='MSG_NOROWS' cssclass='doclistFolderPath'/>
	</td>
	</dmf:nodataRow>
</dmf:datagrid>
</dmf:panel>
<dmf:panel name='<%=DqlEditor.ERROR_PANEL%>'>
<dmf:label name='<%=DqlEditor.ERROR_LABEL%>'/>
</dmf:panel>
<dmf:panel name='<%=DqlEditor.OUTPUT_PANEL%>'>
<dmf:label name='<%=DqlEditor.OUTPUT_LABEL%>'/>
</dmf:panel>
</dmf:form>
</div>
</body>
</html>
