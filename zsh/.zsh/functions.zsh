function qq { grep -rn "$1" . --color; }
function qqa { grep -rn "$1" apps --color; }
function pk { pkill -f "$1"; }
function spk { sudo pkill -f "$1"; }

load-local-conf() {
  if [[ -f .env && -f .autosource && -r .env ]]; then
    source .env
    echo "\e[32mLocal environment sourced:"
    echo "$(<.env | tr '=' ' ' | awk '{print $2}' | tr '\n' ' ')"
  fi
}
