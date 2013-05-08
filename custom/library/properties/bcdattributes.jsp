<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>

<%@ page import="com.documentum.webcomponent.library.properties.Properties,
                 com.documentum.web.formext.component.DialogContainer"%>

<dmf:html>
   <dmf:head>
      <dmf:webform validation="true"/>

      <dmf:title><dmf:label nlsid='MSG_TITLE'/></dmf:title>
   </dmf:head>

   <dmf:body cssclass='defaultPanesetBackground' marginheight='0' marginwidth='0'
      topmargin='0' bottommargin='0' leftmargin='0' rightmargin='0'>
   <dmf:form>

   <!-- the Docbase object -->
   <dmfx:docbaseobject name="obj" configid="attributes"/>

   <!-- the attributes -->
   <table border="0" cellpadding="0" cellspacing="0">
      <tr>
         <td class="spacer" width="4">
          &nbsp;
         </td>
         <td valign="top">
            <table border="0" cellpadding="2" cellspacing="1"> 
              <tr><td>
            	<dmfx:docbaseattribute attribute="bhpb_bcd_af_no" object="obj" docbaseattributevalueassistance="af_resultset"/> 
            	<dmfx:docbaseattributevalueassistance name="af_resultset"
					islistcomplete="true">
				</dmfx:docbaseattributevalueassistance>         
				</td></tr>
				<tr><td class="spacer">&nbsp;</td></tr>
				<tr><td class="spacer">&nbsp;</td></tr>
            </table>
			
			<table border='1' bordercolor='black' cellpadding='0' cellspacing='0' align='left' >
				  <tr><td  align='left'>
				<dmf:datagrid name="aflist" paged='true' pagesize='50' preservesort='true' bordersize='0' width='100%'>
			
				<table border='0' bordercolor='green' cellpadding='0' cellspacing='0'>
					<tr  class='pagerBackground'>
						<td width='70%'  align='middle' ><dmf:datapaging name='pager1' gotopageclass='doclistPager'/></td>
						<td align='right' nowrap valign="middle"><dmf:label nlsid='MSG_SHOW_ITEMS'/>&nbsp;</td>
						<td width='3%' valign="middle" nowrap><dmf:datapagesize name='datapagesize' tooltipnlsid='MSG_SHOW_ITEMS'/></td>
					</tr>
				</table>
				</td>
			  </tr>
			  <tr>
			    <td>
				<TABLE cellpadding='1' align='left' cellspacing='1' border='0' bordercolor='blue'>
				<TR>
	   	 			<TH align='left'><dmf:label nlsid='MSG_AF_NO'/></TH>
					<TH align="left"><dmf:label nlsid='MSG_AF_ACTIVITY'/></TH>
					<TH align="left"><dmf:label nlsid='MSG_ENDORSE'/></TH>
					<TH align="left"><dmf:label nlsid='MSG_APPROVE'/></TH>
					<TH align="left"><dmf:label nlsid='MSG_INFORM'/></TH>
				</TR>
				<dmf:datagridRow>
			  	    <td><dmf:label datafield="no"/></td>
					<td><dmf:label datafield="activity"/></td>
					<td>
						<table>
						  <tr><td><dmf:label datafield="endorse_1"/></td></tr>
						  <tr><td><dmf:label datafield="endorse_2"/></td></tr>
						  <tr><td><dmf:label datafield="endorse_3"/></td></tr>
						  <tr><td><dmf:label datafield="endorse_4"/></td></tr>
						  <tr><td><dmf:label datafield="endorse_5"/></td></tr>
						</table>  
					</td>
					<td>
					<table>
						  <tr><td><dmf:label datafield="approve_1"/></td></tr>
						  <tr><td><dmf:label datafield="approve_2"/></td></tr>
						  <tr><td><dmf:label datafield="approve_3"/></td></tr>
						  <tr><td><dmf:label datafield="approve_4"/></td></tr>
						  <tr><td><dmf:label datafield="approve_5"/></td></tr>
						</table>
					</td>
					<td>
						<table>
						  <tr><td><dmf:label datafield="inform_1"/></td></tr>
						  <tr><td><dmf:label datafield="inform_2"/></td></tr>
						  <tr><td><dmf:label datafield="inform_3"/></td></tr>
						  <tr><td><dmf:label datafield="inform_4"/></td></tr>
						  <tr><td><dmf:label datafield="inform_5"/></td></tr>
						</table>
					</td>
				</dmf:datagridRow>		 
				<dmf:nodataRow>
			      <TD nowrap colspan='7'>
					<dmf:label name='lblNoDocs' nlsid='MSG_NO_DATA' />
			      </TD>
				</dmf:nodataRow>	
	 			</TABLE>
	
				</dmf:datagrid>
			</td>
			</tr>
		</table>
		</tr>

         </td>
      </tr>
   </table>
   &nbsp;
   </dmf:form>
   </dmf:body>
</dmf:html>

