A short status summary of the server, meant to be run right after logging in.

What it's for:
  When you log in to a server you usually want the same few answers: is it healthy, is anything broken, does it need attention? sysinfo gives them in one screen, on Debian and Ubuntu servers whether they are VPSes or bare metal, without needing root.

What it shows:
  The host name, operating system, kernel, and whether it runs on bare metal or in a virtual machine, then:

  Uptime     How long the server has been up, and since when.
  Load       The 1, 5, and 15 minute load averages, the CPU count, and the number of processes.
  Memory     Memory in use, not counting cache the kernel can free.
  Swap       Swap in use, or "none".
  Disks      Space used on each local filesystem.
  Services   systemd units that have failed.
  Updates    Pending package updates, and how many of them are security updates.
  Reboot     Whether a reboot is needed to finish installing updates.

  Values turn yellow, then red, as they approach their limit: load above 70% then 100% of the CPU count, memory above 80% then 90%, swap above 50% then 80%, and disks above 80% then 90%.

Good to know:
  Sections are skipped when their tools are missing, for example Services on a server or container without systemd, and Updates outside Debian and Ubuntu.

  Updates are counted from the package lists of the last "apt update", which sysinfo does not run. Ubuntu's update-notifier counts security updates exactly; elsewhere they are estimated from the security repositories.

  A reboot is reported as needed when /var/run/reboot-required exists, or when a newer kernel of the running kernel's flavour is installed in /boot.

Permissions:
  sysinfo does not need root, and does not use sudo.
