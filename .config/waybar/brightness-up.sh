{
  flock -n 1 || exit 5
  brightnessctl set 5%+
  sleep 0.1
} 1>/tmp/.brightness-scroll.lock