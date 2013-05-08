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
			<dmf:label name='errorLbl' nlsid="MSG_ENDDATE_INVALID" visible = 'false' style="color:red"/>
			</tr>
			<dmf:panel name ='conditionPane'>
				<tr>
					<td>
			   			<dmf:label nlsid="MSG_STARTDATE"/> <dmf:dateinput name="startdate" dateformat="medium"/>
   					</td>
   					<td>
   					<dmf:datevalidator name="startdatevalidator" controltovalidate="startdate" nlsid="MSG_INVALID_DATE"/>
   					</td>
				</tr>
   				<tr>
					<td>
			   			<dmf:label nlsid="MSG_ENDDATE"/>  <dmf:dateinput name="enddate" dateformat="medium"/>
   					</td>
   					<td>
   					<dmf:datevalidator name="enddatevalidator" controltovalidate="enddate" nlsid="MSG_INVALID_DATE"/>
   					</td>
				</tr>
			</dmf:panel>
			<dmf:panel name='noResultPane' visible='false'>
			     <tr>
			     	<td>
			     	  <br/>
			     	  <b>
			     	  <dmf:label nlsid="MSG_NORESULT"/>
			     	  </b>
			     	 </td>
			     </tr/>
			    
			</dmf:panel>
			</table>
		</dmf:form>
	</dmf:body>
</dmf:html>
