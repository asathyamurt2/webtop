<%--
/**
 *****************************************************************************
 *
 * Confidential Property of Documentum, Inc.
 * (c) Copyright Documentum, Inc. 2001.
 * All Rights reserved.
 * May not be used without prior written agreement
 * signed by a Documentum corporate officer.
 *
 *****************************************************************************
 *
 * Project        WDK 5.3
 * Module         Checkin
 * File           checkin.jsp
 * Description    Checkin start page.
 * Created by     pawelz
 * Created on
 * Tab width      3
 *
 *****************************************************************************
 *
 * VCS Maintained Data
 *
 * Revision       $Revision: 43$
 * Modified by    $Author: Ganugapenta, Veera$
 * Modified on    $Date: 10/28/2008 4:25:08 PM$
 * Revision       $Revision: 43$
 * Modified by    $Author: Ganugapenta, Veera$
 * Modified on    $Date: 10/28/2008 4:25:08 PM$
 *
 * Log at EOF
 *
 *****************************************************************************
 */
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ page import="com.documentum.web.form.Form"%>
<%@ page import="com.documentum.webcomponent.library.contenttransfer.checkin.Checkin"%>
<%@ page import="com.documentum.web.common.AccessibilityService" %>
<%@ page import="com.documentum.web.common.ClientInfo" %>
<%@ page import="com.documentum.web.common.ClientInfoService" %>
<%@ page import="com.documentum.web.util.Version" %>
<%@ page import="com.documentum.web.contentxfer.ContentTransferConfig" %>
<%@ page import="com.bhpb.imp.controldoc.checkincomp.BhpbControlldocCheckin" %>

