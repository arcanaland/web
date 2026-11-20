check:
    #!/bin/sh
    rc=0
    lefthook run pre-commit --all-files --no-auto-install || rc=1
    lefthook run publishable --no-auto-install || rc=1
    exit $rc

# Run zensical (just docs serve)
[working-directory: 'docs']
docs *args:
    uv run --with-requirements requirements.txt zensical {{args}}
