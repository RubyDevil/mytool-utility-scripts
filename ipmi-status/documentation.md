A quick "is the hardware OK?" check for a server, read from its management controller (BMC, such as a Dell iDRAC).

What it's for:
  Hardware problems such as a failed fan, a dead power supply, or an overheating CPU rarely show up in the operating system until it is too late. ipmi-status asks the BMC directly and puts the answer on one screen, so you can check a machine in a few seconds, or call it from a monitoring script.

What it shows:
  The first line says "Hardware OK", or names the sensors that need attention. Below it, in order:

  Temperatures      Inlet, exhaust, and CPU temperatures.
  Fans              Fan speeds and fan redundancy.
  Power supplies    Presence and state of each supply, and power redundancy.
  Recent events     The latest entries of the system event log.

Reading the output:
  Each sensor is marked ok, FAIL, or n/a. FAIL means the BMC reports the reading outside its limits, or the sensor describes a fault such as "Power Supply AC lost" or "Redundancy Lost". n/a means the sensor has no reading, which is normal for an empty fan or power supply slot.

  Recent events are history. A past event stays listed after the problem is fixed, until the log is cleared, so a clean sensor list with an old fault in the log usually means it was already dealt with.

  The exit status says whether anything needs attention, so scripts can act on it; see --help.

Permissions:
  Any member of the sudo, admin, or wheel group can run ipmi-status without a password. The script re-runs itself through sudo, so there is no need to type sudo.

Setup:
  Installing ipmi-status also installs ipmitool when it is missing and writes /etc/sudoers.d/mytool-ipmi-status after validating it with visudo. Uninstalling removes that rule.

  The server needs a BMC and the kernel's IPMI driver. When ipmi-status reports "Could not open device at /dev/ipmi0", load the driver with: sudo modprobe ipmi_devintf ipmi_si
