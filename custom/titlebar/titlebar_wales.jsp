<%@ page import="com.documentum.webtop.webcomponent.main.MainEx" %>
<%@ page import="com.documentum.web.common.LocaleService" %>
<%@ page import="com.documentum.webtop.app.AppSessionContext" %>
<%
//
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ page import="com.documentum.nls.NlsResourceBundle" %>
<%@ page import="java.util.Locale" %>
<%@ page import="com.documentum.webtop.webcomponent.main.Main" %>
<html>
<head>
<dmf:webform/>
<script type="text/javascript">
<%
String triangle = "&#x25BC;";
NlsResourceBundle nlsResourceBundle =
new NlsResourceBundle("com.documentum.webtop.webcomponent.titlebar.TitleBarNlsProp");
Locale locale = LocaleService.getLocale();
String strSearch = nlsResourceBundle.getString("MSG_GO", locale);
%>
var isMac = (navigator.platform.toLowerCase().indexOf("mac") != -1)
keyValueToLaunchEditor = "ctrlKeyPressed";
if (g_clientInfo.isPlatform(ClientInfo.MACOS))
{
keyValueToLaunchEditor = "shiftKeyPressed";
}
else if (g_clientInfo.isBrowser(ClientInfo.NETSCAPE))
{
keyValueToLaunchEditor = "altKeyPressed";
}
registerClientEventHandler(null, "onClickLogoEvent", onClickLogoEvent);
function onClickLink ()
{
postComponentPageEvent(null, "titlebar", "titlebar");
}
function onClickAdvancedSearch ()
{
var contentPage = eval(getAbsoluteFramePath("content"));
if (contentPage != null)
{
try
{
beginModalPopupMode("content", null, "advancedsearch", "onok");
}
catch(e)
{
}
var textField = document.getElementById("txtSearch");
var strValue = textField.value;
if (strValue != "" && strValue != "<%=strSearch %>")
{
textField.value = "";
postComponentNestEvent(null, "advsearchcontainer", "content", "component", "advsearch", "usepreviousinput", "false", "query", strValue);
}
else
{
postComponentNestEvent(null, "advsearchcontainer", "content", "component", "advsearch", "usepreviousinput", "true");
}
}
}
function onClickSearch_orig ()
{
var contentPage = eval(getAbsoluteFramePath("content"));
if (contentPage != null)
{
var text = document.getElementById("txtSearch");
callBlur(text);
var strValue = text.value;
if (strValue != "" && strValue != "<%=strSearch %>")
{
postComponentJumpEvent(null, "search", "content", "query", strValue);
if (typeof text.autoComplete != "undefined" && text.autoComplete != null)
{
// add the search string to client-side's auto-complete suggestions
text.autoComplete.addEntry(strValue);
var prefs = InlineRequestEngine.getPreferences(InlineRequestType.JSON);
prefs.setCallback("onUpdateACCallBack");
postInlineServerEvent(null, prefs, null, null, "onUpdateAutoCompleteData", null, null);
}
}
}
}

