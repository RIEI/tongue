{foreach from=$seasons item=season}
    <a class="links" href="javascript:ajaxpage('videos.php?season={$season.0}', 'videocolumn');">{$season.1}</a></br>
{/foreach}