set dotenv-load

export VERSION := env_var_or_default("VERSION", `date +'%Y%m%d.%H%M'`)

# Generate a version
generate_version:
    @echo "{{VERSION}}"

# Create a new release (by creating )
release:
    git tag -a "{{VERSION}}" -m "{{VERSION}}"
    git push origin "{{VERSION}}"
    @echo
    @echo "Created release (tag): {{VERSION}}"
    @echo

# Build a local docker image
build-local:
    docker build -t tedge-mosquitto -f src/Dockerfile src

# Run/start a local docker image (for local validation)
run-local PORT="1883" *ARGS="": build-local
    docker run --rm -it -p {{PORT}}:1883 {{ARGS}} tedge-mosquitto
