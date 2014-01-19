<html>
<head><title>Demo of VLC mozilla plugin</title></head>

<body>

<h1>Demo of VLC mozilla plugin - Example 1</h1>

<embed type="application/x-vlc-plugin"
       name="Stream Player"
       autoplay="yes" loop="no" width="720" height="480"
       target="http://feed.randomintervals.com:8090/test{$int}.ts" />
<br />
<a href="javascript:;" onclick='document.video1.play()'>Play video1</a>
<a href="javascript:;" onclick='document.video1.pause()'>Pause video1</a>
<a href="javascript:;" onclick='document.video1.stop()'>Stop video1</a>
<a href="javascript:;" onclick='document.video1.fullscreen()'>Fullscreen</a>

</body>
</html>