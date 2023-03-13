### local vars ###
set -l lightbg 363646
set -l bg 1F1F28
set -l fg DCD7BA
set -l darkfg C8C093
set -l green 76946A
set -l blue 7E9CD8
set -l violet 957FB8
set -l lightviolet 938AA9
set -l red E82424
set -l orange FFA066
set -l pink D27E99

### prompt ###
# left prompt
set -g tide_left_prompt_items vi_mode $tide_left_prompt_items

# right prompt
set -g tide_right_prompt_items

### items ###
# git
set -g tide_git_icon 
set -g tide_git_bg_color $pink

# vi mode
set -g tide_vi_mode_icon_default N
set -g tide_vi_mode_bg_color_insert $green
set -g tide_vi_mode_bg_color_default $blue
set -g tide_vi_mode_bg_color_visual $violet
set -g tide_vi_mode_bg_color_replace $red
set -g tide_vi_mode_color_default $bg
set -g tide_vi_mode_color_insert $bg
set -g tide_vi_mode_color_replace $bg
set -g tide_vi_mode_color_visual $bg

# pwd
set -g tide_pwd_bg_color $lightbg
set -g tide_pwd_color_dirs $lightviolet
set -g tide_pwd_color_anchors $violet

# character
set -g tide_character_color $green
set -g tide_character_color_failure $red
