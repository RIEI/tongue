<!-- disabled for now...
<script type='text/javascript'>
    $(document).ready(function(){
        $('#showslist').on("click", 'a', function() {
            $(this).addClass("active");
            alert(this.id);
            var parent_id = $(this).parent(this).parent().attr('id');
            $('#showslist').not(document.getElementById( this.id )).removeClass("active");
        });

    });
</script>-->
<table class="shows_table">
    <tr>
        <th>Shows</th>
        <th>Season</th>
        <th>Episodes</th>
        <th>Episode Details</th>
    </tr>
    <tr>
        <td class="shows_col">
            <div id="showslist" class="shows_div">
                <ul>
                    {foreach from=$shows item=show}
                    <li id="show{$show.0}">|<>| <a id="show{$show.0}" href="javascript:ajaxpage('opt/seasons.php?show={$show.0}', 'seasoncolumn');">{$show.1}</a></li>
                    {foreachelse}
                        There are no shows indexed...
                    {/foreach}
                </ul>
            </div>
        </td>
        <td class="season_col" >
            <div id="seasoncolumn" class="season_div">
            </div>
        </td>
        <td class="episode_col" >
            <div id="episodecolumn" class="episode_div">
            </div>
        </td>
        <td class="episode_details_col" >
            <div id="episode_details" class="episode_details_div">
            </div>
        </td>
    </tr>
</table>