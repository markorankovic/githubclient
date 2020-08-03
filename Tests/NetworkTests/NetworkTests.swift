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
        
        group.enter()
        repoFetcher.fetch {
            ºrepos in
            guard let repos = ºrepos else {
                return XCTFail("Error fetching repos")
            }
            print("✅", repos)
            group.leave()
        }
        
        group.wait()
        
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
