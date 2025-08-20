import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "Owenify is running!"
    }

    // Route to create a new shortened link
    app.post("create") { req async throws -> [String: String] in
        let link = LinkStore.shared.createLink(url: Config.getRedirectURL())
        let shortenedURL = "\(req.application.http.server.configuration.hostname):\(req.application.http.server.configuration.port)/\(link.id)"
        return ["shortened_url": shortenedURL, "info_url": "\(req.application.http.server.configuration.hostname):\(req.application.http.server.configuration.port)/info/\(link.id)"]
    }

    // Route to handle the shortened link
    app.get(":id") { req async throws -> Response in
        guard let id = req.parameters.get("id") else {
            throw Abort(.badRequest)
        }
        guard let link = LinkStore.shared.getLink(id: id) else {
            throw Abort(.notFound)
        }

        let ip = req.remoteAddress?.ipAddress ?? "unknown"
        let userAgent = req.headers.first(name: .userAgent) ?? "unknown"
        LinkStore.shared.addStat(id: id, ip: ip, userAgent: userAgent)

        return req.redirect(to: Config.getRedirectURL(), type: .permanent)
    }

    // Route to view the stats for a shortened link
    app.get("info", ":id") { req async throws -> Link in
        guard let id = req.parameters.get("id") else {
            throw Abort(.badRequest)
        }
        guard let link = LinkStore.shared.getLink(id: id) else {
            throw Abort(.notFound)
        }
        return link
    }
}
