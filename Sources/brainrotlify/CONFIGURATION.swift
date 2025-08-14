// THIS IS THE SERVER CONFIGURATION FILE FOR THE BRAINROTLIFY VAPOR SERVER
// WARNING: Only change these values if you know what you're doing as you could break your configuration
// If theres an issue after changing this configuration please restore it back to defaults.
// After changing this configuration you have to restart your Server

import Foundation

struct ServerConfiguration {
    // DEFAULT: 8080 - The Default Port for Vapor Servers
    static let port = 8080
    // DEFAULT: "0.0.0.0" which allows it to be accessible to everyone, not just localhost
    static let hostname = "0.0.0.0"
    // DEFAULT: "" (empty), this is recommended to only be used when you know the server can only be accessed by you as it allows anyone that has access to your server to use your API Key.
    static let savedAPIKey = ""
}
