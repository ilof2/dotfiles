#!/bin/bash
pidof "zen-bin" && hyprctl dispatch focuswindow "class:zen" || zen-browser&
