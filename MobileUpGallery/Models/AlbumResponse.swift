// MARK: - Welcome
struct Welcome: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let count: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let date: Int
    let sizes: [Size]
    let text: String
}

// MARK: - Size
struct Size: Codable {
    let height: Int
    let url: String
    let type: TypeEnum
    let width: Int
}

enum TypeEnum: String, Codable {
    case m
    case o
    case p
    case q
    case r
    case s
    case w
    case x
    case y
    case z
}

struct ValidationWelcome: Codable {
    let response: ValidationResponse
}

struct ValidationResponse: Codable {
    let success: Int
    let userId, date, expire: Int?
}
