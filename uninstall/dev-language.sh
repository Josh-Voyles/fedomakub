# Uninstall default programming languages
if [[ -v FEDOMAKUB_FIRST_RUN_LANGUAGES ]]; then
  languages=$FEDOMAKUB_FIRST_RUN_LANGUAGES
else
  AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
  languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --height 10 --header "Select programming languages to uninstall")
fi

if [[ -n $languages ]]; then
  for language in $languages; do
    case $language in
    Ruby)
      mise uninstall ruby@3.4
      mise x ruby -- gem uninstall rails
      ;;
    Node.js)
      mise uninstall node@lts
      ;;
    Go)
      mise uninstall go@latest
      ;;
    PHP)
    sudo rm -f /usr/local/bin/composer
    sudo dnf remove -y php php-{curl,apcu,intl,mbstring,opcache,pgsql,mysqlnd,sqlite3,redis,xml,zip}
    sudo dnf module disable -y php:remi-8.4
    sudo dnf remove -y remi-release
    sudo dnf clean all
      ;;
    Python)
      mise uninstall python@latest
      ;;
    Elixir)
      mise uninstall elixir@latest
      mise uninstall erlang@latest
      ;;
    Rust)
      rustup self uninstall -y
      ;;
    Java)
      mise uninnstall java@latest
      ;;
    esac
  done
fi
