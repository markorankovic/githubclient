import XCTest
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
        
        let exp = expectation(description: "Repos to be fetched")
                
        repoFetcher.fetch {
            status in
            guard String(describing: status).contains("ok") else {
                return XCTFail("\(status)")
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 5)
    }
    
    func test_repoFetcher_fakeOk() {
        let repoFetcher = RepoFetcher()
                                
        repoFetcher.fakeOk = fake_ok
        
        repoFetcher.fetch {
            status in
            guard String(describing: status).contains("ok") else {
                return XCTFail("\(status)")
            }
        }
    }
    
}
