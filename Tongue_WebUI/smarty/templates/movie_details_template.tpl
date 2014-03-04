<table style="border-width: 1px; border-spacing: 1px">
    <tr>
        <th style="width: 75%">{$movie_name} Details</th>
    </tr>
    <tr>
        <td class="movie_details_col">
            <div class="movie_details_div">
                <a href="video_player.php?video_id={$movies[0].id}&amp;table=movie_files" onclick="return popitup('opt/video_player.php?video={$movies[0].id}&amp;table=movie_files')">Play Movie!</a>
                </br>
                Movie Files:
                <ul>
                    {foreach from=$movies item=movie}
                    <li>{$movie.filename}</li>
                    {foreachelse}
                    <li>Ummmm... OK....</li>
                    {/foreach}
                </ul>
                Movie Details:
                <ul>
                    <li>Run Time: {$movies[0].runtime} Minutes</li>
                    <li>Dimensions: {$movies[0].dimentions}</li>
                    {if $movies[0].dvd_raw eq 1}<li>Raw DVD Video</li>{/if}
                    {if $movies[0].grouped eq 1}<li>Multi-CD Video Group ID: {$movies[0].group}</li>{/if}
                </ul>
            </div>
        </td>
    </tr>
</table>