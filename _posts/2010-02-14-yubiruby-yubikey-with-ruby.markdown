---
date: '2010-02-14 18:17:17'
layout: post
slug: yubiruby-yubikey-with-ruby
status: publish
title: YubiRuby - Yubikey with Ruby
wordpress_id: '186'
picture: /assets/images/yubikeyring.png
categories:
- english
- Progetti
tags:
- linkedin
- rails
- ruby
- wishes
- yubico
- yubikey
---

Some days ago, willing to learn how to extends ruby with C code, I wrote a wrapper for [yubico-c](http://code.google.com/p/yubico-c/) library.

You can find the sourcecode of my work on [bitbucket](http://bitbucket.org/nolith/yubiruby/) and some installation instruction on [the gemmcutter page](http://gemcutter.org/gems/YubiRuby).



[![](http://forum.yubico.com/includes/affiliate/images/yubico.jpg)](http://www.yubico.com/o.php?refid=162&rno=1906861421)After installing the gem with
$ gem install YubiRuby
you can try it with the following code


    
    
    require 'rubygems'
    require 'YubiRuby'
    
    key = "6df89690b5f51bd9ac912c5004781e86" #use your AES key
    y = YubiRuby::Yubikey.new(key);
    puts y.key
    otp = gets().strip
    puts y.parse(otp)
    puts "Ouput: #{y}"
    puts "uid: #{y.uid}"
    puts "counter: #{y.counter}"
    puts "capslock: #{y.triggered_by_capslock?}"
    puts "timestamp low/high: #{y.timestamp_low}/#{y.timestamp_high}"
    puts "session: #{y.session}"
    puts "random: #{y.random}"
    puts "crc: #{y.crc}"
    puts "crc residue: #{y.crc_residue}"
    puts "crc residue ok?: #{y.crc?} (#{y.crc_residue} == #{YubiRuby::Yubikey::CRC_OK_RESIDUE})"
    



I hope to find the time for writing an [authlogic ](http://github.com/binarylogic/authlogic)extension in order to use a yubikey with rails application.
