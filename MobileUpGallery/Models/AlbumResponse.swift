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
	let album_id, date, id, owner_id: Int
	let has_tags: Bool
	let sizes: [Size]
	let text: String
	let user_id: Int
}

// MARK: - Size
struct Size: Codable {
	let height: Int
	let url: String
	let type: TypeEnum
	let width: Int
}

enum TypeEnum: String, Codable {
	case m = "m"
	case o = "o"
	case p = "p"
	case q = "q"
	case r = "r"
	case s = "s"
	case w = "w"
	case x = "x"
	case y = "y"
	case z = "z"
}
