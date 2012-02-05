---
date: '2010-02-22 22:27:01'
layout: post
slug: mercurial-e-redmine-aggiornamento-automatico-dello-stato-dei-bug
status: publish
title: 'Mercurial e Redmine: aggiornamento automatico dello stato dei BUG'
wordpress_id: '196'
categories:
- how-to
- italiano
tags:
- bug tracker
- mercurial
- mercurial hooks
- rails
- redmine
---

Da qualche giorno sto usando [redmine](http://www.redmine.org) per la gestione dei miei repository [mercurial](http://mercurial.selenic.com).

Una cosa che trovo molto utile è cambiare lo stato dei BUG riportati nel tracker direttamente con il messaggio di commit.

C'è un problema, di default il tracker di redmine non si aggiorna finché qualcuno non visita la pagina del repository...vediamo come risolvere il problema.

Mercurial ci mette a disposizione degli [hook](http://mercurial.selenic.com/wiki/Hook) per eseguire alcuni script in corrispondenza di determinati eventi; possiamo sfruttare l'hook changegroup per aggiornare redmine.

Colleghiamoci in ssh al server su cui si trovano redmine e modifichiamo il file .hg/hgrc del nostro repository.

    
    
    # output of /path/to/hg/repos/.hg/hgrc
    # Mercurial - Redmine issue updater hook
    # please update /path/to/redmine with your redmine path
    [hooks]
    changegroup.redmine = cd /path/to/redmine && ruby script/runner "Repository.fetch_changesets" -e production
    



A questo punto non ci resta che eseguire un commit ed un push di prova.
