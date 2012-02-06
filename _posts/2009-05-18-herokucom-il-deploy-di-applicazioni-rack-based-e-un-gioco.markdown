---
date: '2009-05-18 15:58:09'
layout: post
slug: herokucom-il-deploy-di-applicazioni-rack-based-e-un-gioco
status: publish
title: heroku.com il deploy di applicazioni rack-based è un gioco
wordpress_id: '97'
categories:
- italiano
- Recensioni
tags:
- aws
- deploy
- heroku
- linkedin
- rack
- ruby
- sinatra
- tutorial
- webapp
---

Ieri sera ho scoperto un servizio interessante, si chiama [Heroku](http://heroku.com) ed è un **hosting di applicazioni basate su [rack](http://rack.rubyforge.org/)** come ad esempio **[Ruby on Rails](http://rubyonrails.org)** o **[Sinatra](http://www.sinatrarb.com)**.

Fino a qui nulla di nuovo, ma il loro sistema si basa sulla **semplicità della procedura di deploy** che come ben sa chi ci ha provato, non è proprio al livello di una applicazione php.

Per provare un po' questo sistema ho deciso di creare una mini applicazione con sinatra che esegue l'hash MD5 di alcune stringhe.
Vediamo come funziona.




## Prerequisiti


È necessario installare la gemma heroku; per l'applicazione dell'esempio serviranno anche le gemme sinatra e thin.



    
{% highlight bash %} 
$ sudo gem install heroku
$ sudo gem install sintra 
$ sudo gem install thin
{% endhighlight %} 




Per il deploy serve git. [Scaricabile da qui](http://git-scm.com/).


Fatto questo è necessario registrare un account su [Heroku](http://heroku.com).



## L'applicazione



Creiamo il file hasher.rb dentro la cartella hasher.


    
{% highlight ruby %}    
require 'rubygems'
require 'sinatra'
require 'digest/md5'

get '/' do
  erb :home
end

post '/md5' do
  unless params[:str].nil?
    "<code>MD5(#{params[:str]}) -> #{Digest::MD5.hexdigest(params[:str])}</code>"
  else
    redirect '/'
  end
end

# Accettiamo solo richieste in POST
get '/md5' do
  redirect '/'
end

use_in_file_templates!

__END__

@@ home

<p>
Questa è una semplice webapp (esagerato!) per spiegare come funziona 
<a href="http://heroku.com">Heroku</a>.<br></br>
Puoi trovare l'articolo relativo nel mio 
<a href="http://bit.ly/nkw0V" rel="me">blog</a>.
</p>

<form action="/md5" accept-charset="utf-8" method="post">
  <input type="text" name="str" value="Write here..." id="str"></input>
  <input type="submit"></input>
</form>
{% endhighlight %}
    
    



Per il deploy con rack è necessario creare anche il file config.ru


    
{% highlight ruby %}
#rack config file
require 'hasher'
run Sinatra::Application
{% endhighlight %} 





## Il deploy



Ora giunge il momento di mandare online la nostra applicazione


    
{% highlight bash %}    
#creiamo il repository git nella cartella corrente
$ git init
Initialized empty Git repository in /Users/nolith/Documents/Projects/hasher/.git/

#aggiungiamo tutti i file nella cartella al controllo di versione
$ git add .

#eseguiamo il commit dei file
$ git commit -m 'Import iniziale: hash md5'
[master (root-commit)]: created 21b62e4: "Import iniziale: hash md5"
 2 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 config.ru
 create mode 100644 hasher.rb

#creiamo una nuova applicazione su heroku
# sarà possibile rinominarla in seguito
$ heroku create
Enter your Heroku credentials.
Email: utente@server.it
Password:
Uploading ssh public key
Created http://growing-summer-43.heroku.com/ | git@heroku.com:growing-summer-43.git
Git remote heroku added

#eseguiamo l'upload dell'applicazione
$ git push heroku master
Warning: Permanently added the RSA host key for IP address '75.101.145.87' to the list of known hosts.
Counting objects: 4, done.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (4/4), 784 bytes, done.
Total 4 (delta 0), reused 0 (delta 0)

-----> Heroku receiving push
-----> Rack app detected
       Compiled slug size is 004K
-----> Launching..... done
       App deployed to Heroku

To git@heroku.com:growing-summer-43.git
 * [new branch]      master -> master

#Proviamo la nostra applicazione
$heroku open
{% endhighlight %}    





### Alcune note



La prima volta che si utilizza un comando di heroku vengono richieste le credenziali di accesso e viene fatto l'upload di una chiave pubblica ssh ([Come creare una coppia di chiavi per ssh](http://linubuntu.blogspot.com/2007/02/ssh-autenticazione-tramite-chiave.html)).

**Finito! Siamo online!**



## Conclusioni



Quanto mostrato si può fare anche per una applicazione Rails, in questo caso non servirà il file config.ru.
Attualmente il deploy di una applicazione basata su rack non è dei più semplici, anche se devo dire che [mod_rails](http://modrails.org) ha notevolmente migliorato le cose. 
Dobbiamo però considerare anche il fattore economico, per piccole applicazioni di test heroku è gratuito, per applicazoni che necessitano di risorse consistenti direi che la scelta di basarsi su [AWS](http://aws.amazon.com) è un vantaggio non da poco, i benefici offerti dalla struttura di Amazon sono impossibili da ottenere ad un costo contenuto per uno sviluppatore indipendete o una PMI.
