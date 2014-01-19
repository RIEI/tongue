{foreach from=$videos item=file}
    <a href="video_player.php?video_id={$file.id}&amp;table=video_files" onclick="return popitup('video_player.php?video={$file.id}')">{$file.video}</a></br>
{/foreach}