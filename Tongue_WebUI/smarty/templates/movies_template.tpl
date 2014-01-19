<table style="border-width: 1px; border-spacing: 1px">
    <tr>
        <th style="width: 75%">Movies</th>
    </tr>
    <tr>
        <td style="vertical-align:top;">
            <div style="overflow-y:auto;height:600px;width: 600px">
                <ul>
                    {foreach from=$movies item=movie}
                    <li><a class="links" href="javascript:ajaxpage('opt/movie_details.php?movie={$movie.0}&amp;group={$movie.2}', 'moviedetails');">{$movie.1}</a></li>
                    {foreachelse}
                    There are no Movies... Why not get some?
                    {/foreach}
                </ul>
            </div>
        </td>
        <td style="vertical-align:top; text-align: left" id="moviedetails">
        </td>
    </tr>
</table>