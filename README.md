# GBS examples
Tiny source code of proper [GBS](http://ocremix.org/info/GBS_Format_Specification) files for posterity.

### Hyper Lode Runner
Since the game is quite small it posed some challenge I gladly accepted (no generic sound engine occupying whole bank). :) Other versions floating around don't initialize itself properly and have too much obsolete data included. Prime example of how not to do it. My version has everything in tact, so enjoy it if you can. 

### Itchy & Scratchy - Miniature Golf Madness
Similar as above but no one did it, so.. here it is.

### Battleship
This one uses timer interrupt. Version floating around doesn't have it defined, so it plays everything wrong. Hence I've added it here.

### Speedy Gonzales - Aztec Adventure
Typical example of player/song data occupying whole bank. Not that much interesting except the fact it uses two banks and small routine to switch between them.

### Othello
Another of those 2 bank games where code, player, sound data and graphics are interwinded. 

### Crayon Shin-chan 4 - Ora no Itazura Daihenshin
This one is a bit of everything. Player and songs are located in different banks, songs and sfx have own lookup tables, to play sfx with no song in background you need to find one memory location. I think there was 1 unused song here and couple of sfx. Definitely fun!

BTW, I don't use [rgbasm](https://github.com/rednex/rgbds), so these sources won't assemble without few changes.
