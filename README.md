# Owenify

Owenify is a simple, self-hostable URL shortener and IP logger, similar to Grabify. It's built with Swift and Vapor and is designed to be easy to set up and use. This project is open source and available on GitHub.

## Features

-   **URL Shortening**: Create short links that redirect to a configurable URL.
-   **IP Logging**: Log the IP address and User-Agent of everyone who clicks on a shortened link.
-   **Easy to Deploy**: Run it with Docker or build it from source.
-   **FOSS**: Free and Open Source Software.

## Setup and Running

### Docker (Recommended)

The easiest way to run Owenify is with Docker.

1.  **Build the Docker image**:
    ```bash
    docker compose build
    ```

2.  **Run the server**:
    ```bash
    docker compose up app
    ```

The server will be running on port 8080.

### From Source

You can also build and run Owenify from source.

**Requirements**:
- Swift 6.0 or later
- Vapor

1.  **Clone the repository**:
    ```bash
    git clone <repository-url>
    cd owenify
    ```

2.  **Build and run the server**:
    ```bash
    swift run
    ```

## Usage

### Create a new shortened link

Send a POST request to the `/create` endpoint.

```bash
curl -X POST http://localhost:8080/create
```

The response will be a JSON object containing the shortened URL and the info URL.

```json
{
  "shortened_url": "0.0.0.0:8080/xxxxxx",
  "info_url": "0.0.0.0:8080/info/xxxxxx"
}
```

### View link stats

To view the stats for a shortened link, visit the `info_url` provided in the create response.

```bash
curl http://localhost:8080/info/xxxxxx
```

This will return a JSON object with the link details and a list of stats for each click.

## Configuration

You can configure the server by editing the `Sources/Owenify/Config.swift` file.

-   `port`: The port the server will run on. Default: `8080`.
-   `hostname`: The hostname the server will bind to. Default: `"0.0.0.0"`.
-   `redirectURL`: The URL that the shortened links will redirect to. Default: A rickroll.

After modifying the configuration, you'll need to rebuild and restart the server.
