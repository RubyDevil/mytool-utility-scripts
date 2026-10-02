Make MongoDB reachable from other machines, or keep it on localhost, and control which addresses may connect.

What it's for:
  MongoDB listens on localhost only, which is the safe default. When an application on another server needs to connect, it has to listen on a network address, and a database exposed to the internet without protection is quickly found and wiped. mongo-access makes that change in one step, refuses to do it unsafely, and keeps an access list of the addresses that may connect.

How it works:
  public and private change net.bindIp in /etc/mongod.conf, then restart mongod. The rest of the file, comments included, is left alone. The previous file is kept as /etc/mongod.conf.mytool-backup, and is put back if mongod does not come back listening on the expected addresses.

  public with no address sets bindIp to 0.0.0.0, which listens on every IPv4 interface. With an address, bindIp is that address plus 127.0.0.1, so mongosh keeps working on the server. IPv6 is not configured.

  The restart drops open connections for a few seconds, so mongo-access asks first. --yes skips the question.

Safety checks:
  public refuses to run unless all of these hold:

  1. Authentication is enabled (security.authorization: enabled in /etc/mongod.conf). Create an admin user with mongosh first, then enable it. Without authentication, anyone who can reach the port can read and delete all data. --allow-no-auth skips this check.
  2. The access list has at least one address, and ufw is active and blocks incoming connections by default, so that only the listed addresses can connect. --no-firewall skips this check and lets anyone who can reach the server connect.

  mongo-access never enables authentication or the firewall itself, because doing so can lock you out.

Access list:
  The list is kept as ufw rules for the MongoDB port, tagged "mytool-mongo-access". allow and remove work at any time, whether MongoDB is public or private, and the list is kept when you switch to private. A /32 or /128 range is stored as the bare address. 0.0.0.0/0 and ::/0 are refused.

  Before turning on ufw for the first time, allow SSH or you will lock yourself out: sudo ufw allow OpenSSH && sudo ufw enable

  A ufw rule that opens the port to everyone, such as "ufw allow 27017", bypasses the access list. status and public warn when they find one. Only ufw is supported; servers using firewalld or hand-written nftables rules need --no-firewall and their own rules.

Status:
  mongo-access status shows the service state, the addresses mongod is really listening on (not just what the config says), the config value, authentication, the firewall, and the access list, followed by warnings: no authentication, an access list that is not enforced, or a config change that has not been applied by a restart.

Permissions:
  Any member of the sudo, admin, or wheel group can run mongo-access without a password. The script re-runs itself through sudo, so there is no need to type sudo.

Setup:
  Installing mongo-access also installs ufw when it is missing (it stays disabled) and writes /etc/sudoers.d/mytool-mongo-access after validating it with visudo. Uninstalling removes that rule. The ufw rules and the MongoDB configuration are left as they are.

Run mongo-access --help for the commands and options.
