
//method moves data from code and desc to listbox updating hidden fields
registerClientEventHandler(null, "onChangeDocType",onChangeDocType);
function onChangeDocType(args)
{
var row = document.getElementById("viewdoctype");
row.style.display = '';
}

registerClientEventHandler(null, "onRevertDocType",onRevertDocType);
function onRevertDocType(args)
{
var row = document.getElementById("viewdoctype");
row.style.display = 'none';
}




