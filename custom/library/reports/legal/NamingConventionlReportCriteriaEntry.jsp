<%@ page import="com.documentum.web.form.Form"%>
<%@ page contentType="text/html"%>
<%@ page errorPage="/wdk/errorhandler.jsp"%>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>

<dmf:html>
	<dmf:head>
		<dmf:webform/>
	</dmf:head>
	<dmf:body>
		<dmf:form>
		<dmf:hidden name='hdnObjId'/>
		<table>
		    <tr>
		       <td>
	   			<dmf:label nlsid="MSG_THRESHOLD"/>:&nbsp; <dmf:text name="namelengththreshold" size="5"/>   			
  			    <dmf:rangevalidator name="namelengthvalidator" controltovalidate="namelengththreshold" type="integer" minvalue="1" maxvalue="999" nlsid='MSG_INVALID'/>
   			<br/><br/>
   			</td>
   		    </tr>
		   <dmf:panel name='noResultPane' visible="false">
			     <tr>
				<td>
				  <b>
				  <dmf:label nlsid="MSG_NORESULT"/>
				  </b>
				 </td>
			     </tr>

			</dmf:panel>

   		 </table>
		</dmf:form>
	</dmf:body>
</dmf:html>
