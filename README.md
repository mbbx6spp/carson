# Carson

The real butler of continuously delivered software products.

![Carson](http://images3.wikia.nocookie.net/__cb20120906140960/downtonabbey/images/thumb/e/e7/Tn-500_jimcarter.jpg/200px-Tn-500_jimcarter.jpg "Carson rocks your socks off!")

## Overview

Carson's namesake is the butler from Downton Abbey. Yeah, I'm a freak who
watches British TV period dramas. Deal with it.

This project is an attempt to build a continuous delivery toolkit that can
be run on a cluster of decentralized nodes, removing the most common single
points of failure, the shared datastore, as well as the typically disgusting
hairball of XML configuration files that need to be managed across master
nodes.

Much more to come. Just the README.md and LICENSE at the moment, but bare
with me.

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
retry/redirect requests, etc to fulfill user/triggered requests.
* Carson will have a focus on separating concerns using decentralized
semantics wherever possible. This means if it is possible to build a feature
using decentralized protocols, then it will be (eventually). The purpose of
this is to remove single points of failure when possible.
* Carson will be configuration management friendly. Fuck 30,000+ lines of
XML configuration for a Jenkins server. Yes. That is unreasonable and
completely insane. Carson instead will think of ease of configuration
management from the get-go.
* Carson will provide meaningful APIs to make the _downstairs_ as
programmable as possible. A gripe about my Jenkins experience is that
the REST API is limited, and the script API is too open without reasonable
security safe guards (any user with access to the `/script` path can do
almost anything).

A secondary goal of Carson is to offer well defined "protocols" for
extension enabling others to contribute various forms of authentication and
authorization integrations or numerous notification medium functionality
(e.g. email, IRC, XMPP, Twitter). The key to this will be a focus on
separating concerns of the toolkit to define simple yet effective protocols
for each separate concern.

Note: this is quite opposite to the priorities of Jenkins and Hudson. The
focus of these tools is on "flexibility" not usability. The above two goals
are of utmost importance for usability, whereas allowing anyone to override
any part of the system or full remote execution is clearly only focused on
flexibility.

## Timeline

TODO

Basically whenever I have time unless you want to pay me to give up my day
job to work on this more :)

## License

Copyright (c) 2013, Susan Potter. All rights reserved.

The software will be distributed under the BSD 3-clause license. See LICENSE
for more details.

Yeah, I know boring, but pretty darn liberally licensed so hopefully that
works for you anyway.

