import Foundation

public enum GitHub {
    static let token = "c3cf5cbd7811a34e80f3a3ab17d6fbfa22bd0ccc"
}

extension GitHub {
    
    public struct Repo: Codable, Equatable, Identifiable {
        public var id = UUID()
        public let name: String
        public let description: String?
        
        public init(name: String, description: String?) {
            self.name = name
            self.description = description
        }
        
    }
    
}

public let testData = [
    GitHub.Repo(name: "GTA VI", description: "Next GTA game"),
    GitHub.Repo(name: "Mindreader", description: "Software to read minds"),
    GitHub.Repo(name: "AI Pro Gamer", description: "AI playing as a pro gamer")
]
