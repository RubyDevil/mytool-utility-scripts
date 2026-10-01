Show what is listening on the server: each port and protocol, the address it is reachable on, the process behind it, and the systemd service that owns it.

Usage:
  ports

Example:
  PORT      ADDRESS         PROCESS                 SERVICE
  22/tcp    all interfaces  systemd (1)             ssh.socket
  53/udp    localhost       systemd-resolve (612)   systemd-resolved.service
  80/tcp    all interfaces  nginx (1120)            nginx.service
  5432/tcp  localhost       postgres (903)          postgresql@16-main.service

Reading the output:
  ADDRESS is "all interfaces" when the port accepts connections on every network interface, which usually means it is reachable from outside unless a firewall blocks it. "localhost" ports are reachable only from the server itself. Otherwise it is the specific address, or interface, the port is bound to. IPv4 and IPv6 listeners of the same process share one row.

  PROCESS is the program and its process ID. SERVICE is the systemd unit the process runs in. Ports opened by systemd itself, through socket activation, show the .socket unit that owns them.

  A "-" service means the process does not belong to a systemd service, for example a program started from a login shell.

Permissions:
  ports does not need root. Without root, the process behind ports owned by other users shows as "?"; run "sudo ports" to see every process.
