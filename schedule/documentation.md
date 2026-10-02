Everything that is scheduled to run on the server, in one table, soonest first.

What it's for:
  Scheduled work on a Linux server is spread over places that know nothing about each other: each user's crontab, /etc/crontab, /etc/cron.d, the cron.hourly, cron.daily, cron.weekly and cron.monthly folders, anacron, systemd timers, and at jobs. When something slows the server down at 3 a.m., or a backup quietly stopped, finding out what is scheduled means checking all of them. schedule lists them together and works out when each one runs next.

What it shows:
  The server's current time, then one row per job:

  IN         How long until the next run.
  NEXT       When that is: a weekday and time within the coming week, otherwise a date and time.
  SCHEDULE   The schedule as it was written: a cron expression, or the systemd timer's setting.
  USER       The account the job runs as.
  SOURCE     Where it is defined: crontab, /etc/crontab, cron.d/<file>, cron.daily (and the other cron folders), anacron, timer, or at.
  COMMAND    What it runs. For a systemd timer, this is the command of the service it starts.

  Times are in the server's time zone. The command column is cut to fit a narrow terminal.

Rows without a next time:
  Rows that have no next time are dimmed, and the NEXT column says why:

  at boot    An @reboot job, which runs when the server starts.
  when due   An anacron job, which runs when its day comes round rather than at a set time. This includes the cron.daily, cron.weekly and cron.monthly folders when anacron is installed.
  inactive   A systemd timer that is not started, so it will not run.
  never      A valid schedule that cannot happen, such as the 30th of February.
  ?          A schedule that is not valid. A warning names the line.

Warnings:
  Some mistakes make a job silently never run. schedule points them out:

  - cron is not installed, or its service is stopped, while cron jobs exist.
  - A file in /etc/cron.d that cron skips (Debian and Ubuntu): its name has a dot or another character besides letters, digits, _ and -, or it is not owned by root, or other users can write to it.
  - A crontab line that cannot be read, or a schedule that is not valid.

Good to know:
  The jobs of systemd user instances (systemctl --user) are not listed, only system-wide timers.

  A CRON_TZ line in a crontab is not applied, so jobs that depend on it show in server time.

  Scripts in the cron.* folders are listed only when they would run: executable, with a name made of letters, digits, _ and -.

Permissions:
  schedule does not need root and does not use sudo. Without root it can only read your own crontab, and says so; run "sudo schedule" to include every user's crontab.
