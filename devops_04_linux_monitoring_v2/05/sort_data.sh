sort_code() {
  awk '{print $0 | "sort -k9"}' $1 > code_sorted.log
}

uniq_ip() {
  awk '!a[$1]++' $1 > code_sorted.log
}

show_errors() {
  awk '/^.*" [45][0][0-3] ".*/ ' $1 > code_sorted.log
}

uniq_ip_with_errors() {
  awk '/^.*" [45][0][0-3] ".*/ && !a[$1]++' $1 > code_sorted.log
}
