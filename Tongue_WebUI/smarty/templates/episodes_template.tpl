<div id="episode_list_div">
    <ul>
{foreach from=$videos item=file}
        <li>|<>| <a id="episode{$file.0}" href="javascript:ajaxpage('opt/episode_details.php?episode={$file.0}', 'episode_details');">{$file.1}</a></li>
{/foreach}
    </ul>
</div>