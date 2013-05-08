<!-- 
Component: DOC_U11 PET Generate Number Format
Author: Miranda Mayle
Date: May/June 2007
Desc:
Allows for document number format content value edit.
Is included in createContent.jsp
 -->
 <%
//
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ taglib uri="/WEB-INF/tlds/impform_1_0.tld" prefix="imp" %>
<%@ page import="com.documentum.web.form.Form" %>
<%@ page import="com.bhpb.imp.wdk.webtop.docnumber.pet.EditFormatContent" %>
<dmf:webform/>
<dmf:form>

<script src='<%=Form.makeUrl(request, "/custom/library/docnumber/pet/numberFormat.js")%>' language='JavaScript1.2'></script>

<table width='100%'>
<tr><td style='padding-left:10px'>
<table border="0" bordercolor="green" cellpadding="2" cellspacing="0" width="100%">
			<tr>
			    <td colspan="3"><dmf:label nlsid="MSG_ADD_EDIT_CONTENT"/>
			    </td>
			    <td id="adderror" class="validatorMessageStyle" colspan="2">&nbsp;</td>
			   
			</tr>
			
			<tr>
			    <td class="fieldlabel" align="right"><dmf:label cssclass="defaultDocbaseAttributeStyle" nlsid="MSG_CODE"/>
			    </td>
			    <td class="defaultcolumnspacer">:&nbsp;</td>
			    <td> <imp:text name="code" id="code" size="10" maxlength="32" tabindex="1"/>
			    </td>
			    <td style='padding-left:10px'align="center">
			    <dmf:button name='add' cssclass='buttonLink' nlsid='MSG_ADD' onclick='onAddValue'
				height='16' imagefolder='images/dialogbutton' runatclient="true" tabindex="3" />
			     </td>
			      <td class="fieldlabel"><b><dmf:label cssclass="listlabel" nlsid="MSG_CONTENT_VALUES"/>:
			    </td>

			</tr>
			<tr>
			    <td width="80" class="fieldlabel" align="right"><dmf:label cssclass="defaultDocbaseAttributeStyle" nlsid="MSG_DESCRIPTION"/>
			    </td>
			    <td class="defaultcolumnspacer">:&nbsp;</td>
			    <td> <imp:text name="desc" id="desc" maxlength="128" tabindex="2"/>
			    </td>
			    <td style='padding-left:10px' align="center">
			    <dmf:button name='remove' cssclass='buttonLink' nlsid='MSG_REMOVE'
				onclick='onClickRemove' runatclient="true" height='16' imagefolder='images/dialogbutton' tabindex='4'/>
			     </td>
			     <td class="fieldlabel" rowspan="5" style='padding-left:10px'>
			     <dmf:listbox name='contentvalues' id='contentvalues' size='8' width='250' tabindex='5' >		     
			     </dmf:listbox>
			    </td>
			</tr>	
			
			<tr>
			    <td height="30"></td>
			    <td></td>
			    <td></td>
			    <td></td>
			</tr>	
			<tr>
			    <td height="30"></td>
			    <td></td>
			    <td></td>
			    <td></td>
			</tr>	
			<tr>
			    <td height="30"></td>
			    <td></td>
			    <td></td>
			    <td></td>
			</tr>			
			

<tr>
<td height='10'>&nbsp;</td>
</tr>
</table>
</td></tr>
</table>
<dmf:hidden name="hiddenValues" id="hiddenValues"/>
<dmf:hidden name="hiddenCode" id="hiddenCode"/>
<dmf:hidden name="hiddenDesc" id="hiddenDesc"/>
<dmf:hidden name="hiddenAddCode" id="hiddenAddCode"/>
<dmf:hidden name="hiddenAddDesc" id="hiddenAddDesc"/>
<dmf:hidden name="hiddenRemoveCode" id="hiddenRemoveCode"/>
<dmf:hidden name="hiddenRemoveDesc" id="hiddenRemoveDesc"/>

<script>setTimeout('initListbox()', 10);</script>
</dmf:form>
