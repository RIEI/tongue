{include file="header.tpl"}
    <div align="Center">
        <table>
            <tbody>
            <tr>
                <td colspan="3" class="index_header">
                    <h4 class="index_header">Tongue Media Streaming Server</br>
                        Tongue Server is currently: {$tongue_status}</br>
                        FFserver is currently: {$ffserver_status}</br>
                        </h4>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div id="wrapperDiv">
        <table class="main_table">
            <tbody>
            <tr>
                <td id="leftcolumn" class="index_contents_col">
                    <div id="index_column">
                        <ul>
                            <li id="showslinkli" >[ <a id="showslink" href="javascript:ajaxpage('opt/shows.php', 'rightcolumn');">Shows</a> ]</li>
                            <li id="movieslinkli" >[ <a id="movieslink" href="javascript:ajaxpage('opt/movies.php', 'rightcolumn');">Movies</a> ]</li>
                        <ul>
                    </div>
                </td>
                <td id="rightcolumn" class="index_center" >
                    <div align="center">
                        <h3>Choose a Media Type to start your journey.</h3>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
{include file="footer.tpl"}