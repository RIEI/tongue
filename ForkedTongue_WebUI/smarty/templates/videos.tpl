{foreach from=$videos item=file}
    <a href="video_player.php?video={$file.id}" onclick="return popitup('video_player.php?video={$file.id}')">{$file.video}</a></br>
{/foreach}