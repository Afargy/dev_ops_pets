create_log() {
  local arr_codes=(200 201 400 401 403 404 500 501 502 503)
  local arr_methods=(GET POST PUT PATCH DELETE)
  local arr_sites=(/wikipedia /lurkmore /wikilix /vk /facebook /linkin /school /universe /google /yandex)
  local arr_protocols=(HTTP/1 HTTP/2)
  # local arr_domen=(net ru com en fr de au gn hk ch)
  local arr_agents=("Mozilla" "Google_Chrome" "Opera Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
  local extra_seconds=0

  for (( i=1; i < 6; i++ )); do
    local amount="$(($RANDOM * $i % 901 + 100))"
    for (( j=0; j < $amount; j++ )); do
      local rand=$(($RANDOM + i * j))
      local ip="$(($rand * $i * $j % 256)).$(($rand * $i * $i % 256)).$(($rand * $j * $j % 256)).$(($rand % 256))"
      local code="${arr_codes[$(($rand % 10))]}"
      local method="${arr_methods[$(($(($rand + $i * $j + $i + $j)) % 5))]}"
      local date="$(date -d " -$((i - 1)) days +$extra_seconds seconds"  +'%d/%b/%Y:%H:%M:%S %z')"
      local url="${arr_sites[$(($(($rand + $i)) % 10))]} ${arr_protocols[$(($(($rand + $i + $j)) % 2))]}"
      local agent=${arr_agents[$(($rand * $i *$j % 7))]}
      extra_seconds=$(($extra_seconds + 1))
      if [ $j -ne 0 ]; then
        echo "$ip - - [$date] \"$method $url\" $code \"-\" \"$agent\"" >> "$i.log"
      else 
        echo "$ip - - [$date] \"$method $url\" $code \"-\" \"$agent\"" > "$i.log"
      fi
    done
  done
}
