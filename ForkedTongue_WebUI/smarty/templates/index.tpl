{include file="header.tpl"}
{literal}
<script type="text/javascript">

    /***********************************************
     * Dynamic Ajax Content- Â© Dynamic Drive DHTML code library (www.dynamicdrive.com)
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
            try {
                page_request = new ActiveXObject("Msxml2.XMLHTTP")
            }
            catch (e) {
                try{
                    page_request = new ActiveXObject("Microsoft.XMLHTTP")
                }
                catch (e) {
                }
            }
        }
        else
            return false
        page_request.onreadystatechange=function(){
            loadpage(page_request, containerid)
        }
        page_request.open('GET', url, true)
        page_request.send(null)
    }

    function loadpage(page_request, containerid){
        if (page_request.readyState == 4 && (page_request.status==200 || window.location.href.indexOf("http")==-1))
            document.getElementById(containerid).innerHTML=page_request.responseText
    }

    function popitup(url) {
        newwindow=window.open(url,'Video Player','height=500,width=720');
        if (window.focus) {newwindow.focus()}
        return false;
    }
</script>
{/literal}

<table width="100%">
    <tr>
        <td colspan="2" style="height: 40px">
            <h4 style="text-align: center">Tongue Video Streaming Server</br>
                Tongue Server is currently: {$tongue_status}</br>
                FFserver is currently: {$ffserver_status}</br>
                </h4>
        </td>
    </tr>
    <tr>
        <td id="leftcolumn" style="vertical-align: top;width: 90px">
            [ <a class="links" href="javascript:ajaxpage('shows.php', 'rightcolumn');">Shows</a> ]
        </td>
        <td id="rightcolumn" align="center"><h3>Choose a Media Type to start your journey.</h3></td>
    </tr>
</table>
{include file="footer.tpl"}