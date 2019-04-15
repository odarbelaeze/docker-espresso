# Quantum espresso docker images

Set of light weight docker images for quantum espresso. This images are based
on alpine linux, the system package manager would be `apk`.

## Available tags

- `6`, `6.4`, `6-alpine`, `6.4-alpine`, `alpine`, `latest`
- `6.3`, `6.3-alpine`: Version 6.3 latest patch
- `6.2`, `6.2-alpine`: Version 6.2.1 latest patch
- `6.1`, `6.1-alpine`: Version 6.1.0 latest patch
- `6.0`, `6.0-alpine`: Version 6.0.0 latest patch

## Usage

Just pop into your terminal and run:

```bash
docker run -i odarbelaeze/espresso pw.x < pw.in > pw.out
```

You might want to bind pseudo or temp file folders,

```bash
docker run -i \
    -v /your/path/to/pseudos:/pseudos:ro \
    odarbelaeze/espresso pw.x < pw.in > pw.out
```

## Performance

These images are not built for performance, just for convenience.
