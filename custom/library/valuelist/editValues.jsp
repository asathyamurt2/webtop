<!-- 
Component: COM_U02 Value List Maintenance
Author: Sudha Madheswaran
Date: June 2007
Desc:
Allows To add ,modify and delete a row of a selected attribute's corresponding register table.
 -->
 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ page import="com.documentum.web.form.Form" %>
<%@ page import="com.documentum.web.form.control.databound.*" %>
<%@ page import="com.documentum.web.form.control.*,java.util.List" %>
<%@ page import="com.bhpb.imp.wdk.webtop.valuelist.EditListValues" %>

<dmf:webform/>
<%
	EditListValues editListValue = (EditListValues)pageContext.getAttribute(Form.FORM, PageContext.REQUEST_SCOPE);
	int colCount = editListValue.getColCount();
	List colList = editListValue.getColList();
	int rowCount = 0;
%>

<dmf:form>
	
	<table border="0" bordercolor="green">
		<tr>
			<td>
				<dmf:hidden id ='hdnAddedRow' name="<%=EditListValues.HIDDEN_ADD_ROW%>"/>
				<dmf:label name='<%=EditListValues.DUPLICATE_ERROR_LABEL%>' cssclass="validatorMessageStyle" visible='false'/>
				<dmf:label name='<%=EditListValues.BLANK_ERROR_LABEL%>' cssclass="validatorMessageStyle" visible='false'/>
			</td>
		</tr>
	</table>

	<table border="0" bordercolor="blue">
	<!-- MKM bug 485 heading row -->
		<tr>
			<td></td>
			<%
			      for(int i = 0; i < colCount ; i++)
			      {
				    	      
			%>
			<td align="left"><i><dmf:label name='<%=EditListValues.ADD_HEADING_LABEL+i%>'/></i></td>
			<%
			    }
			%>
			<td></td>
		</tr>
	<!-- end MKM -->

		<tr  align='left'>
			<td></td>
 			<%
      			for(int i = 0; i < colList.size() ; i++)
      			{
      				String ctrlType = ((String[])colList.get(i))[1];
	    			if (ctrlType.equalsIgnoreCase(EditListValues.COL_TYPE_TEXT))
	    			{
	    	%>
			<TD><dmf:text name='<%=EditListValues.TEXT_CTRL+i%>' size='22'/></TD>
			
		<!-- JA 09/2008 Start DropDownLists for GLD -->		
			<%
			    	}
			    	else if (ctrlType.equalsIgnoreCase(EditListValues.COL_TYPE_DROP_DOWN))
			    	{
			    		String query = ((String[])colList.get(i))[2];
			%>
		
	  		<TD><dmf:datadropdownlist name='<%=EditListValues.DROP_DOWN_CTRL+i%>' width="200" query='<%=query%>'>
	  		    <dmf:option value="" label=""/>
		  			<dmf:dataoptionlist>
						<dmf:option datafield="fieldvalue1" labeldatafield="fieldlabel1"/>
					</dmf:dataoptionlist>
				</dmf:datadropdownlist>
	  		</TD>
			<%      
	    			}
	  			}
			%>
		<!-- JA end -->
		
			<td align="right"><dmf:button name='add' cssclass='buttonLink' nlsid="MSG_ADD" onclick='onAdd' height='16' imagefolder='images/dialogbutton'/></td>
		</tr>
	</table>

	<table border='0' bordercolor='red' cellpadding='0' cellspacing='0' align='left' >
		<tr>
			<td  align='left'>
				<dmf:datagrid name='<%=EditListValues.REG_TABLE_GRID%>'  paged='true' preservesort='true' bordersize='0' width='100%'>
				<tr><td width="100%">
				
				<table border='0' bordercolor='green' cellpadding='0' cellspacing='0'>
					<tr  class='pagerBackground'>
						<td align='middle' nowrap><dmf:datapaging name='pager1' gotopageclass='doclistPager'/></td>
						<td align='right' nowrap valign="middle"><dmf:label nlsid='MSG_SHOW_ITEMS'/>&nbsp;</td>
						<td valign="middle" nowrap><dmf:datapagesize name='datapagesize' preference='application.display.classic' tooltipnlsid='MSG_SHOW_ITEMS' pagesizevalues='5,10,25,50'/></td>
					</tr>
				</table>
				</td></tr>
				<tr><td>

				<TABLE cellpadding='0' align='left' cellspacing='0' border='0' bordercolor='brown'>
					<TR>
						<th><!-- buttons heading -->&nbsp;</th>
	    					<%
								int width = 100/colCount;
								for(int i = 0; i < colCount ; i++)
								{
						    %>
						<TH align='left' nowrap>
							&nbsp;&nbsp;
							<dmf:label name='<%=EditListValues.HEADING_LABEL+i%>'/>
							&nbsp;&nbsp;
						</TH>
						     <%
						    	}
						     %>
					</TR>
					
				<dmf:datagridRow>
				     <%
							if(editListValue.isRowDeleted(rowCount))
							{
					%>
					<TD  align='left'><dmf:button name='<%="deleteBtn"+rowCount%>' label="Delete" onclick="onDelete" enabled = 'false'/>&nbsp;	
					<dmf:button name='<%=""+rowCount++%>' label="Update" onclick="onUpdate" enabled = 'false'/></td>	
					<%
					 		}
					 		else
					 		{
					%>	
					<TD  align='left'><dmf:button name='<%="deleteBtn"+rowCount%>' label="Delete" onclick="onDelete"/>&nbsp;
					<dmf:button name='<%=""+rowCount++%>' label="Update" onclick="onUpdate"/></td>	
					<%
							 }
	 				%>
	    
	    			<%	
							for(int i = 0; i < colCount ; i++)
					      	{
					%>
			
					<TD align='left'><dmf:label id= '<%=""+rowCount%>' name='<%=""+i%>' datafield='<%=((String[])colList.get(i))[0]%>'/></TD>
					<%
							}
				    %>
				   
			

				</dmf:datagridRow>
			
				
				

			 <dmf:nodataRow>
			      <TD nowrap colspan="2">
					<dmf:label name='lblNoDocs' nlsid='MSG_NO_DATA' />
			      </TD>
			</dmf:nodataRow>
		
			</table>
			</td></tr>
			
			</dmf:datagrid>
		</td>
	</tr>
</table>
</dmf:form>
