## tedge-mqtt-broker

thin-edge.io specific MQTT broker (using tedge-mqtt-broker) container which includes the recommended mosquitto version as well as pre-defined configuration so that mosquitto works with thin-edge.io out of the box.

## Development

All of the tasks in the projects use [just](https://github.com/casey/just). Please install just before using any of the instructions.

### Trigger a new release

1. Switch to the main branch (on the main repo)

2. Run the release task

    ```sh
    just release
    ```

    The task will create a git tag and push it to the configured remote origin.

### Run and validate a local mqtt broker

You can run/start a local container with the MQTT broker by using [just](https://github.com/casey/just) task runner.

```
just run-local 1884
```

Where `1884` is the port where the MQTT broker will be exposed to on your local host.

After you have started the broker, then check that everything is working properly by running the following steps in a different console:

1. Publish a retained message on any topic

    ```
    mosquitto_pub -h localhost -p 1884 -t 'test/me' -m 'hello' -r
    ```

2. Subscribe to all topics to check that the above retained message is delivered

    ```
    mosquitto_sub -h localhost -p 1884 -t '#'
    ```

    You should see the above message printed to the console.

    ```
    hello
    ```
