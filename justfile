# Run every check in lefthook.yml over the whole repo. Runs both groups even when the first fails.
check:
    #!/bin/sh
    rc=0
    lefthook run pre-commit --all-files --no-auto-install || rc=1
    lefthook run publishable --no-auto-install || rc=1
    exit $rc

# Run zensical for the docs site with the version Netlify uses: `just docs serve`, `just docs build`.
[working-directory: 'docs']
docs *args:
    uv run --with-requirements requirements.txt zensical {{args}}

# Copy the Tarot Canvas icon in as the docs logo and render the favicons from it.
icons src="../tarot-canvas/packaging/icon.svg":
    #!/bin/sh
    set -eu
    out=docs/content/assets
    mkdir -p "$out"
    cp "{{src}}" "$out/logo.svg"
    rsvg-convert -w 48 -h 48 "{{src}}" -o "$out/favicon.png"
    tmp=$(mktemp -d)
    for n in 16 32 48; do rsvg-convert -w $n -h $n "{{src}}" -o "$tmp/$n.png"; done
    magick "$tmp/16.png" "$tmp/32.png" "$tmp/48.png" docs/content/favicon.ico
    rm -r "$tmp"
