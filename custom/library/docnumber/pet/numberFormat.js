/*
* This script provides client side refresh of editContent.jsp
* Add and Remove buttons update listbox display and maintain
* code and description values.
* 7 hidden fields are used:
* hiddenValues -containing listbox display values (code + "-" + description)
* hiddenCode - containing current code values
* hiddenDesc - containing current desc values
* hiddenAddCode - containing codes that have been added (maintained by remove)
* hiddenAddDesc - containing descs that have been added (maintained by remove)
* hiddenRemoveCode - containing codes that have been removed
* hiddenRemoveDesc - containing descs that have been removed
*/

var BLANK = "_$!#^BLANK";

//method moves data from code and desc to listbox updating hidden fields
function onAddValue(obj)
{
	//get text controls
	var codetext = document.getElementById("code");
	var desctext = document.getElementById("desc");
	var hiddencodes = document.getElementById("hiddenCode");
	var hiddendescs = document.getElementById("hiddenDesc");
	var hiddenvalues = document.getElementById("hiddenValues");
	var hiddenaddcodes = document.getElementById("hiddenAddCode");
	var hiddenadddescs = document.getElementById("hiddenAddDesc");
	
	//clear errors
	var elem = document.getElementById("adderror");
	elem.firstChild.nodeValue = "";//String.fromCharCode(nbsp); 

	//add values to codes and desc hidden texts
 	var strNewCode = codetext.value;
	if (strNewCode.length > 0)
	{
		var strNewDesc = desctext.value;
		//do some sneaky stuff if no description
		if (strNewDesc.length == 0)
		{
			strNewDesc = BLANK;
		}
		var strCodes = hiddencodes.value + "\n" + strNewCode;
		hiddencodes.value = strCodes;
		var strDescs = hiddendescs.value + "\n" + strNewDesc;
		hiddendescs.value = strDescs;
		
		//add to list of added values
		var strAddCodes = hiddenaddcodes.value;
		var strAddDescs = hiddenadddescs.value;
		
		if (strAddCodes.length > 0)
		{
			strAddCodes = strAddCodes + "\n" + strNewCode;
			strAddDescs	= strAddDescs + "\n" + strNewDesc;
		}
		else
		{	
			strAddCodes = strNewCode;
			strAddDescs = strNewDesc;
		}
		hiddenaddcodes.value = strAddCodes;
		hiddenadddescs.value = strAddDescs;
	
		//clear text fields	
		codetext.value = "";
		desctext.value = "";
		
		//update hidden text that renders listbox
		if(strNewDesc == BLANK)
		{
			//change back for display
			strNewDesc = "";
		}
		var newListOption = hiddenvalues.value + "\n" + strNewCode + " - " + strNewDesc;
		hiddenvalues.value = newListOption;
		
		//update list box
		initListbox();
	}
	else
	{
		//should display a message here prolly..
		elem.firstChild.nodeValue = "Code value cannot be empty"; // "<dmf:label nlsid=\"MSG_INVALID_CODE\">";
	}

}

//removes value from listbox and places in code and desc for editing, updating hidden fields
function onClickRemove(obj)
{
	//get text controls
	var listbox = document.getElementById("contentvalues");
	var codetext = document.getElementById("code");
	var desctext = document.getElementById("desc");
	
	//clear errors
	var elem = document.getElementById("adderror");
	elem.firstChild.nodeValue = "";//String.fromCharCode(nbsp); 
	
	var index = 0;
	//remove selected item from listbox
	for (var i=listbox.length-1; i>=0 ; i--)
	{
		if (listbox.options[i].selected)
		{
			index = i;
			//remove entry from list box
			listbox.options[i] = null;		
		}
	}
	//remove values from hidden	
	var strCode = remove(index, "hiddenCode");
	var strDesc = remove(index, "hiddenDesc");
	//sneaky blank substitution
	if (strDesc.length == 0)
	{
		strDesc = BLANK;
	}
	var strListbox = remove(index,"hiddenValues");
	
	//update the add hidden fields (noting may be duplicates in descs)
	var removeIndex = removeValue(strCode,"hiddenAddCode");
	if (removeIndex > -1)
	{
		remove(removeIndex,"hiddenAddDesc");
	}
	//add to list of removed values
	var hiddenremovecodes = document.getElementById("hiddenRemoveCode");
	var hiddenremovedescs = document.getElementById("hiddenRemoveDesc");
	var strRemoveCodes = hiddenremovecodes.value;
	var strRemoveDescs = hiddenremovedescs.value;
	if (strRemoveCodes.length > 0)
	{
		strRemoveCodes = strRemoveCodes + "\n" + strCode;
		strRemoveDescs = strRemoveDescs + "\n" + strDesc;
	}
	else
	{
		strRemoveCodes = strCode;
		strRemoveDescs = strDesc;
	}
	hiddenremovecodes.value = strRemoveCodes;
	hiddenremovedescs.value = strRemoveDescs;
	
	//move to code and desc for editing
	codetext.value = strCode;
	//more sneaky substitution
	if(strDesc == BLANK)
	{
		strDesc = "";
	}
	desctext.value = strDesc;
	
	//update listbox
	initListbox();
}	

