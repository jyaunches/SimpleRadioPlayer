SimpleRadioPlayer
=================

Overview/Purpose:

This app demonstrates the basics for using an AVPlayer (from the AVFoundation framework) 
to stream a live radio feed via a m3u8 file.

This app was written with the live feed for KDWB, a radio station in St. Paul/Minneapolis.
The app was branded for KDWB. Icons, logos, etc.. :-)


Functionality:

When the user hits the play button, they pick up KDWB's broadcast from the most current point 
and it is streamed through their device.

When the user pauses the stream, the music stops and upon playing again, they pick up the stream fresh from it's 
current point in the broadcast.

The user must be connected to the internet. As such, if the user is not, they are shown an
alert telling them to check their connetion.
