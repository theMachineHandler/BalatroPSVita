# BalatroVita
An attempt to make Balatro run on PlayStation Vita.

This project uses a custom version of Rinnegatamante's absolutely amazing [Lua Player Plus Vita](https://github.com/Rinnegatamante/lpp-vita), with plans to add support for shaders using [vitaGL](https://github.com/Rinnegatamante/vitagl) – also from Rinnegatamante.

As of now, there is little to show besides a loading screen, so consider this to still be in its alpha stage. However, if you know your stuff, you can fully read through the code. I am currently working on graphics (and after that, I will probably give shaders a go), so my next update might offer a bit more for the general public to enjoy.

I am still looking into adding my custom version of lpp-vita, so people can see the fixes I applied to small bugs (mainly to how the interpreter generates an image and save it). I will need to check how to do it correctly, until then I will only leave the code I have been working on for the port, without any release packages containing the custom eboot.bin. You can still download the safe eboot.bin from lpp-vita, but the app will crash after going through the load screen.

To use this, you will need a **legally owned copy of Balatro** for Windows. Just drop the Balatro.exe inside the app folder on your Vita.

# Legal Stuff
I am not affiliated with Balatro or its developers in any way. All rights to Balatro belong to its respective owners. This is a passion project, with no intention of harming its creators or transgressing their legal rights.

# A huge thank you to
* LocalThunk for this amazing game.
* Rinnegatamente and, by extension, the people that made lpp-vita and vitagl possible.
* The [Love2D](https://love2d.org/) project.
* Luiz Menezes, a StackOverflow user that provided the function to print tables that I use in my log library for debugging. [Link here](https://stackoverflow.com/questions/41942289/display-contents-of-tables-in-lua).

I will update this section as development progresses.
