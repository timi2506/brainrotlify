import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // this is required to make it available to everyone, not only localhost
    app.http.server.configuration.hostname = ServerConfiguration.hostname
    // set the port to env or the Port defined in Port.swift
    if let portString = Environment.get("PORT"),
       let port = Int(portString) {
        app.http.server.configuration.port = port
    } else {
        app.http.server.configuration.port = ServerConfiguration.port
    }
    // register routes
    try routes(app)
}
