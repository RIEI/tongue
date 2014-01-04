<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <style>
        video {
            width: 700px;
            height: 480px;
            border: 1px solid black;
        }

        .video-container {
            display: inline-block;
            text-align: center;
        }

        p {
            font: 14px Arial;
        }
    </style>
    <script src="http://api.html5media.info/1.1.6/html5media.min.js"></script>
</head>
<body>
<div class="video-container">
    <p>HTML5 webm video</p>
    <video src="{$stream_source}" width="720" height="480" controls preload autoplay></video>
</div>
</body>
</html>​