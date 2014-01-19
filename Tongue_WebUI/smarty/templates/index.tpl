{include file="header.tpl"}
<table width="100%">
    <tr>
        <td colspan="2" style="height: 40px">
            <h4 style="text-align: center">Tongue Media Streaming Server</br>
                Tongue Server is currently: {$tongue_status}</br>
                FFserver is currently: {$ffserver_status}</br>
                </h4>
        </td>
    </tr>
    <tr>
        <td id="leftcolumn" style="vertical-align: top;width: 100px">
            <p><li>[ <a class="links" href="javascript:ajaxpage('opt/shows.php', 'rightcolumn');">Shows</a> ]</li></p>
            <p><li>[ <a class="links" href="javascript:ajaxpage('opt/movies.php', 'rightcolumn');">Movies</a> ]</li></p>
        </td>
        <td id="rightcolumn" align="left"><h3>Choose a Media Type to start your journey.</h3></td>
    </tr>
</table>
{include file="footer.tpl"}