<!--MKM 30/11/09 modified for UKPU SAP search -->
function onClickSearch ()
{
	var contentPage = eval(getAbsoluteFramePath("content"));
	if (contentPage != null)
	{
		var text = document.getElementById("txtSearch");
	
		var sapOnly = document.getElementById("checkbox1");
		
		callBlur(text);
		var strValue = text.value;
		if (strValue != "" && strValue != "<%=strSearch %>")
		{
			
				//postComponentJumpEvent(null, "search", "content", "query", strValue);	(original)
				//var strQry = "SELECT object_name,title,r_version_label FROM dm_document \
				var strQry = "SELECT r_object_id FROM dm_document \
				where upper (object_name) like upper('%" + strValue + "%') \
				OR upper (subject) like upper('%" + strValue + "%') \
				OR upper (title) like upper('%" + strValue + "%')";
				postComponentJumpEvent(null, "search", "content", "queryType", "dql", "query", strQry); 
			
			if (typeof text.autoComplete != "undefined" && text.autoComplete != null)
			{
				// add the search string to client-side's auto-complete suggestions
				text.autoComplete.addEntry(strValue);
				var prefs = InlineRequestEngine.getPreferences(InlineRequestType.JSON);
				prefs.setCallback("onUpdateACCallBack");
				postInlineServerEvent(null, prefs, null, null, "onUpdateAutoCompleteData", null, null);
			}
		}
	}
}
function onUpdateACCallBack ()
{
if (isEventPostingLocked())
{
releaseEventPostingLock();
}
}
function onClickSearchResults ()
{
var contentPage = eval(getAbsoluteFramePath("content"));
if (contentPage != null)
{
postComponentJumpEvent(null, "search", "content", "query", "", "queryType", "lastQuery");
}
}
function onClickPreferences ()
{
<%
if (MainEx.isStreamlineViewVisible() == false)
{
//
%>
beginModalPopupMode("content", null, "large", "onok");
postComponentNestEvent(null, "preferences", "content", "component", "general_preferences");
<%
}
else
{
//
%>
postComponentNestEvent(null, "preferences", "content", "component", "general_preferences", "preferredVersion", "<%=MainEx.STR_STREAMLINEVIEW_VISIBLE_CFG_VERSION%>");
<%
}
//
%>
}
function onClickHelp ()
{
fireClientEvent("InvokeHelp");
}
function onClickLogo ()
{
fireClientEvent("onClickLogoEvent");
}
function onClickLogoEvent (keys)
{
if (keys == keyValueToLaunchEditor)
{
postComponentNestEvent(null, "about", "content", "enableTools", "true");
}
else
{
postComponentNestEvent(null, "about", "content");
}
}
function onSearchTextChangeForRecording (obj)
{
}
function onSearchTextFocus ()
{
var ctrlText = document.getElementById("txtSearch");
if (ctrlText != null)
{
ctrlText.style.color = "#000"
if (ctrlText.value == "<%=strSearch %>")
{
ctrlText.value = "";
}
var browserFramePathExpr = getAbsoluteFramePath("browser");
if (browserFramePathExpr != null && eval(browserFramePathExpr) != null)
{
setAutoCompleteTargetFrame(ctrlText, "browser")
}
else
{
setAutoCompleteTargetFrame(ctrlText, "content")
}
}
}
function onInitPage ()
{
var text = document.getElementById("txtSearch");
if (text)
{
if (text.value == "")
{
text.style.color = "#999";
text.value = "<%=strSearch %>";
}
text.onfocus = onSearchTextFocus;
text.onblur = function()
{
if (text.value == "")
{
text.value = "<%=strSearch %>";
text.style.color = "#999";
}
}
}
callBlur(text);
}
function callBlur (text)
{
var f = function()
{
text.blur();
}
setTimeout(f, 10);
}
</script>
</head>
<body class='webtopTitlebarBackground' onload='onInitPage();'>
<dmf:form>
<div class="titlebarWrapper">
<table cellspacing='0' cellpadding='0' border='0' class='floatLeftAlignment'>
<tr>
<td>
<dmf:panel id='workarealinkpanel' name='workarealinkpanel'>
<dmf:link id='workarealink' focus='true' name='workarealink'
cssclass='titleLink' onclick='setFocusOnFirstElementInFrame,"content"'
runatclient='true' nlsid='MSG_GO_TO_WORK_AREA'
tooltipnlsid='MSG_GO_TO_WORK_AREA_TIP'/>
</dmf:panel>
<dmf:text name="txtSearch" id="txtSearch"
size="35" defaultonenter="true" tooltipnlsid='MSG_GO' autocompleteid="ac_simplesearch"/>
<dmf:button
name="go_button" src='icons/search/search-go.gif'
onclick="onClickSearch" runatclient="true" default="true"
tooltipnlsid='MSG_GO_TIP' cssclass="searchGoButtonRightPadding"/>
</td>
<td class="searchTriangleLeftPadding">
<dmf:menugroup name="simplesearchmenugroup" menubarclass="button default"
menubarhighlightclass="button default">
<dmf:menu name="simplesearchmenu" value="<%=triangle%>" horizontal="true">
<dmf:menuitem id="adv_search_menu" name='adv_search_item'
nlsid="MSG_ADVANCED_SEARCH" onclick="onClickAdvancedSearch"
runatclient="true" hotkeyid="HOTKEY_ADVANCED_SEARCH"/>
<dmf:menuitem id="searchresults_menu" name='searchresults_item'
nlsid="MSG_SEARCH_RESULTS" onclick="onClickSearchResults"
runatclient="true"/>
</dmf:menu>
</dmf:menugroup>

</td>
</tr>
</table>
<div class="floatRightAlignment">
<%
String view = AppSessionContext.getView();
boolean isStreamline = Main.isStreamlineViewVisible();
if (view.equalsIgnoreCase("streamline") && isStreamline == true)
{
%>
<dmf:button name='btnPrefs'
nlsid="MSG_PREFERENCES"
onclick="onClickPreferences" runatclient="true"
tooltipnlsid='MSG_PREFERENCES_TIP'/>
<%
}
%>
<dmfx:actionbutton name='logout'
action='logout' nlsid='MSG_LOGOUT'
tooltipnlsid='MSG_LOGOUT_TIP'>
</dmfx:actionbutton>
<dmf:button
nlsid="MSG_HELP"
onclick="onClickHelp"
runatclient="true"
src='icons/help.gif'
cssclass="helpImage"/>
</div>
</dmf:form>
</body>
</html>
