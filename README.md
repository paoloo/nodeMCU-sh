# nodeMCU-sh
some shell utilities (pseudo-coreutils) for nodeMCU to make things easier.

## Instructions

insert ```sh=require("shell")``` on init.lua and use any command with sh.command.

### available commands:
 - sh.ls() to **list** files.
 - sh.cp(org,dst) to **copy** _org_ to _dst_.
 - sh.mv(org,dst) to **move** _org_ to _dst_.
 - sh.rm(file) to **remove** a _file_.
 - sh.df() to show disk structure, used and remaining spaces.
 - sh.cat(file) to show _file_ contents.
 - sh.wifi(ssid,password) to connect to wifi _ssid_ with password _password_.
 - sh.ip() to show **ip** status, Nill if offline.
