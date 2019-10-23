#!/bin/bash
pandoc -t revealjs -s -o testerino.html test.md -V revealjs-url=. -V theme=solarized --slide-level=2 --standalone