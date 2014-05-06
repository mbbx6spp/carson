# Glossary for Carson

The Carson project is a distributed continuous delivery system.


## Carson Core

This component keeps track of the high level constructs like jobs and
instances.

### Job

A job is a definition that will be run as a job instance.

### Job Instance

A job instance is the runtime execution of a job which can yield artifacts.
It may have one or more phases.

### Artifact

An artifact is one result of a particular job instance.


## Hughes

This component provides the "housekeeping" of the CD system.

### Execution Environment

An execution environment is either a dedicated slave, a virtual machine, or
a container that a job instance may run in. It possesses a list of
Capabilities, which may be empty.

### Capability

A capability could be the platform or operating system of an Execution
Environment, or it may signal that the Execution Environment offers access to
specialized hardware like GPUs. Capabilities are "facts" that could be used
to dynamically discover appropriate Execution Environments for job instances.


