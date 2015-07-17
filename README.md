# SDSC "openbabel" roll

## Overview

This roll bundles... <openbabel> 

For more information about the various packages included in the openbabel roll please visit their official web pages:

- <a href="http://openbabel.org" target="_blank">openbabel</a> is  a chemical toolbox designed to speak the many languages of chemical data.


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate openbabel source file(s) using a machine that does
have Internet access and copy them into the `src/<package>` directories on your
Rocks development machine.


## Dependencies

The sdsc-roll must be installed on the build machine, since the build process
depends on make include files provided by that roll.

<IF APPROPRIATE>
The roll sources assume that modulefiles provided by SDSC compiler and mpi
rolls are available, but it will build without them as long as the environment
variables they provide are otherwise defined.
<ENDIF>

## Building

To build the openbabel-roll, execute this on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make 2>&1 | tee build.log
```

A successful build will create the file `openbabel-*.disk1.iso`.  If you built
the roll on a Rocks frontend, proceed to the installation step. If you built the
roll on a Rocks development appliance, you need to copy the roll to your Rocks
frontend before continuing with installation.

## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll openbabel
% cd /export/rocks/install
% rocks create distro
% rocks run roll openbabel | bash
```

In addition to the software itself, the roll installs openbabel environment
module files in:

```shell
/opt/modulefiles/applications/openbabel
```


## Testing

The openbabel-roll includes a test script which can be run to verify proper
installation of the roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/openbabel.t 
```

