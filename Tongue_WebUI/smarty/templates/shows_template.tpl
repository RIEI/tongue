<table style="border-width: 1px; border-spacing: 1px">
    <tr>
        <th style="width: 30%">Shows</th>
        <th>Season</th>
        <th>Video Files</th>
    </tr>
    <tr>
        <td style="vertical-align:top;">
            <div style="overflow-y:auto;width:300px;height:600px;">
                <ul>
                    {foreach from=$shows item=show}
                    <li><a class="links" href="javascript:ajaxpage('opt/seasons.php?show={$show.0}', 'seasoncolumn');">{$show.1}</a></li>
                    {/foreach}
                </ul>
            </div>
        </td>
        <td style="vertical-align: top" id="seasoncolumn">
        </td>
        <td style="text-align: right; vertical-align: top" id="videocolumn">
        </td>
    </tr>
</table>