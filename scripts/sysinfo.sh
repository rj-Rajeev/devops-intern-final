#!/usr/bin/env bash
set -euo pipefail

printf '%s\n' "System Information"
printf '%s\n' "=================="

printf '\n%s\n' "User Information"
printf 'Current user: %s\n' "$(whoami)"
printf 'Effective UID: %s\n' "$(id -u)"

printf '\n%s\n' "Host Information"
printf 'Hostname: %s\n' "$(hostname)"
printf 'Kernel release: %s\n' "$(uname -r)"
printf 'System date: %s\n' "$(date -Iseconds)"

printf '\n%s\n' "Disk Usage"
df -h

printf '\n%s\n' "Memory Usage"
free -h

printf '\n%s\n' "Docker Daemon Status"
systemctl is-active docker
