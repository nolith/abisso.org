---
date: '2011-02-21 21:10:47'
layout: post
slug: bundler-with-mercurial-support
status: publish
title: Bundler with Mercurial support
wordpress_id: '237'
picture: http://gembundler.com/images/bundler-small.png
categories:
- english
- me
- Progetti
tags:
- bundler
- linkedin
- mercurial
- ruby
---

Git seems to be the de-facto tool for ruby development. Lots of gems are hosted on github, and bundler may help you to work with cutting-edge release fetched from git repositories.

WOW! That's amazing!_ But what if you didn't like to use git as scm_?

I've nothing against git, but I prefer mercurial so I spent some time to add mercurial capabilities to [bundler](http://gembundler.com/), the best way to manage your application's dependencies.




## How does it work?


With bundler you can start gem development with a simple command (more info at [Railscast episode 201](http://railscasts.com/episodes/201-bundler))

    
    bundle gem gem_name


This command will create for you a gem skeleton with some premade rake tasks in a shiny git repository. Wouldn't be wonderful if we can use mercurial instead of git?

Now you can with [this](https://github.com/nolith/bundler/zipball/mercurial_v1.0.10) patched version of bundler 1.0.10 that add the '-H' switch to bundle gem

    
     bundle help gem
    Usage:
      bundle gem GEM
    
    Options:
      -H, [--hg=Use mercurial instead of git]
      -b, [--bin=Generate a binary for your library.]
          [--no-color=Disable colorization in output]
      -V, [--verbose=Enable verbose output mode]       
    
    Creates a skeleton for creating a rubygem




## Not enough for you?


If this is not enough for you, I've also a patch set for loading gems directly from mercurial repos. This [patched bundler v1.1pre.1](https://github.com/nolith/bundler/zipball/mercurial) will make you happy.

{% highlight ruby %}    
#Gemfile
gem 'eusplazio', :hg => 'http://bitbucket.org/nolith/eusplazio', :tag => 'v0.0.2'
{% endhighlight %}

Happy conding


### Install instructions


Download the zipped source and extract it; enter the source folder and type rake install
