import Foundation

struct Config {
    enum RedirectType {
        case rickRoll
        case feelingLucky
    }

    // DEFAULT: 8080 - The Default Port for Vapor Servers
    static let port = 8080
    // DEFAULT: "0.0.0.0" which allows it to be accessible to everyone, not just localhost
    static let hostname = "0.0.0.0"
    // The type of redirect to use.
    static let redirectType: RedirectType = .rickRoll

    static func getRedirectURL() -> String {
        switch redirectType {
        case .rickRoll:
            return "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
        case .feelingLucky:
            return "https://www.google.com/search?btnI=I'm+Feeling+Lucky&q=random"
        }
    }
}
