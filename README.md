Tongue
======

Tongue Media Streaming Server using FFmpeg and FFserver
Version 0.1
Release Date: N/A yet
Author: Pferland

Description:
	  This is my attempt at a video streaming server written in python. 
Its pretty much just a learning experiment at the moment, not really anything 
special. The TongueD python daemon is primaraly a linux based service, testing 
has not been done to see if it will work 	on Windows (yet) FFserver is Linux only, 
so in order to use it you will either need to have Linux running on a server 
or a Virtual Machine (see Virtual Box or Vmware Player for some free options) 
I am thinking about creating a Vm disk so that people can just download that 
and run it with minimal setup needed, but will need to look into how to keep 
the image up to date.

Contents:
    A) Setup
    B) Usage
    C) Media File Structure Layout


A) Setup
	Read Docs/Setup Readme.rtf
	More notes on ffserver and ffmpeg read Docs/ffserver and ffmpeg notes.rtf

B) Usage
	Read Docs/Using Tongue Media Streaming Web Interface.rtf


C) Media File Structure Layout

    The intended folder structure for the media files are as follows:

    TV Shows:

    Example Paths:
    /mnt/Shows/The Simpsons/Season 01/
    /mnt/Shows/The Simpsons/Season 02/
    /mnt/Shows/Archer/Season 01/
    /mnt/Shows/Archer/Season 02/

    Example Tree:
    [root]
        [Shows Root]
            [Show 1 folder]
                [Season 01]
                [Season 02]
                [Season 03]
            [Show 2 Folder]
                [Season 01]
                [Season 02]
                etc...

    ----------------------------------------

    Movies: 
If a movie is split into two parts, the parts should have cd1 and cd2 in 
their names as you can see below in the example paths. /mnt/Movies/HD and 
/mnt/Movies/SD are required, High Deff movies ie 720p or higher should go 
into the HD folder. Everything else should go into the SD folder and if you 
want 720p could be considered SD.

    Example Paths:
    /mnt/Movies/HD/The Big Lebowski.mkv
    /mnt/Movies/HD/The Matrix.mkv
    /mnt/Movies/SD/The Simpsons Movie.avi
    /mnt/Movies/SD/fargo/cd1.avi
    /mnt/Movies/SD/fargo/cd2.avi
    /mnt/Movies/SD/American History X/American.History.X[1998] - cd1.avi
    /mnt/Movies/SD/American History X/American.History.X[1998] - cd2.avi

    Example Tree:
    [root]
        [Movies root]
            [HD] (Usually x264 and 720p/1080p)
                The Big Lebowski.mkv
                The Matrix.mkv
            [SD] (Usually Xvid/Dvix and 360p/480p)
                The Simpsons Movie.avi
                [fargo]
                    cd1.avi
                    cd1.avi
                [American History X]
                    American.History.X[1998] - cd1.avi
                    American.History.X[1998] - cd2.avi