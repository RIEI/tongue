/***********************************************
* Dynamic Ajax Content- © Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/
function ajaxpage(url, containerid)
{
    var page_request = false;
    if (window.XMLHttpRequest) // if Mozilla, Safari etc
    {
        page_request = new XMLHttpRequest()
    }
    else if (window.ActiveXObject)
    {
        // if IE
        try
        {
            page_request = new ActiveXObject("Msxml2.XMLHTTP")
        }
        catch (e)
        {
            try
            {
                page_request = new ActiveXObject("Microsoft.XMLHTTP")
            }
            catch (e)
            {}
        }
    }
    else
        return false
        page_request.onreadystatechange=function()
        {
            loadpage(page_request, containerid)
        }
        page_request.open('GET', url, true)
        page_request.send(null)
}

function loadpage(page_request, containerid)
{
    if (page_request.readyState == 4 && (page_request.status==200 || window.location.href.indexOf("http")==-1))
    document.getElementById(containerid).innerHTML=page_request.responseText
    if(containerid == 'seasoncolumn')
    {
        document.getElementById('episodecolumn').innerHTML=''
        document.getElementById('episode_details').innerHTML=''
    }
    if(containerid == 'episodecolumn')
    {
        document.getElementById('episode_details').innerHTML=''
    }
}

function popitup(url) {
    newwindow=window.open(url,'Video Player','height=500,width=720');
    if (window.focus)
    {
        newwindow.focus()
    }
    return false;
}