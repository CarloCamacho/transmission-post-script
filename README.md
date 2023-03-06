# transmission-post-script
Transmission post-completion script for unraring and copying files. 

In essence it copies or extracts files to another location after a download is complete.
My use case is fairly niche in that for TV i'm only grabbing a specific release, and the 'fights' i'm downloading are coming rar'd so there is some extract steps for those. 

I'm sharing this because there was a lot of different example snippets for this, but it took a bit of trial and error to get it where I needed it.  Hopefully this comes in handy for others when creating their own scripts. 


# Settings

Don't forget to update your settings.json to permit scipts and specify what to run:

"script-torrent-done-enabled": true,
"script-torrent-done-filename": "/home/user/script.sh",