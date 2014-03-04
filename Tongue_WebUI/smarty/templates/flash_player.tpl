<!doctype html>

<head>

    <!-- player skin -->
    <link rel="stylesheet" type="text/css" href="skin/minimalist.css">

    <!-- site specific styling -->
    <style type="text/css">
        body
        {
            background-color: #000000;
            font: 12px "Myriad Pro", "Lucida Grande", sans-serif;
            text-align: center;
            padding-top: 0%;
        }.flowplayer
        {
            width: 1280px;
        }
    </style>

    <!-- flowplayer depends on jQuery 1.7.1+ (for now) -->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js">
    </script>

    <!-- include flowplayer -->
    <script type="text/javascript" src="flowplayer.min.js"></script>

</head>

<body>

<!-- the player -->
<div class="flowplayer" data-swf="./players/flow/flowplayer.swf" data-ratio="0.4167">
    <video autoplay="false">
        <source type="video/webm" src="{$stream_source}.webm">
    </video>
</div>

</body>
