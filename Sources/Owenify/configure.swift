import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    let corsConfiguration = CORSMiddleware.Configuration(
        allowedOrigin: .all, // ALL erstmal nur zum Testen
        allowedMethods: [.GET, .POST, .OPTIONS],
        allowedHeaders: [.accept, .authorization, .contentType, .origin, .xRequestedWith]
    )
    let cors = CORSMiddleware(configuration: corsConfiguration)
    
    app.middleware.use(cors)
    app.middleware.use(ErrorMiddleware.default(environment: app.environment))
    
    app.http.server.configuration.hostname = Config.hostname
    
    // set the port to env or the Port defined in Port.swift
    if let portString = Environment.get("PORT"),
       let port = Int(portString) {
        app.http.server.configuration.port = port
    } else {
        app.http.server.configuration.port = Config.port
    }
    // register routes
    try routes(app)
}
