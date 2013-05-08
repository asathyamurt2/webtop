/*
* This script provides client side validation in editdocnumberbase.jsp
* When the lifecycle none state is selected, the workflow checkbox is
* disabled.  When draft or approved states are selected the checkbox
* is enabled.
*/


//method moves data from code and desc to listbox updating hidden fields
function onClickRadio(obj)
{
	//check radio control for none and enable or disable
	//worfklow checkbox control accordingly
	var noneRadio = document.getElementById("lifecyclestate");
	var workflowCheckbox = document.getElementById("workflowcheckbox");
	
	if(noneRadio.checked)
	{
		workflowCheckbox.checked=false;
		workflowCheckbox.disabled = true;
	}
	else
	{
		workflowCheckbox.disabled = false;	
	}
}




