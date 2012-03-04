---
layout: post
slug: failed-to-allocate-memory
status: publish
title: "OSX Lion, ruby and mysql2 - [FATAL] failed to allocate memory"
category: 
- english
- ruby
tags: [ ruby, mysql, OSX, lion, gems]
---
{% include JB/setup %}

I've spent a day figuring out how to solve the 
"\[FATAL\] failed to allocate memory" with mysql2 gems on Lion.

This solution should work if you installed mysql with [Homebrew](http://mxcl.github.com/homebrew/).

First of all, remove mysql-connector-c and mysql2 gem

	$ brew uninstall mysql-connector-c
	$ gem uninstall mysql2

Find the mysql version

	$ ls /usr/local/Cellar/mysql                
	5.5.19

Now recompile mysql2 against brewed mysql server (**replace 5.5.19 with your version (twice)**)

	$ gem install mysql2 -- --with-mysql-include=/usr/local/Cellar/mysql/5.5.19/include --with-mysql-lib=/usr/local/Cellar/mysql/5.5.19/lib

Enjoy yourself
