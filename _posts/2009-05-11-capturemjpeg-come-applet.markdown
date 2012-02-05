---
date: '2009-05-11 19:11:57'
layout: post
slug: capturemjpeg-come-applet
status: publish
title: CaptureMJPEG come Applet
wordpress_id: '28'
categories:
- CaptureMJPEG
- italiano
tags:
- applet
- CAcert
- CaptureMJPEG
- linkedin
- processing
---

Recentemente ho trasferito CaptureMJPEG su [BitBucket](http://bb.alessiocaiazza.info/capturemjpeg/wiki/Home) e ho controllato che fosse compatibile con [Processing 1.0](http://processing.org).

Mi sono accorto del fatto che gli applet che utilizzano CaptureMJPEG non funzionano, dovendo instaurare una connessione HTTP e non essendo firmata l'applet si ottiene che non è possibile collegarsi alla videocamera.

Per risolvere il problema basta firmare l'applet esportata, a questo proposito ho contattato il team di supporto di [CAcert](http://cacert.org) per farmi attivare l'opzione per la firma del codice in modo da poter fare altre prove.

_Stay tuned_
