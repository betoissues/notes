+++
date = '2024-10-13'
description = 'A couple updates from this weekend, including Flossparking, mailcow, nixden, openring, and changes to my email setup.'
slug = '2024-10-13-weekend-updates'
tags = ['published']
title = 'Weekend Updates'
+++

A couple of things went on this weekend, so here's a quick summary:

## Set up mailcow and other services for nixden

Starting Friday evening I bought a new domain, rented a VPS, and started nixden.net (yes, it's empty). Currently, there's no fixed goal, a community that gives back and contributes to open-source. The idea is still a work in progress, and currently it's just myself.

The first service I set up was [mailcow: dockerized](https://mailcow.email/), since I wanted to be able to contribute as a community instead of using my personal address to participate in other open-source initiatives. If the group catches up, I might open the emails for other interested people.

The mailcow set up was fairly straightforward, with DNS and firewall being the main parts that need some extra configuration.

I've added other services like [bin](https://bin.nixden.net)[^1] and [paste](https://paste.nixden.net)[^2]

## FlossPArking

On Saturday the [FlossPA](https://floss-pa.net) community gathered to welcome some new people interested in FLOSS. We had a great time getting to know each other a bit more and discuss things we've learned.

## Adjusted my aerc setup to use mbsync, msmtp and goimapnotify

In the past I already had [my offline set up with aerc](https://www.betoissues.com/es/blog/correo-aerc-offline-gmail-maildir/), but I didn't really stick with it when switching computers. I've been using aerc's built-in IMAP support for a while, which works great. Nevertheless, and for the same reasons state in that post, I took the time to configure these tools again, this time on MacOS.

Configuration changes a bit from what had to be done before. In the end, I managed to get it to work pretty much as I wanted for both my personal and my newly created address, which I'll use mostly for dev and dev related mailing lists. I'll probably write an updated post about this configuration.

## Openring in this website

I've enabled [openring](https://sr.ht/~sircmpwn/openring/) for this website[^3]. Updates from people I follow around the internet (via RSS) will be included at the bottom of every post and re-fetched every time I build the site (new post or whatever other reason).

This list is actually a subset of my full list, only including my favorite ones. I'll try to keep it updated and shared [over here](/openring-links.txt).

[^1]: This is open at the moment, using [PrivateBin](https://privatebin.info/), Backblaze storage and 1 week max lifetime for the bins.
    

[^2]: Runs on [rustypaste](https://github.com/orhun/rustypaste), expiration is 1 hour, and required an authorization key to use. I still want to improve this service, at the moment it's only being used by myself for quick shares over IRC.
    

[^3]: Openring works with RSS feeds, so there are no backlinks from other people to my site. The idea is similar to webrings, which I've thought about joining too, just not a priority as I still figure out whether to make this site my online homepage.
