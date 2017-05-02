# AX89063
AXIOMTEK LCM - AX89063 LCDProc Driver

## Why another fork?
Since pfSense 2.3.3_1 got its lcdproc package back, I want to get my axiomtek NA-820's lcd working.
The original code doesn't build anymore because it relied on old version and old SF download link. Further more, pfSense has a more recent version of the lcdproc package than the 0.5.4 used in the original Makefile.

## Changelog
- updated to use lcdproc 0.5.7

## Build instructions
Just clone this repo and run a `make && make install`.
It will download lcdproc sources, patch them and build. Output will be installed in the `lcdproc-target` folder.
**lcdproc 0.5.7 relies on automake 1.14, please make sure to install this version in your building environment**

## Deploy to pfSense
Copy `lcdproc-target/lib/lcdproc/ax89063.so` to `/usr/share/lib/lcdproc/' folder in your pfSense machine. You have to modify `lcdproc.inc` and `lcdproc.php` to reference the driver (this is not a best practice, since package update will broken the ax89063 driver support).

## License
As stated in the original repository:
Copyright (C) 2011, Alexander Bluem <bluem [at] gmit-gmbh [dot] de>,
                                     <alex [at] binarchy [dot] net>
Copyright (C) 2010, Kai Falkenberg <kai [at] layer0 [dot] de>
Copyright (C) 2010, Malte S. Stretz <http://msquadrat.de>

The code is derived from the ms6931 and bayrad driver

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or any later version.
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
