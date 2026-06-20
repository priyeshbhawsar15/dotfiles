#!/usr/bin/env bash

set -u

tailscale_icon=''

default_route="$(ip route get 8.8.8.8 2>/dev/null | head -n 1 || true)"
local_ip="$(awk '{for (i=1; i<NF; i++) if ($i == "src") {print $(i+1); break}}' <<<"${default_route}")"

tailscale_ip=''
if command -v tailscale >/dev/null 2>&1; then
  tailscale_ip="$(tailscale ip -4 2>/dev/null | head -n 1 | tr -d '\n' || true)"
fi

if [[ -z "${tailscale_ip}" ]]; then
  tailscale_ip="$(ip -4 -o addr show dev tailscale0 2>/dev/null | awk '{split($4, ip, "/"); print ip[1]; exit}')"
fi

parts=()
if [[ -n "${local_ip}" ]]; then
  parts+=("${local_ip}")
fi

if [[ -n "${tailscale_ip}" ]]; then
  parts+=("${tailscale_icon} ${tailscale_ip}")
fi

if ((${#parts[@]} == 0)); then
  printf "no network"
else
  printf "%s" "${parts[*]}"
fi
