import XCTest
@testable import Network
import Foundation

final class AuthorizationTests: XCTestCase {
        
    func test_() {
        let s = "https://github.com/login/oauth/authorize"
        let url = URL(string: s)!
        let session = URLSession(configuration: .default)
        
        let e = expectation(description: "")
        
        let t = session.dataTask(with: url) { ºdata, ºresponse, ºerror in
            e.fulfill()
            guard let data = ºdata else {
                return XCTFail()
            }
            print(String(data: data, encoding: .utf8))
        }
        
        t.resume()
        
        wait(for: [e], timeout: 5)
    }
    
}
