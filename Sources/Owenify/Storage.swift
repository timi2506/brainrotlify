import Foundation

struct Link: Codable {
    let id: String
    let originalURL: String
    var stats: [LinkStat] = []
}

struct LinkStat: Codable {
    let ip: String
    let userAgent: String
    let timestamp: Date
}

class LinkStore {
    static let shared = LinkStore()
    private var links: [String: Link] = [:]
    private let queue = DispatchQueue(label: "com.owenify.linkstore")

    func createLink(url: String) -> Link {
        let id = randomShortID()
        let link = Link(id: id, originalURL: url)
        queue.sync {
            links[id] = link
        }
        return link
    }

    func getLink(id: String) -> Link? {
        queue.sync {
            return links[id]
        }
    }

    func addStat(id: String, ip: String, userAgent: String) {
        queue.sync {
            let stat = LinkStat(ip: ip, userAgent: userAgent, timestamp: Date())
            links[id]?.stats.append(stat)
        }
    }

    private func randomShortID(length: Int = 6) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
