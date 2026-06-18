#!/usr/bin/env bash

icon_ethernet='󰈀'
icon_wifi='󰖩'

default_route="$(ip route get 8.8.8.8 2>/dev/null | head -n 1 || true)"
default_if="$(awk '{for (i=1; i<NF; i++) if ($i == "dev") {print $(i+1); break}}' <<<"${default_route}")"

if [[ -n "${default_if}" && -d "/sys/class/net/${default_if}/wireless" ]]; then
  printf "%s" "${icon_wifi}"
else
  printf "%s" "${icon_ethernet}"
fi
