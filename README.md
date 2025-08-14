# brainrotlify

Server that uses the Gemini API to brainrot and simplify any text, made for fun

## Requirements
Vapor
- Linux: https://docs.vapor.codes/install/linux/
- macOS: https://docs.vapor.codes/install/macos/

## Starting the Server

### Method 1: Terminal
Make sure you are in the Project Root, you can check this by running `ls`, the output should look something like this:

```bash
Dockerfile        Package.swift        Sources
Package.resolved    README.md        docker-compose.yml
```

Once you made sure you are in the correct directory, run 

```bash
swift run
```

### Method 2: Xcode (macOS Only)
Open the Package.swift file in Xcode, under Run Destinations select "My Mac" and Press Run (Play Icon or CMD + R)

## Usage

  POST request to /brainrot with JSON Body:
  {
    "apiKey": "<Your Google Gemini API Key>",
    "message": "<Text you want brainrotted>"
  }

TIP: You can add a saved API key in /Sources/brainrotlify/CONFIGURATION.swift to allow the apiKey to be left our of the Request and use the saved API key but 

WARNING: this is recommended to only be used when you know the server can only be accessed by you as it allows anyone that has access to your server to use your API Key.

## Example
```bash
  curl "http://localhost:8080/brainrot" \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{
      "apiKey": "YOUR GEMINI API KEY (typically AIzaSy...)",
      "message": "The cat is sleeping on the couch"
    }'
```

## Notes

  • The language of the output will match the language of your input message.
  
  • Response is only the brainrotted text with no extra phrases or confirmations.
  
  • Errors will return JSON with an error reason.

  • You can get a free Gemini API Key at https://aistudio.google.com
  
## Configuration

Brainrotlify comes with a Configuration File at /Sources/brainrotlify/CONFIGURATION.swift

It has the following Configuration Parameters:

- port: The Port the Server has to use - By Default: 8080
- hostname: The Hostname the Server should use - By Default: "0.0.0.0"
- savedAPIKey: Allow the apiKey to be left our of the Request and use the saved API key but 
    WARNING: this is recommended to only be used when you know the server can only be accessed by you as it allows anyone that has access to your server to use your API Key.

After modifying the contents of the configuration file you have to restart the server

TIP: You can also change the Port Temporarely by starting the server with
```bash
PORT=1234 swift run
```
where 1234 is your desired Port
### Default Configuration File
```swift
import Foundation

struct ServerConfiguration {
    // DEFAULT: 8080 - The Default Port for Vapor Servers
    static let port = 8080
    // DEFAULT: "0.0.0.0" which allows it to be accessible to everyone, not just localhost
    static let hostname = "0.0.0.0"
    // DEFAULT: "" (empty), this is recommended to only be used when you know the server can only be accessed by you as it allows anyone that has access to your server to use your API Key.
    static let savedAPIKey = ""
}

```
