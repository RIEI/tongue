{include file="header.tpl"}
<script type='text/javascript'>
    $(document).ready(function(){
        $('#wrapperDiv').on("click", 'a', function() {
            $('#index_column').on("click", 'a', function() {
                $(this).addClass("active");
                var parent_id = $(this).parent(this).parent().attr('id');
                $('#index_column a').not(document.getElementById( this.id )).removeClass("active");
            });

            $('#showslist').on("click", 'a', function() {
                $(this).addClass("active");
                var parent_id = $(this).parent(this).parent().attr('id');
                $('#showslist a').not(document.getElementById( this.id )).removeClass("active");
            });
        });
    });

</script>
<div align="Center">
    <table>
        <tbody>
        <tr>
            <td colspan="3" style="height: 40px">
                <h4 style="text-align: center">Tongue Media Streaming Server</br>
                    Tongue Server is currently: {$tongue_status}</br>
                    FFserver is currently: {$ffserver_status}</br>
                    </h4>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<div id="wrapperDiv">
    <table style="min-width:1200px;max-width:1900px;width:100%">
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