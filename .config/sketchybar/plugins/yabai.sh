#!/usr/bin/env sh

update() {
  # This is called for all other events
  WINDOW=$(yabai -m query --windows --window)
  CURRENT=$(echo "$WINDOW" | jq '.["stack-index"]')

  args=()
  if [[ $CURRENT -gt 0 ]]; then
    # Use Numbers in place of Dots if the Stack is greater than 10
    # Use a larger font for the unicode dots
    LAST=$(yabai -m query --windows --window stack.last | jq '.["stack-index"]')
    args+=(--set $NAME icon=􀏭 label.drawing=on label=$(printf "[%s/%s]" "$CURRENT" "$LAST"))
  else 
    args+=(--set $NAME label.drawing=off)
    case "$(echo "$WINDOW" | jq '.["is-floating"]')" in
      "false")
        if [ "$(echo "$WINDOW" | jq '.["has-fullscreen-zoom"]')" = "true" ]; then
          args+=(--set $NAME icon="􀏜")
          $HOME/limelight/bin/limelight -m config active_color 0xffeacb64 
        else
          args+=(--set $NAME icon="􀏝")
          $HOME/limelight/bin/limelight -m config active_color 0xff9dd274 
        fi
        ;;
      "true")
        args+=(--set $NAME icon="􀢌")
        $HOME/limelight/bin/limelight -m config active_color 0xffba9cf3 
        ;;
    esac
  fi

  sketchybar -m "${args[@]}"
}

mouse_clicked() {
  yabai -m window --toggle float
  update
}

mouse_entered() {
  sketchybar --set $NAME background.drawing=on 
}

mouse_exited() {
  sketchybar --set $NAME background.drawing=off 
}

case "$SENDER" in
  "mouse.entered") mouse_entered
  ;;
  "mouse.exited") mouse_exited
  ;;
  "mouse.clicked") mouse_clicked
  ;;
  "forced") exit 0
  ;;
  *) update 
  ;;
esac
