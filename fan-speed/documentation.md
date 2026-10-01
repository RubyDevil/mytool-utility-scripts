Set the speed of every server fan through IPMI, or hand control back to the iDRAC.

Usage:
  fan-speed <0-100|auto>

Examples:
  fan-speed 30     Run all fans at 30%
  fan-speed 100    Run all fans at full speed
  fan-speed auto   Return the fans to the iDRAC's automatic control

How it works:
  A number switches the fan controller to manual mode, then applies that duty cycle to every fan. The fans stay at that speed, whatever the temperature, until you run fan-speed again.

  auto switches the fan controller back to automatic mode, where the iDRAC adjusts the fans to the temperatures it reads.

  It uses Dell PowerEdge (iDRAC) raw IPMI commands, so other vendors need different raw codes.

Permissions:
  Any member of the sudo, admin, or wheel group can run fan-speed without a password. The script re-runs itself through sudo, so there is no need to type sudo.

Setup:
  Installing fan-speed also installs ipmitool when it is missing and writes /etc/sudoers.d/mytool-fan-speed after validating it with visudo. Uninstalling removes that rule.
