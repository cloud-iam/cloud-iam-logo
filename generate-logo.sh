#!/usr/bin/env bash
set -e
# — ©FGRibreau #NoBullshit Tech-Lead SaaS checklist :p

# Facebook:
#
# Link posts: 1200 x 628 px
# Image posts: 1200 x 630 px
# Cover image: 820 х 312 px
# Profile image: 170 х 170 p
#
# Twitter:
#
# Image posts: 1024 x 675 px
# Cover image: 1500 х 500 px
# Profile image: 400 x 400 p
#
# Instagram:
#
# Image posts: 1080 x 1080 px
# Profile image: 110 x 110 px
# Stories: 1080 x 1920 px
#
# YouTube:
#
# Thumbnail image: 1280 x 720 px
# Cover image: 2560 x 1440 px
# Profile image: 800 x 800 px
#
# Pinterest:
#
# Image posts: 1000 x 1500 px
# Pin: 236 px width
# Profile image: 165 x 165 px
#
# LinkedIn:
#
# Link posts: 1200 х 628 px
# Image posts: 1200 x 1200 px
# Cover image: 1536 x 768 px
# Profile image: 300 х 300 px
#
# Tik Tok:
#
# Profile photo: 200 x 200 px
# Video length: 1080 x 1920 px

rm -v _* || true

for i in 16 32 48 64 110 170 128 256 312 400 500 512 630 720 820 1024 1080 1500 1920 2048 4096
do
  for f in "icon-color" "icon-color-text_black" "icon-color-text_white" "icon-grey" "icon-line" "logo-color-text_black" "logo-color-text_white"
  do
    /Applications/Inkscape.app/Contents/MacOS/inkscape --export-type png --export-filename "_${f}-bg_transparent-w${i}.png" -w $i ${f}.svg

    if [[ "$f" != *"text_white"* ]]; then
      convert -flatten "_${f}-bg_transparent-w${i}.png" "_${f}-bg_white-w${i}.png"
    fi

  done
done

convert _icon-color-bg_transparent-w16.png _icon-color-bg_transparent-w32.png _icon-color-bg_transparent-w48.png _icon-color-bg_transparent-w256.png _icon-color-bg_transparent-w512.png favicon.ico

cp _icon-color-bg_transparent-w64.png ../../../public/favicon.png
