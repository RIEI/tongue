<table style="border-width: 1px; border-spacing: 1px">
    <tr>
        <th>Movies</th>
    </tr>
    <tr>
        <td class="movie_list_col">
            <div class="movie_list_div">
                <ul>
                    {foreach from=$movies item=movie}
                    <li><a href="javascript:ajaxpage('opt/movie_details.php?movie={$movie.0}&amp;group={$movie.2}', 'moviedetails');">{$movie.1}</a></li>
                    {foreachelse}
                    There are no Movies... Why not get some?
                    {/foreach}
                </ul>
            </div>
        </td>
        <td class="movie_details_td" id="moviedetails">
        </td>
    </tr>
</table>