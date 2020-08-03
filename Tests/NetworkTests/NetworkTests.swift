import XCTest
import Foundation
@testable import Network

extension Bundle {
    private class AClassInThisBundle {}
    public static let this = Bundle(for: AClassInThisBundle.self)
}

extension GitHub.Repo {
    
    class Service {
        
        struct JSON: Codable {
            
        }
    }
}

final class NetworkTests: XCTestCase {
    
    func test_repoFetcher() {
        
        let repoFetcher = RepoFetcher()
        
        let group = DispatchGroup()
        
        group.enter() // Waiting begins
        
        repoFetcher.fetch {
            ºrepos in
            defer { group.leave() } // Waiting ends
            guard let repos = ºrepos else {
                return XCTFail("Error accquiring repos")
            }
            print("✅", repos)
        }
        
        group.wait() // Wait to see if fetching repos was successful
        
    }
    
}

#if os(macOS)
public typealias Pasteboard = NSPasteboard

extension Pasteboard {
    
    public static func copy(_ string: String) {
        Pasteboard.general.clearContents()
        Pasteboard.general.setData(string.data(using: .utf8), forType: .string)
    }
}
#endif
