Show a one-screen hardware health snapshot through IPMI: temperatures, fans, power supplies, and the latest system event log entries.

Usage:
  ipmi-status [1-100]

Examples:
  ipmi-status      Show the sensors and the last 5 events
  ipmi-status 20   Show the sensors and the last 20 events

Reading the output:
  The first line says "Hardware OK", or lists the sensors that need attention.

  Each sensor is marked ok, FAIL, or n/a. FAIL means the BMC reports the reading outside its thresholds, or the sensor describes a fault such as "Power Supply AC lost" or "Redundancy Lost". n/a means the sensor has no reading, which is normal for empty fan or power supply slots.

  Recent events come from the system event log. They are history: a past event can stay listed after the problem is fixed, until the log is cleared.

Exit status:
  0 when every sensor is OK, 1 when any sensor needs attention, and 2 when the sensors cannot be read or the arguments are wrong.

Permissions:
  Any member of the sudo, admin, or wheel group can run ipmi-status without a password. The script re-runs itself through sudo, so there is no need to type sudo.

Setup:
  Installing ipmi-status also installs ipmitool when it is missing and writes /etc/sudoers.d/mytool-ipmi-status after validating it with visudo. Uninstalling removes that rule.

  The server needs a BMC (such as a Dell iDRAC) and the kernel's IPMI driver. When ipmi-status reports "Could not open device at /dev/ipmi0", load the driver with: sudo modprobe ipmi_devintf ipmi_si
