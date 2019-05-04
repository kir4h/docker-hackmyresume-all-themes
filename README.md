# docker-hackmyresume-all-themes <!-- omit in toc -->

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/kir4h/hackmyresume-all-themes.svg)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/kir4h/hackmyresume-all-themes.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/kir4h/hackmyresume-all-themes.svg)

- [Summary](#summary)
- [Building the image](#building-the-image)
- [Using the "all-themes" image](#using-the-all-themes-image)
  - [Linux](#linux)
  - [Windows](#windows)
    - [With Docker Toolbox](#with-docker-toolbox)
    - [With Docker for Windows](#with-docker-for-windows)
- [Exporting the resume for all installed themes](#exporting-the-resume-for-all-installed-themes)

## Summary

Docker image built on top of [docker-hackmyresume](https://github.com/kir4h/docker-hackmyresume) and that adds the
following JSON resume themes:

- jsonresume-theme-bootstrap-icons
- jsonresume-theme-class
- jsonresume-theme-classy
- jsonresume-theme-compact
- jsonresume-theme-compact-extended
- jsonresume-theme-contempo
- jsonresume-theme-dark-classy
- jsonresume-theme-dark-classy-responsive
- jsonresume-theme-elegant
- jsonresume-theme-elegant-fr
- jsonresume-theme-eloquent
- jsonresume-theme-kendall
- jsonresume-theme-kendall-beardtree
- jsonresume-theme-modern
- jsonresume-theme-modern-extended
- jsonresume-theme-nameme
- jsonresume-theme-onepage
- jsonresume-theme-sceptile
- jsonresume-theme-short
- jsonresume-theme-slick
- jsonresume-theme-spartan
- jsonresume-theme-stackoverflow
- jsonresume-theme-stackoverflow2
- jsonresume-theme-striking

## Building the image

There is nothing special regarding the build procedure, just run docker build:

```bash
docker build -t kir4h/hackmyresume-all-themes .
```

or use the Makefile

```bash
make build
```

## Using the "all-themes" image

The image is just providing hackmyresume, so there's nothing special to consider. The easiest approach is to use a
bind mount for the resume file for both reading and writing the exported file(s)

### Linux

Exporting your resume to pdf using the theme `jsonresume-theme-eloquent` assumming that your resume is on your current
folder and named `my.resume.json`

```bash
docker run --user $(id -u) --rm -it -v  $(pwd):/resumes kir4h/hackmyresume-all-themes:latest hackmyresume build \
/resumes/my.resume.json /resumes/MyResume.pdf -t /usr/lib/node_modules/jsonresume-theme-eloquent
```

### Windows

#### With Docker Toolbox

Exporting your resume to pdf using the theme `jsonresume-theme-eloquent` and assumming that your resume is named
"my.resume.json":

```dos
docker run --user $(id -u) --rm -it -v /c/Users/<myuser>/my-resume-folder:/resumes kir4h/hackmyresume-all-themes /resumes/my.resume.json /resumes/MyResume.pdf -t /usr/lib/node_modules/jsonresume-theme-eloquent
```

#### With Docker for Windows

Exporting your resume to pdf using the theme `jsonresume-theme-eloquent`, assumming that your resume is on your current
folder, is named `my.resume.json` and that you are using powershell:

```powershell
docker run --user $(id -u) --rm -it -v ${PWD}:/resumes kir4h/hackmyresume-all-themes /resumes/my.resume.json /resumes/MyResume.pdf -t /usr/lib/node_modules/jsonresume-theme-eloquent
```

## Exporting the resume for all installed themes

A small shell script included in this image can be used in order to perform an export for every JSON Resume
installed theme. This can be useful to have a glimpse at every theme and decide which one looks better for our resume.

The script (`build_all_themes.sh`) will:

1. Look for a file matching the pattern `*resume.json`. If multiple are found, only the first one will be considered.
2. Iterate over all the available JSON Resume themes
3. For each theme, it will export the resume to html and pdf into the same folder where the resume is located. The
resulting filename will be `<prefix>-<theme name>.pdf[.html]` where prefix is optional and defaults to `resume`

The following command:

```bash
docker run --rm --name=hackmyresume -it -v $(pwd):/resumes kir4h/hackmyresume-all-themes build_all_themes.sh myname
```

Will generate one .pdf.html and one .pdf file for every theme installed in the image. Resulting filenames will have the
form `myname-<theme name>.pdf[.html]`
