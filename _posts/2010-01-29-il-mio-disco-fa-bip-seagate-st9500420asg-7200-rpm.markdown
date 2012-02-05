---
date: '2010-01-29 12:23:26'
layout: post
slug: il-mio-disco-fa-bip-seagate-st9500420asg-7200-rpm
status: publish
title: Il mio disco fa BIP! Seagate ST9500420ASG 7200 rpm
wordpress_id: '171'
categories:
- how-to
- italiano
- Recensioni
tags:
- apple
- bip
- clicking
- freeze
- hard disk
- linkedin
- noise
- OS X
- seagate
- ST9500420ASG
- sudden motion sensor
---

Capita a tutti di fare l'acquisto sbagliato. Ma un hard disk che fa BIP (o click) mette sempre un po' di terrore.

Stiamo parlando del **favoloso** HD seagate ST9500420ASG da 7200 RPM.

Si tratta in effetti di un disco _nato male_. Leggendo in giro si scopre che tutti i produttori di PC che li hanno equipaggiati sui loro computer hanno avuto gli stessi problemi (Apple, HP, DELL).

Vediamo come risolverli!

Prima di tutto bisogna dire che se avete acquistato un PC con dentro questo disco è già uscito il firmware updater e dovete cercarlo sul sito del produttore, ma se come me vi siete fatti male da soli, scegliendo di comprarlo direttamente dalla seagate...beh avete bisogno di questa guida.

Nota: **Non mi ritengo responsabile di eventuali danni al vostro disco o pc, per me ha funzionato, ma seguite la procedura a vostro rischio e pericolo.**


## Il problema


Adesso possiamo individuare il problema, se il vostro disco ogni tanto fa il rumorino che si sente nel video allora state leggendo il post giusto.






Sembra che il problema sia dovuto ad una politica di risparmio energetico troppo aggressiva del firmware originale. (versione 0002SDM1)




Come dicevo le case costruttrici di PC sono state chiamate ad aggiornare i loro FW, ma la seagate non si degna di rilasciare un aggiornamento per chi il disco lo ha comprato da solo. Fortunatamente per noi il FW rilasciato da DELL (versione 0005SDM1) è compatibile anche con il nostro disco, ed il controllo sul seriale, che impedisce ad un disco non DELL di essere aggiornato, è facilmente aggirabile.





### Apple e Sudden Motion Sensor




Prima di procedere oltre devo fare una piccola digressione per i possessori di un MAC, questo HD incorpora un sensore di movimento che protegge il disco in caso di movimenti bruschi, sfortunatamente i macbook hanno un loro sensore (SMS) sulla scheda madre che fa lo stesso identico lavoro; questo porta a una situazione di conflitto in cui oltre ad avere il BIP si hanno dei momenti di blocco del disco il cui il sistema operativo va in freeze per 1-2 secondi e poi si sente il disco ripartire, per risolvere questo problema bisogna disabilitare il sensore SMS.




Con Snow Leoprad (10.6) aprire il terminale ed eseguire i seguenti comandi:



    
    
    sudo pmset -a sms 0
    # ti verrà chiesta la password
    sudo pmset -g
    



Se tutto è andato a buon fine avremo una risposta del genere:

    
    Active Profiles:
    Battery Power		-1
    AC Power		-1*
    Currently in use:
     hibernatemode	3
     halfdim	1
     lidwake	1
     acwake		0
     womp		1
     sleep		10
     disksleep	10
     sms		0
     hibernatefile	/var/vm/sleepimage
     ttyskeepawake	1
     displaysleep	10


Controllare che il valore di sms sia 0. Adesso il sensore è disabilitato. Per altre versione di OS X fare riferimento al link in fondo al post.


## Aggiornamento del Firmware




Dopo aver verificato di avere effettivamente un disco seagate ST9500420ASG con versione FW 0002SDM1 scarichiamo il SW per l'aggiornamento del firmware dal sito della [DELL](http://support.us.dell.com/support/downloads/download.aspx?c=us&cs=19&l=en&s=dhs&releaseid=R250352&formatcnt=1&libid=0&typeid=-1&dateid=-1&formatid=-1&fileid=366465). Una volta installato troveremo il file _Seagate Utility.iso_ nella cartella _C:\dell\drivers\R250352_. Non dobbiamo fare altro che masterizzarlo su un CD ed riavviare il PC dal lettore di CD. ( Nel caso abbiate un MAC basta riavviare tenendo premuto il tasto alt, vi apparirà una schermata con il vostro disco e un CD con sotto una freccetta, fare click sulla freccetta sotto al dispositivo da cui volete fare il boot. Purtroppo non sono sicuro se serva o meno BootCamp per questo passaggio )




Adesso il vostro PC si avvierà in DOS e proverà ad aggiornare il FW fallendo per via del seriale.




A questo punto vi troverete davanti un prompt del DOS e dovete digitare il seguente comando:




    
    FHDL -m HOLLIDAY -f 0005SDM1.LOD -i ST9500420ASG -b -v


Una volta terminato l'aggiornamento potete riavviare il PC e dire addio al fastidioso clicking.


## Link




[Discussione sul forum seagate](http://forums.seagate.com/stx/board/message?board.id=ata_drives&thread.id=16853&view=by_date_ascending&page=1) (inglese)




[FW DELL](http://support.us.dell.com/support/downloads/download.aspx?c=us&cs=19&l=en&s=dhs&releaseid=R250352&formatcnt=1&libid=0&typeid=-1&dateid=-1&formatid=-1&fileid=366465) (inglese)




[Apple disabilitare il sensore di movimento](http://support.apple.com/kb/HT1934) (inglese)



