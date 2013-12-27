# barrow (a carson OTP app)

This app is named after Thomas Barrow, the under butler on Downton Abbey and
the young, handsome (albeit mostly evil) face of the downstairs house. Since
the CSS of the web app can make it pretty and Javascript portion can
definitely make it evil, this seems the most apt character for this component.

It will provide the web interface to developers, QA, Ops, etc. of carson.

## Responsibilities

The `barrow` application will contain the main web application interface
(the peacock of the carson ecosystem) for core user activities.

Unlike the web interface in popular CI tools (Jenkins, Hudson, etc.), barrow
will not be used for "managing" configuration of jobs, etc. It could be used
for triggering builds/deploys ad-hocly, monitoring in-progress
builds/deploys. The reason for this is because this should be done via the
well defined APIs that the carson ecosystem will provide or via
configuration management mechanisms for persistent changes to capture a
more reasonable audit log inside the configuration management repository
that you use (we are agnostic on CM tooling, it's just not relevant).

## Concepts

TODO
