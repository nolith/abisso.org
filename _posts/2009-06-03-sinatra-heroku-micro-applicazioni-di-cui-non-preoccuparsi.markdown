---
date: '2009-06-03 21:08:22'
layout: post
slug: sinatra-heroku-micro-applicazioni-di-cui-non-preoccuparsi
status: publish
title: '[redirector] Sinatra + Heroku => Micro-applicazioni di cui non preoccuparsi'
wordpress_id: '131'
picture: /assets/images/redirector.png
categories:
- how-to
- italiano
- Progetti
tags:
- github
- heroku
- linkedin
- ruby
- sinatra
---

Oggi mi son imbattuto in un problema che ho risolto grazie a sinatra ed heroku.

Nei giorni scorsi avevo deciso di usare il domino _bb.alessiocaiazza.info_ come mia pagina personale su [bitbucket](http://bitbucket.org), solo che poi ho comprato il dominio _l0g.in_ e avrei preferito usare [code.l0g.in](http://code.l0g.in).

Fin qui nulla di male, ma come fare con tutti i link che avevo disseminato in giro per il web? Avrebbero puntato ad una pagina di errore? No!

Mi è venuto in mente che con sinatra è possibile catturare le url con delle regexp...quindi...

{% highlight ruby %}    
#
# redirector
#
# (c) 2009 - Alessio Caiazza 
    
require 'rubygems'
require 'sinatra'
    
REDIRECT_TO='http://l0g.in'
    
get '/' do
    redirect REDIRECT_TO
end
    
get '/*' do
    redirect "#{REDIRECT_TO}/#{params[:splat][0]}"
end
{% endhighlight %}

e poi deploy su heroku e custom domain service .....**fatto!**

Ho colto l'occasione per provare [hg-git](http://hg-git.github.com/), quindi ho pubblicato tutto su [github](http://github.com/nolith/redirector/)