<dmf:html>
<dmf:head>
   <dmf:webform/>
   <script type="text/javascript">
    /**
     * Invoked when retainlock checkbox is checked. The method adjusts the keeplocalfile checkbox
     * accordingly.
     */
     
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
	document.getElementById('BhpDateValue').value = today;	
}
     
	 
    function onRetainLockClick(chk)
    {
       // keep local file is checked if either checkinfromfile or retainlock is checked
       __orCheck(chk, document.getElementById("checkinfromfile"), document.getElementById("keeplocalfile"));

    }
    /**
     * Invoked when keeplocalfile checkbox is checked. The method adjusts the keeplocalfile checkbox
     * accordingly.
     */
    function onCheckinFromFileClick (chk)
    {
       // keep local file is checked if either checkinfromfile or retainlock is checked
       __orCheck(chk, document.getElementById("retainlock"), document.getElementById("keeplocalfile"));
       if (document.getElementById("keeplocalfile") != null)
       {
          <% Checkin chk = (Checkin) pageContext.getAttribute(Form.FORM, PageContext.REQUEST_SCOPE); %>
          <dmf:postserverevent handlermethod="onChangeCheckinFromFile" handlerid="<%=chk.getElementName()%>"/>
       }
    }
    function __orCheck(chk1, chk2, target)
    {
       if (target != null)
       {
          var chk2Checked = (chk2 != null) ? chk2.checked : false;
          with (target)
          {
             disabled = chk1.checked || chk2Checked;
             checked = chk1.checked || chk2Checked;
          }
       }
    }
    /**
     * Invoked when file is selected for checkin from file.
     */
    function onSelectFile()
    {
       document.getElementById("checkinfromfile").checked = true;
       __orCheck(document.getElementById("checkinfromfile"), document.getElementById("retainlock"), document.getElementById("keeplocalfile"));
       <%Form form = (Form) pageContext.getAttribute(Form.FORM, PageContext.REQUEST_SCOPE);%>
       <dmf:postserverevent handlermethod="onSelectFile" handlerid="<%=form.getElementName()%>"/>
    }

    /**
     * Call after delay.
     */
    function callServerMethodAfterDelay()
    {
	 // adding a delay of 500 millisec because of a bug in jre 1.6 update 11.
       setTimeout("safeCall(postServerEvent,null,null,null,'onOk')", 500);
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
</dmf:head>
      <%
         Checkin checkin = (Checkin) pageContext.getAttribute(Form.FORM, PageContext.REQUEST_SCOPE);
         // If the component arg silent= true  then performs a silent checkin w/o displaying the dialog
         // Also performs validator checks
         String strShowDialogEvent = "true";
         String strJSFunction = "";
         if(checkin.isSilentCheckin() && checkin.getIsValid())
         {
      %>
            <dmfx:clientenvpanel environment="appintg">
            <script>
               // hide dialog
               fireClientEvent("aiEvent", "event=HideDialog", "busyCursor=true");
            </script>
            </dmfx:clientenvpanel>
      <%
            strShowDialogEvent = "false";
            strJSFunction = "callServerMethodAfterDelay()";
         }
      %>

<dmf:body cssclass='contentBackground'
          showdialogevent='<%=strShowDialogEvent%>' id='save' titlenlsid='MSG_TITLE'
          width='550' height='470' onload="<%=strJSFunction%>">

<dmf:form>
<dmf:hidden name = "BhpDateValue" id = "BhpDateValue" />
   <dmfx:docbaseobject name="object" modifyonversion="true" />

            <%--     Icon, object info --%>
            <table border="0" cellpadding="0" cellspacing="0">
               <tr>
                  <td valign="top"><dmfx:docbaseicon size='32' name="obj_icon"/></td>
                  <td width="10" class="spacer">&nbsp;</td>
                  <td scope="row" valign="top">
                     <dmfx:docbaseattributevalue object="object" name="attribute_object_name" attribute="object_name" required="true" size="57"/><br>
                     <dmf:label nlsid="MSG_VERSION"/>:&nbsp;<dmfx:docbaseattributevalue object="object" attribute="r_version_label" readonly="true"/><br>
                     <dmfx:docbaseattribute object="object" attribute="r_object_type" readonly="true" col1=":&nbsp;"/><br>
                     <dmfx:docbaseattribute object="object" attribute="a_content_type" readonly="true" col1=":&nbsp;"/><br>
                     <dmfx:docbaseattributeproxy name="objectectnameproxy" object="object" controltorepresent="attribute_object_name" attribute="object_name"/>
                  </td>
               </tr>
            </table>
            <br>
            <table border="0" cellpadding="0" cellspacing="0">
               <tr>
                  <td></td>
                  <td></td>
                  <td>
                     <dmf:label name="checkinFromFileErrorMsg" nlsid="MSG_CHECKIN_FROM_FILE_NEEDED"  cssclass="validatorMessageStyle"/>
                  </td>
               </tr>
               <tr>
                  <td></td>
                  <td></td>
                  <td>
                     <dmf:label name='sourcenotcheckedoutmsg' cssclass="validatorMessageStyle"/>
                  </td>
               </tr>
               </table>

               <br>
               <dmf:panel name="standardoptions">
               <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <%--      Version --%>
                  <dmf:panel name="existingobjversion">
                     <tr>
                     <fieldset style="border:0px">
                     <td scope="row" valign="middle" class="fieldlabel rightAlignment">
                        <legend align="right"><dmf:label nlsid="MSG_SAVE_AS"/></legend>
                     </td>
                     <td class="defaultcolumnspacer" valign="middle">:&nbsp;</td>
                     <td valign="top">
                           <%
                              boolean bAccessibilityEnabled = AccessibilityService.isAllAccessibilitiesEnabled();
                              if (bAccessibilityEnabled)
                              {
                           %>
                                 <dmf:radio name="sameversion" group="group1"/>
                           <%
                              }
                              else
                              {
                           %>
                        <dmf:radio name="sameversion" group="group1" tooltipnlsid="MSG_SAME_VERSION"/>
                           <%
                              }
                           %>
                        <span class="defaultcolumnspacer"></span><dmf:label name="sameversionnum"/>
                     <br>
                           <%
                              bAccessibilityEnabled = AccessibilityService.isAllAccessibilitiesEnabled();
                              if(bAccessibilityEnabled)
                              {
                           %>
                                  <dmf:radio name="minorversion" group="group1"/>
                           <%
                              }
                              else
                              {
                           %>
                           <dmf:radio name="minorversion" group="group1" tooltipnlsid="MSG_MINOR_VERSION"/>
                           <%
                              }
                           %>
                           <span class="defaultcolumnspacer"></span><dmf:label name="minorversionnum"/>
                     <br>
                           <%
                              bAccessibilityEnabled = AccessibilityService.isAllAccessibilitiesEnabled();
                              if(bAccessibilityEnabled)
                              {
                           %>
                                 <dmf:radio name="majorversion" group="group1"/>
                           <%
                              }
                              else
                              {
                           %>
                           <dmf:radio name="majorversion" group="group1" tooltipnlsid="MSG_MAJOR_VERSION"/>
                           <%
                              }
                           %>
                           <span class="defaultcolumnspacer"></span><dmf:label name="majorversionnum"/>
                        </td>
                           </fieldset>
                     </tr>
                  </dmf:panel>
                  <dmf:panel name="newobjversion">
                     <tr>
                        <fieldset style="border:0px">
                        <td scope="row" nowrap valign="middle" class="fieldlabel rightAlignment">
                           <legend align="right"><dmf:label nlsid="MSG_SAVE_AS"/></legend>
                        </td>
                        <td class="defaultcolumnspacer leftAlignment" valign="middle">:&nbsp;</td>
                        <td valign="middle">
                           <dmf:radio name="newversion" group="group2" tooltipnlsid="MSG_NEW_VERSION" />&nbsp;
                           <dmf:label name="newversionnum"/>
                        </td>
                        </fieldset>
                     </tr>
                  </dmf:panel>
                  <dmf:panel name="branchversion">
                     <tr>
                        <fieldset style="border:0px">
                        <td scope="row" valign="middle" nowrap class="fieldlabel rightAlignment">
                           <legend align="right"><dmf:label nlsid="MSG_SAVE_AS"/></legend>
                        </td>
                        <td class="defaultcolumnspacer leftAlignment" valign="middle">:&nbsp;</td>
                        <td valign="top">
                           <%
                              boolean bAccessibilityEnabled = AccessibilityService.isAllAccessibilitiesEnabled();
                              if(bAccessibilityEnabled)
                              {
                           %>
                                    <dmf:radio name="majorversion" group="group3"/>
                           <%
                              }
                              else
                              {
                           %>
                           <dmf:radio name="majorversion" group="group3" tooltipnlsid="MSG_MAJOR_VERSION"/>
                           <%
                              }
                           %>
                           <span class="defaultcolumnspacer"></span><dmf:label name="majorversionnum"/>
                           <br>
                           <%
                              bAccessibilityEnabled = AccessibilityService.isAllAccessibilitiesEnabled();
                              if(bAccessibilityEnabled)
                              {
                           %>
                                 <dmf:radio name="branchrevision" group="group3"/>
                           <%
                              }
                              else
                              {
                           %>
                           <dmf:radio name="branchrevision" group="group3" tooltipnlsid="MSG_BRANCH_REVISION" />
                           <%
                              }
                           %>
                           <span class="defaultcolumnspacer"></span><dmf:label name="branchrevisionnum"/>
                        </td>
                        </fieldset>
                     </tr>
                  </dmf:panel>
            <%--         Version label --%>
                  <tr>
                     <td scope="row" valign=middle class="fieldlabel rightAlignment">
                        <dmf:label nlsid="MSG_VERSION_LABEL"/>
                     </td>
                     <td class="defaultcolumnspacer leftAlignment" valign="middle">:&nbsp;</td>
                     <td valign="middle">
                        <dmf:text name="symbolicVersionLabel" size="57" tooltipnlsid="MSG_VERSION_LABEL" autocompleteid="ac_symbolicVersionLabel"/>
                        <br><dmf:utf8stringlengthvalidator name="version_validator" controltovalidate="symbolicVersionLabel" maxbytelength="32" nlsid="MSG_VERSION_LABEL_TOO_LONG"/>
                        <dmfx:symbolicversionlabelvalidator name="symbolicversionlabel_validator" controltovalidate="symbolicVersionLabel"/>
                        <dmf:requiredfieldvalidator name="versionLabelRequireValidator" controltovalidate="symbolicVersionLabel" nlsid="MSG_VERSION_LABEL_NEEDED" />
                     </td>
                  </tr>
            <%--        Description  --%>
                  <tr>
                     <td scope="row" valign="middle" class="fieldlabel rightAlignment">
                        <dmf:label nlsid="MSG_DESCRIPTION" associatedcontrolid="attr_description"/>
                     </td>
                     <td class="defaultcolumnspacer leftAlignment">:</td>
                     <td>
                        <dmfx:docbaseattributevalue object="object" id="attr_description" name="attr_value_description" attribute="log_entry" readonly="false" lines="1" size="57"/>
                     </td>
                  </tr>
            <%--      Format selection  --%>
                  <tr>
                     <td scope="row" valign="middle" class="fieldlabel rightAlignment">
                        <dmf:label nlsid="MSG_FORMAT"/>
                     </td>
                     <td class="defaultcolumnspacer leftAlignment" valign="middle">:&nbsp;</td>
                     <td class="leftAlignment" valign="middle" >
                        <dmf:datadropdownlist name="formatlist"  tooltipnlsid="MSG_FORMAT">
                           <dmf:dataoptionlist>
                              <dmf:option datafield="name" labeldatafield="description"/>
                           </dmf:dataoptionlist>
                        </dmf:datadropdownlist>
                        <dmfx:docbaseattributeproxy name="objectectformatproxy" object="object" controltorepresent="formatlist" attribute="a_content_type"/>
                     </td>
                  </tr>
                  <dmf:panel name="unknown_format_info_label_panel" >
                  <tr>
                     <td scope="row" valign="middle" class="fieldlabel rightAlignment">&nbsp;
                     </td>
                     <td class="defaultcolumnspacer leftAlignment" valign="middle">&nbsp;</td>
                     <td class="leftAlignment" valign="middle" >
                        <dmf:label name='unknown_format_info_label' nlsid='MSG_ENFORCE_SELECT_FORMAT' cssclass="validatorMessageStyle" />
                     </td>
                  </tr>
                  </dmf:panel>
	<%
	BhpbControlldocCheckin getdoctype = (BhpbControlldocCheckin)pageContext.getAttribute(Form.FORM, PageContext.REQUEST_SCOPE);
	getdoctype.checkinit();
	%>
<table>
<dmf:panel name="dynamicpanel">
<tr id="viewdoctype" >
<td class="fieldlabel rightAlignment" >
<dmf:label cssclass="defaultDocbaseAttributeStyle" nlsid="DOC_TYPE"/></td>
<td class="defaultcolumnspacer">:&nbsp;</td>
<td class="leftAlignment"><dmf:datadropdownlist width="270" name="dcoTypeList" cssclass="defaultDocbaseAttributeStyle" onselect="ondcoSelectType" tooltipnlsid="DOC_TYPE" value="<%=getdoctype.doctypevalue%>"  >
<dmf:option value="Production" nlsid="MSG_PROD" />
<dmf:option value="Development" nlsid="MSG_DEV" />
<dmf:option value="OBOJIU" nlsid="MSG_OBO" />
<dmf:option value="Function" nlsid="MSG_FUN" />
</dmf:datadropdownlist>
</td>
</tr>
</dmf:panel>
<tr id="hidden" style="display:none;" >
<td class="fieldlabel rightAlignment" >
<dmfx:docbaseattribute name="bhpb_pet_doctype" object="object"  attribute="bhpb_pet_doctype" size="48" />
</td></tr>
<dmf:panel name="defaultattlist">
<table border="0" cellpadding="2" cellspacing="0" width="100%">
<dmfx:docbaseattribute object="object" attribute="r_object_id"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_facility"  size="48"  pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="title"   size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="subject"   size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_criticality"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_doc_function"   size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_transmittal_number"   size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_purpose"   size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_bhpbrev_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_bhpbrev_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
</dmf:panel>
<dmf:panel name="dynamicpanel1">
<dmfx:docbaseattributelist name="attrlist" object="object" attrconfigid="import" pre="<tr><th align=\"right\">" col1="</th><th>: </th><th align=\"left\">" post="</th></tr>"/>
</dmf:panel>
<dmf:panel name="panproduction" visible="<%=getdoctype.production%>">
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_archive_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_vendor_rev_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_requestor"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_requestor_comments"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_date_registered"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_completion_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<tr><th></th><th></th><th><dmf:label name = "DateError" align = "right" style = "color:red;"/></th></tr>
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_procedure_owner"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_vendor_name"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_vendordoc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_po_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_moc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_tag_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_storage_prov"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_discipline"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_frcp_std_desc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_hsec_std_desc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_regulations_desc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
</dmf:panel>
<dmf:panel name="pandevelopment" visible="<%=getdoctype.development%>">
<dmfx:docbaseattribute object="object" attribute="authors"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_archive_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_requestor"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_requestor_comments"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_date_registered"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_completion_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<tr><th></th><th></th><th><dmf:label name = "DateError" align = "right" style = "color:red;"/></th></tr>
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_procedure_owner"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_date_received"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_date_bhpb_return"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_date_sent"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_date_due"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_vendor_name"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_vendor_rev_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_vendordoc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_po_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
</dmf:panel>
<dmf:panel name="panobojiu" visible="<%=getdoctype.obojiu%>">
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_requestor"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_requestor_comments"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_date_registered"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_completion_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<tr><th></th><th></th><th><dmf:label name = "DateError" align = "right" style = "color:red;"/></th></tr>
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_procedure_owner"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_vendor_name"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_vendor_rev_no"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_vendordoc"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
</dmf:panel>
<dmf:panel name="panfunction" visible="<%=getdoctype.function%>">
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_archive_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_requestor"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_requestor_comments"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_date_registered"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_completion_date"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
<tr><th></th><th></th><th><dmf:label name = "DateError" align = "right" style = "color:red;"/></th></tr>
<dmfx:docbaseattribute object="object" attribute="bhpb_pet_procedure_owner"  size="48" pre="<tr><th align=\"right\">" col1="</th><th> : </th><th  align=\"left\">" post="</th></tr>" />
</dmf:panel>
</table>
<table>
                  <!--ole scan panel-->
                  <dmf:panel name="oleScanPanel">
                  <tr>
                     <td scope="row" nowrap class="fieldlabel rightAlignment">
                        <dmf:label nlsid="MSG_OLE_SCAN_ENABLE"/>
                     </td>
                     <td class="defaultcolumnspacer leftAlignment" valign="middle">:&nbsp;</td>
                     <td class="leftAlignment">
                        <dmf:checkbox name='oleScanEnable' tooltipnlsid="MSG_OLE_SCAN_ENABLE"/><dmf:label nlsid="MSG_OLE_SCAN_ENABLE_DESCRIPTION"/>
                     </td>
                  </tr>
                  </dmf:panel>

            <%--    full text option for superusers  --%>
                  <dmf:panel name="fulltext">
                     <tr>
                        <td scope="row" nowrap class="fieldlabel rightAlignment">
                           <dmfx:docbaseattributelabel object="object" attribute="a_full_text"/>
                        </td>
                        <td class="defaultcolumnspacer leftAlignment" valign="middle">:&nbsp;</td>
                        <td class="leftAlignment">
                           <dmfx:docbaseattributevalue object="object" attribute="a_full_text"/>
                        </td>
                     </tr>
                  </dmf:panel>

               </table>
               </dmf:panel>

               <%--  BOCS write option --%>
            <dmf:panel name="bocswriteoption">
               <dmf:panel name="bocswriteoptiontop">
                  <div style="margin-top: 0px;border-bottom: 1px solid #333;clear:both"></div>
                  <p class="inlinehelpmessage inlinehelppara"><dmf:label align="left" nlsid="MSG_BOCS_WRITE_OPTION_NOTICE" /></p>
               </dmf:panel>
               <table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tr>
                     <br>
                     <td class="fieldlabel" align="right" valign="top" scope="row" nowrap>
                        <dmf:label nlsid="MSG_BOCS_WRITE_OPTION"/>
                     </td>
                     <td class="defaultcolumnspacer" align="left" valign="top">:&nbsp;</td>
                     <td align="left" valign="top">
                        <p class="radiopara"><span class="radio"><dmf:radio name="bocssyncwrite" group="bocsgroup" tooltipnlsid="MSG_BOCS_SYNC_WRITE"/></span><span class="radiolabel"><dmf:label nlsid="MSG_BOCS_SYNC_WRITE"/></p>
                        <p class="inlinehelpmessage inlinehelppara" style="padding-left:21px"><dmf:label nlsid="MSG_BOCS_SYNC_WRITE_HELP_MESSAGE"/></p>
                        <p class="radiopara"><span class="radio"><dmf:radio name="bocsasyncwrite" group="bocsgroup" tooltipnlsid="MSG_BOCS_ASYNC_WRITE"/></span><span class="radiolabel"><dmf:label nlsid="MSG_BOCS_ASYNC_WRITE"/></p>
                        <p class="inlinehelpmessage inlinehelppara" style="padding-left:21px"><dmf:label nlsid="MSG_BOCS_ASYNC_WRITE_HELP_MESSAGE"/></p>
                     </td>
                  </tr>
               </table>
               <dmf:panel name="bocswriteoptionbottom">
                  <div style="margin-top: 0px;border-bottom: 1px solid #333;clear:both"></div>
               </dmf:panel>
            </dmf:panel>

               <dmf:panel name="additionaloptions">
               <br>
               <table border="0" cellpadding="2" cellspacing="0" width="100%">
            <%--     Options  --%>
               <tr>
               <td></td>
               <td scope="row" colspan="2" nowrap>
               <dmf:noopformatter>
                  <dmf:link name="showhideoptions" onclick="onClickShowHideOptions" cssclass="showMoreHideMoreLink"/>
               </dmf:noopformatter>
               </td>
               </tr>
               <dmf:panel name="optionspanel">
                  <dmfx:clientenvpanel environment="appintg">
                      <dmf:fireclientevent event='aiEvent' includeargname='true'>
                          <dmf:argument name='event'       value='ShowDialog'/>
                          <dmf:argument name='id'          value='save'/>
                          <dmf:argument name='width'       value='550'/>
                          <dmf:argument name='height'      value='550'/>
                          <dmf:argument name='sizepreference' value='false'/>
                          <dmf:argument name='title'       nlsid='MSG_CAPTION'/>
                      </dmf:fireclientevent>
                  </dmfx:clientenvpanel>
                  <tr>
                     <td></td>
                     <td></td>
                     <td scope="row">
                     <dmf:checkbox name="retainlock" id="retainlock" nlsid="MSG_RETAIN_LOCK" onclick="onRetainLockClick" runatclient="true"/>
                     </td>
                  </tr>
                  <tr>
                     <td></td>
                     <td></td>
                     <td scope="row">
                     <dmf:checkbox name="makecurrent" nlsid="MSG_MAKE_CURRENT" onclick="onClickMakeCurrent"/>
                     </td>
                  </tr>
                  <dmf:panel name="keeplocalfilepanel">
                     <tr>
                        <td></td>
                        <td></td>
                        <td scope="row">
                           <dmf:checkbox name="keeplocalfile" id="keeplocalfile" nlsid="MSG_KEEP_LOCAL_FILE"/>
                        </td>
                     </tr>
                  </dmf:panel>
                  <tr>
                     <td></td>
                     <td></td>
                     <td scope="row">
                        <dmf:checkbox name="subscribe" nlsid="MSG_SUBSCRIBE_TO_FILE"/>
                     </td>
                  </tr>
                  <dmf:panel name="vdmoptions">
                     <tr>
                        <td></td>
                        <td></td>
                        <td scope="row">
                           <dmf:checkbox name="checkindescendents" nlsid="MSG_CHECKIN_DESCENDENTS"/>
                        </td>
                     </tr>
                  </dmf:panel>
                  <dmfx:clientenvpanel environment="appintg" reversevisible='true'>
                  <tr>
                     <td></td>
                     <td></td>
                     <td>
                     <table cellpadding="0" cellspacing="0" border="0">
                           <tr>
                           <td class="nowrap" scope="row">
                              <dmf:checkbox name="checkinfromfile" id="checkinfromfile" nlsid="MSG_CHECKIN_FROM_FILE"
                     onclick="onCheckinFromFileClick" runatclient="true"/>&nbsp;<dmf:label name="filebrowselabel"/>
                           </td>
                           <td>
                               <%
                                   if (ContentTransferConfig.getConfig().isUcfEnabled())
                                   {
                               %>
                               <dmf:filebrowseapplet name="filebrowse" id="filebrowse" onselect="onSelectFile"
                                                     runatclient="true"/>
                               <dmf:absolutefilepathvalidator name="absolutefilepathvalidator"
                                                              controltovalidate="filebrowse"/>
                               <%
                               }
                               else
                               {                                                                        
                               %>
                               <dmf:filebrowse name="filebrowse" cssclass="defaultFilebrowseTextStyle" size="50"
                                               onselect="onSelectFile" runatclient="true"/>
                               <%
                                   }
                               %>                              
                           </td>
                           </tr>
                           <tr>
                              <td>&nbsp;</td>
                              <td>
                                 <dmf:requiredfieldvalidator name="validatefilebrowse" controltovalidate="filebrowse"
                                 nlsid="MSG_FILENAME_REQUIRED"/><br>
                                
                              </td>
                           </tr>
                       </table>
                     </td>
                  </tr>
                  </dmfx:clientenvpanel>
               </dmf:panel>
            </table>
          </dmf:panel>
 </dmf:form>
</dmf:body>
</dmf:html>
<%--
/**
 *****************************************************************************
 *
 * $Log:
 *  43    Main       1.7.1.14.1.1.2.17 10/28/2008 4:25:08 PM   Ganugapenta,
 *       Veera dev_core to Main merge
 *  42    Main       1.7.1.14.1.1.2.16 9/26/2008 3:48:40 PM    Ganugapenta,
 *       Veera dev_core to Main merge
 *  41    Main       1.7.1.14.1.1.2.15 9/19/2008 2:07:34 PM    Rajakumar
 *       Thiruvasagam dev_core->Main merge
 *  40    Main       1.7.1.14.1.1.2.14 6/11/2008 5:31:48 PM    Sachin Totale  
 *       dev_core to main merge.
 *  39    Main       1.7.1.14.1.1.2.13 6/2/2008 6:24:40 PM     Ramkumar Ganesan
 *       dev_core to Main merge
 *  38    Main       1.7.1.14.1.1.2.12 2/25/2008 1:16:56 PM    Sachin Totale  
 *       dev_core to main merge
 *  37    Main       1.7.1.14.1.1.2.11 10/30/2007 3:48:39 AM   Dan Serfaty    
 *       merged from devo_core
 *  36    Main       1.7.1.14.1.1.2.10 6/12/2007 4:08:58 AM    Hai Li         
 *       merged from dev_core
 *  35    Main       1.7.1.14.1.1.2.9 6/5/2007 2:59:24 AM     Rajesh
 *       Kasanagottu Merging up from dev_core
 *  34    Main       1.7.1.14.1.1.2.8 5/22/2007 5:39:20 AM    John Huang     
 *       dev_core -> Main
 *  33    Main       1.7.1.14.1.1.2.7 5/15/2007 4:55:32 AM    Susi Soedarsono
 *       Merge from dev_core to Main.
 *  32    Main       1.7.1.14.1.1.2.6 5/8/2007 2:22:47 PM     Pawel Zieminski
 *       dev_core to Main merge
 *  31    Main       1.7.1.14.1.1.2.5 2/6/2007 1:13:02 PM     John Huang     
 *       dev_core to Main
 *  30    Main       1.7.1.14.1.1.2.4 1/30/2007 7:56:52 AM    Pawel Zieminski
 *       dev_core to Main merge
 *  29    Main       1.7.1.14.1.1.2.3 1/9/2007 2:51:04 AM     Ting Ting Huang
 *       dev_core -> main merge
 *  28    Main       1.7.1.14.1.1.2.2 12/19/2006 5:26:24 AM   Ting Ting Huang
 *       merge dev_core -> main.
 *  27    Main       1.7.1.14.1.1.2.1 12/5/2006 5:50:17 AM    Hongyu Lu      
 *       merge from dev_core to main
 *  26    Main       1.7.1.14.1.1.2.0 10/10/2006 5:57:14 AM   John Huang     
 *       dev_core -> Main
 *  25    Main_OBSOLETE 1.7.1.14.1.1 6/14/2006 8:29:05 PM    Clay Sebourn   
 *       Added objectectattributevaliator
 *  24    Main_OBSOLETE 1.7.1.14.1.0 5/5/2006 4:04:25 AM     Pawel Zieminski
 *       Document format did not automatically change on selecting a file to
 *       checkin - bug 88839
 *  23    5.3.x      1.7.1.14     7/26/2005 2:30:31 AM    Bridget Jackson Bug
 *       fix for 96565--moved error message to new line
 *  22    5.3.x      1.7.1.13     7/9/2005 6:01:19 AM     Pawel Zieminski added
 *       absolute path validator
 *  21    5.3.x      1.7.1.12     5/5/2005 2:43:48 AM     Clay Sebourn   
 *       Aligned Format
 *  20    5.3.x      1.7.1.11     4/14/2005 8:24:29 PM    Clay Sebourn    Fix
 *       heading titles
 *  19    5.3.x      1.7.1.10     3/10/2005 5:12:10 AM    Jerzy Gruszka   Added
 *       clientenvpanenl to hide unsuported 'keep local file' option for
 *       'appintg' context.
 *  18    5.3.x      1.7.1.9      3/8/2005 1:02:43 PM     Pawel Zieminski fixed
 *       issues with checkin with retain lock - 93747
 *  17    5.3.x      1.7.1.8      2/26/2005 12:43:08 AM   Paul Warren    
 *       Modified the AppConnector dialog settings
 *  16    5.3.x      1.7.1.7      2/23/2005 11:25:12 AM   Hai Li         
 *       Replaced "regexpvalidator" tag with "utf8stringlengthvalidator" tag -
 *       bug 91802 fix.
 *  15    5.3.x      1.7.1.6      2/16/2005 7:49:56 AM    Teresa Chan     Added
 *       required attribute to docbaseattributevalue control on object_name
 *  14    5.3.x      1.7.1.5      2/16/2005 7:45:53 AM    Pawel Zieminski
 *       selecting checkin from file checkbox is now triggered after selecting
 *       the file
 *  13    5.3.x      1.7.1.4      2/15/2005 5:48:37 AM    Bridget Jackson Fix
 *       for bug  88891 -- make object name editable in checkin screen
 *  12    5.3.x      1.7.1.3      2/10/2005 11:25:31 AM   Pawel Zieminski -
 *       file from checkin from file was getting deleted on checkin
 *       - checkin of non-current doc branch/major version selection was broken
 *  11    5.3.x      1.7.1.2      1/29/2005 1:02:50 AM    Jerzy Gr szka   Added
 *       clientenvpanel to hide 'checkinfromfile'.
 *  10    5.3.x      1.7.1.1      1/22/2005 12:07:35 AM   Jerzy Gruszka   Added
 *       different dialog caption.
 *  9     5.3.x      1.7.1.0      1/14/2005 2:32:04 AM    Jerzy Gruszka   Added
 *       custom events for app integrations.
 *  8     DO_NOT_USE 1.7          10/29/2004 11:00:38 PM  Bridget Jackson Fixed
 *       layout problem
 *  7     DO_NOT_USE 1.6          10/21/2004 7:56:44 AM   Pawel Zieminski fixed
 *       error where Make Current checkbox was causing exceptions
 *  6     DO_NOT_USE 1.5          8/18/2004 7:43:52 AM    Pawel Zieminski
 *       modified branch version checkin options
 *  5     DO_NOT_USE 1.4          8/13/2004 4:24:03 AM    Bridget Jackson
 *       Modified container and content area layouts for modal screens to match
 *       5.3 designs
 *  4     DO_NOT_USE 1.3          7/8/2004 4:04:32 AM     Susi Soedarsono Added
 *       a label to show warning message when the local object is out of sync
 *       with the source object. Added panel around the standard and additional
 *       options so they can be hidden when the object is out of sync.
 *  3     DO_NOT_USE 1.2          6/22/2004 12:32:38 AM   Pawel Zieminski
 *       decreased the size of description - we only allow 80 chars
 *  2     DO_NOT_USE 1.1          6/4/2004 9:23:42 AM     Pawel Zieminski 1.
 *       Added missing success messages for content transport operations. 
 *       2. Added missing warning dialog for cancel checkout. 
 *       3. Added required field validators on file selection fields in checkin
 *       and import rendition. 
 *       4. Fixed headers in a few source files.
 *  1     DO_NOT_USE 1.0          5/28/2004 3:34:14 PM    Pawel Zieminski 
 * $
 *
 *****************************************************************************
 */
--%>
