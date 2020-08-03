public enum GitHub {
    static let token = "c3cf5cbd7811a34e80f3a3ab17d6fbfa22bd0ccc"
}

extension GitHub {
    
    public struct Repo: Codable, Equatable {
        public let name: String
        public let description: String?
    }
}
