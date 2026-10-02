# mytool utility scripts

Utility scripts for [mytool](https://github.com/RubyDevil/mytool). Set this repository's URL in
mytool's `UTIL_SCRIPTS_REPO` setting, then use **Utility Scripts** in the main menu to browse,
install, uninstall, and update them.

## Scripts

| Script | Description |
| --- | --- |
| [fan-speed](fan-speed/documentation.md) | Set the speed of every server fan through IPMI (Dell iDRAC), or return it to automatic. |
| [ipmi-status](ipmi-status/documentation.md) | Show a hardware health snapshot through IPMI: temperatures, fans, power supplies, and recent events. |
| [mongo-access](mongo-access/documentation.md) | Make MongoDB public or private, with an IP access list enforced by ufw. |
| [ports](ports/documentation.md) | Show each listening port with its address, process, and systemd service. |
| [schedule](schedule/documentation.md) | List every cron job, systemd timer, and at job in one table, with when each runs next. |
| [sysinfo](sysinfo/documentation.md) | Show a login summary: uptime, load, memory, disks, failed services, updates, and reboot status. |

## Layout

```text
<name>/
  <name>              The script itself (or <name>.sh). Installed as /usr/local/bin/<name>.
  install.sh          Optional. Run as root after the script is copied into place.
  uninstall.sh        Optional. Run as root before the script is removed or updated.
  documentation.md    Optional. Shown in mytool's "Show Scripts".
```

- `<name>` may contain letters, digits, `_`, and `-`, and must start with a letter or digit.
- `install.sh` and `uninstall.sh` receive the installed script path, such as `/usr/local/bin/<name>`.
- A non-zero exit from `install.sh` aborts the install, and mytool restores the previous version.
- Updating a script runs the installed version's `uninstall.sh`, then the new version's `install.sh`.
- Without `documentation.md`, mytool shows the output of `<name> --help`, so scripts without a
  documentation file must handle `--help` without side effects.
- Every script here also prints a short usage with `--help`, for use on the server itself.
