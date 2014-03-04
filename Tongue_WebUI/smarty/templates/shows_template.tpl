
<script type='text/javascript'>
    $(document).ready(function(){
        $('#showslist').on("click", 'a', function() {
            $(this).addClass("active");
            alert(this.id);
            var parent_id = $(this).parent(this).parent().attr('id');
            $('#showslist').not(document.getElementById( this.id )).removeClass("active");
        });

    });
</script>
<table style="border-width: 1px; border-spacing: 1px; width:100%">
    <tr>
        <th>Shows</th>
        <th>Season</th>
        <th>Episodes</th>
        <th>Episode Details</th>
    </tr>
    <tr>
        <td style="background-color:#00FF00; vertical-align:top; min-width:300px; max-width:300px;">
            <div id="showslist" style="overflow-y:auto; height:600px; width:100%; min-width:300px">
                <ul>
                    {foreach from=$shows item=show}
                    <li id="show{$show.0}">|<>| <a id="show{$show.0}" href="javascript:ajaxpage('opt/seasons.php?show={$show.0}', 'seasoncolumn');">{$show.1}</a></li>
                    {foreachelse}
                        There are no shows indexed...
                    {/foreach}
                </ul>
            </div>
        </td>
        <td style="background-color:#00AAAA; vertical-align: top; min-width: 110px; max-width: 110px" >
            <div id="seasoncolumn" style="overflow-x:auto; overflow-y:auto; height:600px; width:100%; min-width:110px;">
            </div>
        </td>
        <td style="background-color:#AAFF00; text-align: left; vertical-align: top; min-width: 300px; width:30%" >
            <div id="episodecolumn" style="overflow-x:auto; overflow-y:auto; height:600px;">
            </div>
        </td>
        <td style="background-color:#AA7722; text-align: left; vertical-align: top; min-width: 20%; width:20%" >
            <div id="episode_details" style="overflow-x:auto; overflow-y:auto; height:600px; width:100%">
            </div>
        </td>
    </tr>
</table>