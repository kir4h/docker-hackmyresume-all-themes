FROM kir4h/hackmyresume:1.0.0

COPY scripts/build_all_themes.sh /usr/bin/build_all_themes.sh

RUN chmod +x /usr/bin/build_all_themes.sh

# Add hackmyresume and jsonresume themes
RUN npm install -g \
    jsonresume-theme-bootstrap-icons@0.2.1 \
    jsonresume-theme-class@0.1.2 \
    jsonresume-theme-classy@1.0.9 \
    jsonresume-theme-compact@1.0.4 \
    jsonresume-theme-compact-extended@1.0.3 \
    jsonresume-theme-contempo@0.0.3 \
    jsonresume-theme-dark-classy@1.0.1 \
    jsonresume-theme-dark-classy-responsive@1.0.3 \
    jsonresume-theme-elegant@1.12.1 \
    jsonresume-theme-elegant-fr@1.2.1 \
    jsonresume-theme-eloquent@4.1.0 \
    jsonresume-theme-kendall@0.1.19 \
    jsonresume-theme-kendall-beardtree@0.0.1 \
    jsonresume-theme-modern@0.0.18 \
    jsonresume-theme-modern-extended@0.1.1 \
    jsonresume-theme-nameme@0.0.1 \
    jsonresume-theme-onepage@0.0.3 \
    jsonresume-theme-sceptile@1.0.5 \
    jsonresume-theme-short@0.1.7 \
    jsonresume-theme-slick@0.1.16 \
    jsonresume-theme-spartan@0.2.1 \
    jsonresume-theme-stackoverflow@1.4.0 \
    jsonresume-theme-stackoverflow2@1.0.6 \
    jsonresume-theme-striking@0.0.8