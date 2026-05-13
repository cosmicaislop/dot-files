#!/bin/bash
while read extension; do
  gnome-extensions enable "$extension"
done < {{ .chezmoi.sourceDir }}/gnome-extensions.txt
