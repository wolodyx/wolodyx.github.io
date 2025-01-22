---
layout: page
title: My projects
---

[Русская версия]({% link work-activity/pet-ru.markdown %})

## The single-board microcomputer

  The microcomputer was developed as part of [my thesis](https://github.com/wolodyx/EduBoard/blob/master/docs/diploma-presentation.pdf), under the guidance of A.G. Alekseev, a wonderful mentor.
  I am grateful for the opportunity he gave me to implement his vision of creating a programmable single-board educational computer.
  The device has been used for laboratory work in the course "Digital Electronics" over the past two years.
  During this time, we designed and manufactured five microcomputers based on the MCS 51 microcontroller, with external RAM and non-volatile memory, and various I/O expansion modules.
  The microcomputers connected to a work computer via serial port, loading programs into non-volatile memory.
  The user could select the programming/execution mode of the program using a switch on the board.
  *Stack*: `C++`, `WxWidgets`, digital electronic circuits, `P-CAD`, assembly language.


## Remote camera control

  In 2009, I was approached with a request to help automate the uploading of images from remote CCTV cameras.
  The cameras that were purchased were equipped with a basic graphics program, which allowed for only simple user operations.
  The manufacturer was unwilling to expand the functionality of the program, but they did provide documentation on the protocol.
  I have created a program that interfaces with the camera using a GPRS modem.
  The program connects to the camera periodically and uploads the image to a local folder.
  The graphical portion of the program is built on the wxWidgets framework, while the ffmpeg library is used to convert the video stream from H.264 to JPEG.
  This program is used to monitor the conditions of a section of the M7 Federal Highway.
  *Stack*: `C++`, `FFmpeg`, `WinAPI`, `wxWidgets`, modem control.
