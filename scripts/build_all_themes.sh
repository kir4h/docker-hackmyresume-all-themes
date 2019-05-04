#!/bin/sh
# This script will iterate over all installed themes and build the resume with hackmyresume

resumePrefix=${1:-resume}

resumeFile=$(ls /resumes/*resume.json | head -n 1)
for theme in $(ls -d  /usr/lib/node_modules/jsonresume-theme*); do
    themeName=$(basename ${theme} | cut -d "-" -f3-)
    hackmyresume build ${resumeFile} /resumes/${resumePrefix}-${themeName}.pdf -t ${theme}    
done