+++
date = '2024-09-05'
slug = '2024-09-05-umami-analytics'
tags = ['published']
title = 'Setting up Umami for analytics'
+++

While in a previous log I mentioned setting up a pretty standard Grafana with Loki and Alloy for log analytics[^1], just recently I also noticed my stats on simpleanalytics.com weren't being updated for my main website.

Looking at the Grafana graphs is definitely not the same, although it does help with finding 404 and other paths being requested, it's overcomplicated for some of the basics like individual visitors per page, country, setting up sites on new servers.

My main website is currently hosted via Netlify, where I don't have access to the same logs as in my nginx. So after a quick search I decided to set up Umami[^2] analytics just for getting something simple, as I don't care about many metrics.

Took me less than 15 minutes to have it running on this website with Docker Compose, it also only takes about 2.07kB (1/2th compared to simpleanalytics), which is good enough.

I'm trying to keep my websites "small" (relatively) and focus on the content as much as possible. In fact, I noticed the biggest asset this site has is pagefind[^3], sitting at around 74kB, so I'll also consider moving it to a standalone `/search` page to reduce bandwidth usage on the rest of the site.

I'll continue to use Grafana for a different purpose once I migrate some of my VPN exits and start hosting more small services to the outside world.

[^1]: [Setting up monitoring with Grafana](./Setting%20up%20monitoring%20with%20Grafana.md)
[^2]: [Umami](https://umami.is/)
[^3]: [Pagefind -- Static low-bandwidth search at scale](https://pagefind.app/)
