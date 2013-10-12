# Carson

The real bulter. Jenkins and Hudson suck arse in comparison.

I am, of course, referring to the horrible excuses for CI servers (Jenkins
and Hudson).

## Overview

Carson's namesake is the butler from Downton Abbey. Yeah, I'm a freak who
watches British TV period dramas. Deal with it.

This project is an attempt to build a continuous delivery toolkit that can
be run on a cluster of decentralized nodes, removing the most common single
points of failure, the shared datastore and the typically disgusting hairball
of XML configuration files that need to be synced across master nodes.

Much more to come.

## Goals

The primary goal of Carson is to be operationally low key and to attempt to
do the simplest _right_ thing first. Let me clearly define what this means:

* Carson will manage the _downstairs_ staff and operations in such a way that
the _upstairs_ isn't aware of the vast majority of the drama. Only murder
trials where Valets are accused of poisoning their ex-wife might catch the
Lord of the manor's notice. Seriously. Only really seriously effed up drama
should be exposed to the _upstairs_. And BTW by _upstairs_ I mean developers
who want to use Carson to continuously deliver software. Also "drama" refers
to runtime failures encountered that should (assuming you provision enough
redundancy when deploying Carson) have simple and reasonable policies to
retry/redirect requests, etc to fulfill user requests.
* Carson will have a focus on separating concerns using decentralized
semantics wherever possible. This means if it is possible to build a feature
using decentralized protocols, then it will be (eventually, first cuts might
not be decentralized depending on what is relatively prioritized). The
purpose of this is to remove single points of failure when possible.
* Carson will be configuration management friendly. Fuck 30,000+ lines of
XML configuration for a Jenkins server. Yes. That is unreasonable and
completely insane. Carson instead will think of ease of configuration
management from the get-go.

A secondary goal of Carson is to offer a pluggable design to enable others
to contribute various forms of authentication and authorization integrations
to numerous notification medium functionality (e.g. email, IRC, XMPP,
Twitter). The way I plan to promote _pluggable design_ of separate
concerns of the application is to define simple yet effective protocols for
each separate concern.

Note: this is quite opposite to the priorities of Jenkins and Hudson. The
focus of these tools is on "flexibility" not usability. The above two goals
are of utmost importance for usability, whereas focusing on complex class
hierarchies to allow Jenkins/Hudson to be extended is focused purely on
flexibility.

## License

Copyright (c) 2013, Susan Potter. All rights reserved.

The software will be distributed under the BSD 3-clause license. See LICENSE
for more details.

Yeah, I know boring, but pretty darn liberally licensed so hopefully that
works for you anyway.

