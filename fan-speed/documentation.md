Control how fast the server fans spin, through IPMI.

What it's for:
  Dell PowerEdge servers (iDRAC) run their fans from the temperatures they read, which can be louder or hotter than you want. fan-speed pins every fan to a speed you choose, for example to quiet a server in a home or office, or to hand control back to the iDRAC when you are done.

What it does:
  Giving a number switches the fan controller to manual mode and applies that duty cycle to every fan. The fans then keep that speed whatever the temperature, until you change it. A low value on a busy server can overheat it, so check the temperatures afterwards with a tool such as ipmi-status.

  auto switches the controller back to automatic mode, where the iDRAC adjusts the fans to the temperatures it reads.

  It uses Dell PowerEdge (iDRAC) raw IPMI commands, so other vendors need different raw codes.

Permissions:
  Any member of the sudo, admin, or wheel group can run fan-speed without a password. The script re-runs itself through sudo, so there is no need to type sudo.

Setup:
  Installing fan-speed also installs ipmitool when it is missing and writes /etc/sudoers.d/mytool-fan-speed after validating it with visudo. Uninstalling removes that rule.

Run fan-speed --help for the command-line options.
