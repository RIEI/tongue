<table style="border-width: 1px; border-spacing: 1px">
    <tr>
        <th style="width: 75%">{$file.filename} Details</th>
    </tr>
    <tr>
        <td style="vertical-align:top;">
            <div style="overflow-y:auto;height:600px;">
                <a href="opt/video_player.php?video_id={$file.id}&amp;table=video_files" onclick="return popitup('opt/video_player.php?video={$file.id}&amp;table=video_files')">Play!</a>
                </br>
                {$file.filename}
                Episode Details:
                <ul>
                    <li>Run Time: {$file.runtime} Minutes</li>
                    <li>Dimensions: {$file.dimensions}</li>
                </ul>
            </div>
        </td>
    </tr>
</table>



