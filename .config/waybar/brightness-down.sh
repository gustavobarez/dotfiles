{
  flock -n 1 || exit 15

  # Pega o brilho atual em porc entagem (ex: 40%)
  current_percent=$(brightnessctl get | awk -v max=$(brightnessctl max) '{printf "%.0f\n", ($1*100)/max}')

  min_percent=1
  decrease=5

  new_percent=$(( current_percent - decrease ))

  if (( new_percent < min_percent )); then
    new_percent=$min_percent
  fi

  brightnessctl set ${new_percent}%

  sleep 0.1
} 1>/tmp/.brightness-scroll.lock