//renders contentvalues listbox options from hidden text field
function initListbox()
{
	var listbox = document.getElementById("contentvalues");
	
	for(var i = listbox.length-1;i>=0; i--)
	{
		listbox.options[i] = null;
	}

	var strHiddenText = document.getElementById("hiddenValues").value;
	var lineDelimiter;
	if (document.all)
	{
		lineDelimiter = '\r'
	}
	else
	{
		lineDelimiter = '\n'
	}
	var iFrom = 0;
	var iTo = 0;
	var j = 0;
	while (iTo < strHiddenText.length && iFrom < strHiddenText.length)
	{
		iTo = strHiddenText.indexOf(lineDelimiter, iFrom);
		if (iTo == -1)
		{
			iTo = strHiddenText.length;
		}
		if (iTo > iFrom)
		{
			var strOption = strHiddenText.substring(iFrom, iTo);
			// strip leading or trailing '\r' or '\n' characters
			while (strOption.length > 0 && (strOption.charAt(0) == '\r' || strOption.charAt(0) == '\n'))
			{
				strOption = strOption.substring(1);
			}
			while (strOption.length > 0 && (strOption.charAt(strOption.length - 1) == '\r' || strOption.charAt(strOption.length - 1) == '\n'))
			{
				strOption = strOption.substring(0, strOption.length - 1);
			}
			if (strOption.length > 0)
			{
				//formElement.attrvalue.options[j] = new Option(strOption, strOption);
				listbox.options[j] = new Option(strOption, strOption);
				j++;
			}
		}
		iFrom = iTo + 1;
	}
}

//loops through hidden text control, removing value at specified index
function remove(index, strControlName)
{
	var hiddenControl= document.getElementById(strControlName);
	var strHiddenText = hiddenControl.value;
	var strRemoved = "";
	var strNewText = "";
	
	var lineDelimiter;
	if (document.all)
	{
		lineDelimiter = '\r'
	}
	else
	{
		lineDelimiter = '\n'
	}
	var iFrom = 0;
	var iTo = 0;
	var j = 0;
	while (iTo < strHiddenText.length && iFrom < strHiddenText.length)
	{
		iTo = strHiddenText.indexOf(lineDelimiter, iFrom);
		if (iTo == -1)
		{
			iTo = strHiddenText.length;
		}
		if (iTo > iFrom)
		{
			var strOption = strHiddenText.substring(iFrom, iTo);
			// strip leading or trailing '\r' or '\n' characters
			while (strOption.length > 0 && (strOption.charAt(0) == '\r' || strOption.charAt(0) == '\n'))
			{
				strOption = strOption.substring(1);
			}
			while (strOption.length > 0 && (strOption.charAt(strOption.length - 1) == '\r' || strOption.charAt(strOption.length - 1) == '\n'))
			{
				strOption = strOption.substring(0, strOption.length - 1);
			}
			
			if (strOption.length > 0)
			{
				if(j == index)
				{
					strRemoved = strOption;
				}
				else
				{
					strNewText = strNewText + strOption + "\n";
				}
				j++;
			}
		}
		iFrom = iTo + 1;
	}
	hiddenControl.value = strNewText;
	return strRemoved;
}

//loops through hidden text controls, removing specified value
function removeValue(strRemove, strControlName)
{
	var hiddenControl= document.getElementById(strControlName);
	var strHiddenText = hiddenControl.value;
	var strNewText = "";
	var returnIndex = -1;
	
	var lineDelimiter;
	if (document.all)
	{
		lineDelimiter = '\r'
	}
	else
	{
		lineDelimiter = '\n'
	}
	var iFrom = 0;
	var iTo = 0;
	var j = 0;
	while (iTo < strHiddenText.length && iFrom < strHiddenText.length)
	{
		iTo = strHiddenText.indexOf(lineDelimiter, iFrom);
		if (iTo == -1)
		{
			iTo = strHiddenText.length;
		}
		if (iTo > iFrom)
		{
			var strOption = strHiddenText.substring(iFrom, iTo);
			// strip leading or trailing '\r' or '\n' characters
			while (strOption.length > 0 && (strOption.charAt(0) == '\r' || strOption.charAt(0) == '\n'))
			{
				strOption = strOption.substring(1);
			}
			while (strOption.length > 0 && (strOption.charAt(strOption.length - 1) == '\r' || strOption.charAt(strOption.length - 1) == '\n'))
			{
				strOption = strOption.substring(0, strOption.length - 1);
			}
			
			if (strOption.length > 0)
			{
				if(strOption == strRemove)
				{
					//do nothing
					returnIndex = j;
				}
				else
				{
					strNewText = strNewText + strOption + "\n";
				}
				j++;
			}
		}
		iFrom = iTo + 1;
	}
	hiddenControl.value = strNewText;
	return returnIndex;
}

//enables and disables add button dependent on code being populated - NOT USED
function check(obj)
{
	if(obj.value=="")
	{
		document.getElementById("add").enabled=false;
	}
	else
	{
		document.getElementById("add").enabled=true;
	}
}





