<div id="season_list_div">
    <ul>
{foreach from=$seasons item=season}
        <li>|<>| <a id="season{$season.0}" href="javascript:ajaxpage('opt/episodes.php?season={$season.0}', 'episodecolumn', 'season{$season.0}');">{$season.1}</a></li>
{/foreach}
    </ul>
</div>