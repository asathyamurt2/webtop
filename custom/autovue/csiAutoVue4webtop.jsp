<%
//
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ page import="com.documentum.fc.client.IDfSession" %>
<%@ page import="com.documentum.fc.client.IDfSessionManager" %>
<%@ page import="com.documentum.fc.client.IDfSysObject" %>
<%@ page import="com.documentum.fc.common.DfId" %>
<%@ page import="com.documentum.web.formext.session.SessionManagerHttpBinding" %>
<%@ page import="java.util.Locale" %>


<%
    try {
	    String strDocBase = request.getParameter("docbase");
	    String assetID = request.getParameter("aID");
		String workflowID = request.getParameter("wID");
		String objectID= request.getParameter("objectID");
		String embedded = request.getParameter("embedded");
		String strUsername = "";
		String guiFile = request.getParameter("guiFile");
    	boolean fromOEVF = false;
    	if( (assetID != null && assetID.length() >0) || (workflowID != null && workflowID.length() >0) ){
	    		fromOEVF = true;
    	}
    	
    	String acceptLanguage = request.getHeader("Accept-Language"); //i18n
    	if (acceptLanguage == null) {
    		acceptLanguage = Locale.getDefault().toString();
    	}
    	if (acceptLanguage.length()>2) {
    		acceptLanguage = acceptLanguage.substring(0,2);  //jvue only accepts language part not the country
    	}
    	// This is the only string to be updated when installing 
	
        String sJVueServer = "petpoa-web01.emea.ent.bhpbilliton.net:5099";
        
        String sHost = request.getHeader("Host"); 
		String sScheme = request.getScheme();
		String sProHost = sScheme + "://" + sHost;
		
		StringBuffer strAppletMsg = new StringBuffer(sProHost);
		String strContextPath = request.getContextPath();  
        
        if(!fromOEVF){
		//get the session Manager
		IDfSessionManager sessionManager = SessionManagerHttpBinding.getSessionManager();
		IDfSession dfSession = null;
		
		//get the current Docbase name and session
		dfSession = sessionManager.getSession(SessionManagerHttpBinding.getCurrentDocbase());

		String strObjectId = request.getParameter("objectId");
		String strRendition = request.getParameter("rendition");
		if ( strRendition == null ) {
		// For rendition page, the parameter is using "contentType"
		    strRendition = request.getParameter("contentType");
		}

		if((strRendition == null) || (strRendition.indexOf("csiMetafile") == 0)) 
		{
		    //1- If the rendition is not set, using the default format for it
		    //2- For Metafile renditions, the top base file is used instead.
		    // Retrieve Object
		    IDfSysObject iObject = (IDfSysObject)dfSession.getObject(new DfId(strObjectId));
		    strRendition = iObject.getContentType();
		    if ( strRendition == null)
		    {
			throw new IllegalArgumentException("argument rendition is mandatory");
		    }
		}

		String attribKey = "" + System.currentTimeMillis();
		ServletContext sc = pageContext.getServletContext();
		strUsername = dfSession.getLoginUserName();
		String strDMW_DOCBASE = dfSession.getDocbaseName();
		String sessionid = dfSession.getSessionId();

		// save the object into session
		sc.setAttribute(attribKey, dfSession);
		
		//strAppletMsg.append("/Webtop6?userName=");
		//strAppletMsg.append(strUsername);
		
		strAppletMsg.append("/Webtop6?");
		strAppletMsg.append("docbase=");
		strAppletMsg.append(strDMW_DOCBASE);
		strAppletMsg.append("&sessionid=");
		strAppletMsg.append(sessionid);
		strAppletMsg.append("&objectid=");
		strAppletMsg.append(strObjectId);
		strAppletMsg.append("&rendition=");
		strAppletMsg.append(strRendition);
		strAppletMsg.append("&DmTicketID=");
		strAppletMsg.append(attribKey);
        }else{
        	if ( (objectID == null || objectID.length()<1) 
			&& (assetID == null || assetID.length()<1) 
			&& (workflowID == null || workflowID.length()<1) ) {
			out.print("<center>No objectid, aID or wID</center>");
			return;
		}
		
	
		strAppletMsg.append("/Webtop6?");
		strAppletMsg.append("objectid=");
		strAppletMsg.append(objectID);
		strAppletMsg.append("&docbase=");
		strAppletMsg.append(strDocBase);
		strAppletMsg.append("&aID=");
		strAppletMsg.append(assetID);
		strAppletMsg.append("&wID=");
		strAppletMsg.append(workflowID);
				
			
		String EditMode = request.getParameter("EditMode");
		
		
		// if aID is given without wID, decide on guiFile of view or edit based on EditMode
		if ( (assetID != null && assetID.length()>0 ) && (workflowID == null || workflowID.length()<1) ) { 
			if ("1".equalsIgnoreCase(EditMode)) {  
				guiFile="assetEdit.gui";
			} else {
				guiFile="assetView.gui";
			}
		}
		
			
		// we still going to pass EditMode for ReadOnly option in markup list
		strAppletMsg.append("&EditMode=");
		strAppletMsg.append(EditMode);
        }
   
        String sJVueHost = "socket://" + sJVueServer;
        sJVueHost += ";" + sProHost + strContextPath + "/servlet/VueServlet";

        String sDMS = sProHost +  strContextPath + "/com.cimmetry.vuelink.documentum.DMS";
        String sjVue = strContextPath + "/custom/jvue";
%>

<html>
<head>
<title>Powered by AutoVue</title>
<meta http-equiv=Content-Type content="text/html; charset=UTF-8">
</head>

<body marginheight="0" marginwidth="0">

<script language="JavaScript">
<!-- hide script from old browsers

    var PROG = "<APPLET-MODE>";
    var Embeded = '<%= embedded %>';
    var FromOEVF = '<%= fromOEVF %>';
       
        
    // if from OEVF, embedded value will overwrite the valur from VL installer
    if(FromOEVF == "true"){
    	if(Embeded == "1"){
    		PROG = "EMBEDDED";
    	}else if(Embeded == "0"){
    		PROG = "seperated";
    	}
    }
    

    if (PROG == "EMBEDDED" ) {
        CreateEmbeddedApplet();
    } else {
        CreateApplet();
    }
    
    
    //dummy function
    function dummy() {}
 
    // Function CreateApplet() - Creates the HTML code for the Applet
    function CreateApplet()
    {
        var CODEBASE = '<%= sjVue %>';
        var FILENAME = '<%= strAppletMsg.toString()  %>';
        var JVUESERVER = '<%= sJVueHost %>';
        var DMS = '<%= sDMS  %>';	
        var USERNAME = '<%= strUsername %>';
        var GUIFILE = '<%=guiFile%>';
        var FROMOEVF = '<%=fromOEVF%>';
    
        // Open AutoVue Applet in separate window
        appletWnd = window.open("", "__JVUEWINDOW__", 'resizable=1,width=700,height=600,location=0,menubar=0');
        appletWnd.focus();
        if (appletWnd != null) {
            appletWnd.focus();
            var doc = appletWnd.document;
            // If AutoVue Applet window exist, set file.
            var japplet = doc.applets["JVue"];
            if (japplet != null) {
            	if (GUIFILE != 'null') {
					japplet.setGUI(GUIFILE);
				}else {
					japplet.setGUI(''); //testing
				}
                japplet.setFileThreaded(FILENAME);
            } else {
                appletWnd.moveTo(0,0);

                // Fix for Java Plugin on IE only
                if (doc.readyState != null) {
                    // alert('Document not ready '+ doc.readyState);
                    var i = 0;
                    while ( i < 100 && doc.readyState != "complete" ) {
                        appletWnd.setTimeout('dummy()', 1000);
                        i++;
                    }
                }

                // Otherwise, create new AutoVue Applet page
                var jVuePage =  '<' + 'HTML>\n' +
                                '<' + 'HEAD>\n' +
                                '<TITLE>Powered by AutoVue</TITLE>\n'  +
                                '<META HTTP-EQUIV="content-type" CONTENT="text/html;charset=UTF-8">\n' +
                                '<' + '/HEAD>\n' +
                                
                                '\n<script' +' language="JavaScript">' +
				'\n <!-' + '- hide script from old browsers' +
				'\n    function SaveMarkups() { ' +
				'\n     window.document.applets["JVue"].destroy(true); ' +
				'\n    }' +
				'\n //-' + '-> ' +
				'\n</script' + '> ' +

                                 '<' + 'BODY marginheight="1" marginwidth="0" leftmargin="0" topmargin="0" scroll="no" onUnload="SaveMarkups()">\n' +

                               '<APPLET\n' +
                                    'NAME="JVue"\n' +
                                    'CODE="com.cimmetry.jvue.JVue.class"\n' +
                                    'CODEBASE=' + CODEBASE + '\n' +
                                    'ARCHIVE="jvue.jar,jogl.jar,gluegen-rt.jar"\n' +
                                    'HSPACE="0" VSPACE="0"\n' +
                                    'WIDTH="100%" HEIGHT= "100%"    MAYSCRIPT>\n' +
                                    '<PARAM NAME="EMBEDDED"         VALUE="true">\n' +
                                    '<PARAM NAME="VERBOSE"          VALUE="false">\n'+ 
                                    '<PARAM NAME="HEAVYWEIGHT" VALUE="FALSE">\n';
               		
               		if (GUIFILE != 'null') {
		     		jVuePage += "\n<PARAM NAME=\"GUIFILE\" VALUE=\"" + GUIFILE + "\">";
			}
		        jVuePage += '<PARAM NAME="FILENAME"         VALUE="' + FILENAME + '">\n' +
                                    '<PARAM NAME="JVUESERVER"       VALUE="' + JVUESERVER + '">\n' +
                                    '<PARAM NAME="DMS"              VALUE="' + DMS + '">\n' +
                                    
	                            '<PARAM NAME="DMSARGS" VALUE="DMS_PRESERVE_COOKIES;FROMOEVF;LOCALE">\n' +
	                            '<PARAM NAME="DMS_PRESERVE_COOKIES" VALUE="true">\n' +
	                            '<PARAM NAME="FROMOEVF" VALUE="' + FROMOEVF + '">\n' +
  	                            '<PARAM NAME="LOCALE" VALUE="<%=acceptLanguage%>">\n' +
                                    '<p><b>Requires a browser that supports Java.</b></p>\n' +
                               '</APPLET>\n'

                                '<' + '/BODY>\n' +
                                '<' + '/HTML>\n';

                if (!appletWnd.closed) {
                    doc.open();
                    doc.writeln(jVuePage);
                    doc.close();
                }
            }
        }
        history.back();
    }
    
    // Function CreateEmbeddedApplet() - Creates the HTML code for the Applet
    function CreateEmbeddedApplet()
    {
        var CODEBASE = '<%= sjVue %>';
        var FILENAME = '<%= strAppletMsg.toString()  %>';
        var JVUESERVER = '<%= sJVueHost %>';
        var DMS = '<%= sDMS  %>';	
        var USERNAME = '<%= strUsername %>';
        var GUIFILE = '<%=guiFile%>';
        var FROMOEVF = '<%=fromOEVF%>';
        
        var appletWnd = self;
        var doc = appletWnd.document;
    
        doc.writeln('<HTML>');
        doc.writeln('<HEAD>');
        doc.writeln('<TITLE>Powered by AutoVue</TITLE>');
        doc.writeln('<META HTTP-EQUIV="content-type" CONTENT="text/html;charset=UTF-8">');
        doc.writeln('</HEAD>');
        
        doc.writeln('\n<script' +' language="JavaScript">' +
		'\n <!-' + '- hide script from old browsers' +
		'\n    function SaveMarkups() { ' +
		'\n     window.document.applets["JVue"].destroy(true); ' +
		'\n    }' +
		'\n //-' + '-> ' +
		'\n</script' + '> ');

        doc.writeln('<BODY marginheight="1" marginwidth="0" leftmargin="0" topmargin="0" scroll="no" onUnload="SaveMarkups()">');
    
    
        <!-- BEGIN AutoVue Applet -->
        doc.writeln('<APPLET');
        doc.writeln('NAME="JVue"');
        doc.writeln(' CODE="com.cimmetry.jvue.JVue.class"');
        doc.writeln(' ARCHIVE="jvue.jar, jogl.jar,gluegen-rt.jar"');
        doc.writeln(' CODEBASE="' + CODEBASE + '"');
        doc.writeln(' HSPACE="0"');
        doc.writeln(' VSPACE="0"');
        doc.writeln(' WIDTH=100% HEIGHT=100% MAYSCRIPT>');
        doc.writeln('<PARAM NAME="EMBEDDED" VALUE="TRUE">');
        doc.writeln('<PARAM NAME="VERBOSE" VALUE="FALSE">');
        doc.writeln('<PARAM NAME="HEAVYWEIGHT" VALUE="FALSE">');
        if (GUIFILE != 'null') {
        	doc.writeln('<PARAM NAME="GUIFILE" VALUE="' + GUIFILE + '">');
	}
        
        doc.writeln('<PARAM NAME="FILENAME" VALUE="' + FILENAME + '">');
        doc.writeln('<PARAM NAME="JVUESERVER" VALUE="'+ JVUESERVER + '">');
        doc.writeln('<PARAM NAME="DMS" 	VALUE="' + DMS + '">' );
        
        doc.writeln('<PARAM NAME="DMSARGS" VALUE="DMS_PRESERVE_COOKIES;FROMOEVF;LOCALE">');
        doc.writeln('<PARAM NAME="DMS_PRESERVE_COOKIES" VALUE="true">');
        doc.writeln('<PARAM NAME="FROMOEVF" VALUE="' + FROMOEVF + '">');
        doc.writeln('<PARAM NAME="LOCALE" VALUE="<%=acceptLanguage%>">');
        doc.writeln('</APPLET>');
    
        doc.writeln('</BODY>');
        doc.writeln('</HTML>');
        doc.close();
    }    

// end script hiding from old browsers -->
</script>

</body>
</html>

<%
} catch (Exception e) {
	out.print(e.getMessage());
} finally {
    //if (dfSession != null) {
        // sessionManager.release(dfSession);
    //}
}
%>
