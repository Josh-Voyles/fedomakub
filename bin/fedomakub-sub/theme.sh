THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Everforest" "Gruvbox" "Kanagawa" "Rose Pine")
THEME=$(gum choose "${THEME_NAMES[@]}" "<< Back" --header "Choose your theme" --height 10 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then
  cp $FEDOMAKUB_PATH/themes/$THEME/alacritty.toml ~/.config/alacritty/theme.toml
  cp $FEDOMAKUB_PATH/themes/$THEME/zellij.kdl ~/.config/zellij/themes/$THEME.kdl
  sed -i "s/theme \".*\"/theme \"$THEME\"/g" ~/.config/zellij/config.kdl
  cp $FEDOMAKUB_PATH/themes/$THEME/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

  source $FEDOMAKUB_PATH/themes/$THEME/gnome.sh
  source $FEDOMAKUB_PATH/themes/$THEME/tophat.sh
  source $FEDOMAKUB_PATH/themes/$THEME/vscode.sh

  # Forgo setting the Chrome theme until we might find a less disruptive way of doing it.
  # Having to quit Chrome, and all Chrome-based apps, is too much of an inposition.
  # source $FEDOMAKUB_PATH/themes/$THEME/chrome.sh
fi

source $FEDOMAKUB_PATH/bin/fedomakub-sub/menu.sh
