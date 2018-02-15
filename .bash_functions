# php aliases
function phpserve() {
  php -S "localhost:$1"
}

#ruby aliases
function rserve() {
  ruby -run -e httpd . -p "$1"
}

