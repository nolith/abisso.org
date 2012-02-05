---
date: '2009-06-02 15:23:53'
layout: post
slug: firmare-gli-archivi-jar
status: publish
title: Firmare gli archivi jar
wordpress_id: '127'
categories:
- CaptureMJPEG
- how-to
- italiano
tags:
- CAcert
- CaptureMJPEG
- jarsigner
- java
- linkedin
- processing
---

[Un po' di tempo fa](http://abisso.org/2009/05/capturemjpeg-come-applet/) mi ero imbattuto nel problema di utilizzare online un'applet generata con [Processing](http://processing.org) che utilizzasse [CaptureMJPEG](http://capturemjpeg.lilik.it).

Ero giunto alla conclusione che fosse necessario firmare l'applet e qualche giorno dopo mi sono procurato tramite [CaCert](http://cacert.org) una chiava utilizzabile per la firma del codice.

Quello che segue è un rapido riepilogo dei passi necessari per la firma dei jar.




### Individuazione della chiave



    
    
    kaiman:applet nolith$ keytool -list -storetype pkcs12 \
    -keystore keystore.p12
    Immettere la password del keystore:  **********************
    
    Tipo keystore: pkcs12
    Provider keystore: SunJSSE
    
    Il keystore contiene 1 entry
    
    id di alessio caiazza a root ca, 2-giu-2009, keyEntry,
    Impronta digitale certificato (MD5): 81:57:63:80:D9:71:61:CD:6D:1E:CA:1D:28:0C:19:F8
    




### Firma



    
    
    kaiman:applet nolith$ jarsigner -storetype pkcs12 \
    -keystore keystore.p12 micc_histo.jar \
    "id di alessio caiazza a root ca"
    Enter Passphrase for keystore: ****************************
    



Per quanto riguarda gli applet esportati con Processing è necessario firmare il proprio jar e core.jar (i jar di CaptureMJPEG sono forniti già firmati dalla versione 1.0.1)
