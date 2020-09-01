import Foundation
import UIKit

public class Authenticator {
    
    public static func access(_ access_token: String, _ callback: @escaping (_ access_token: String) -> ()) {
        var req = URLRequest(url: URL(string: "https://api.github.com/user")!)
        req.addValue("token \(access_token)", forHTTPHeaderField: "Authorization")
        let session = URLSession(configuration: .default)
        session.dataTask(with: req) { data, res, error in
            guard let res = res else {
                return
            }
            print(res)
            callback(access_token)
        }.resume()
    }

    @available(iOS 10.0, *)
    public static func authenticate(_ code: String, callback: @escaping (_ access_token: String) -> ()) {
        let urlString = "https://github.com/login/oauth/access_token?client_id=3cabd298676f935ca40f&client_secret=bd93be52a6ac4197cbcd30378b85c86a74300034&code=\(code)"
        print(code)
        let url = URL(string: urlString)!
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        let session = URLSession(configuration: .default)
        session.dataTask(with: req) { data, res, error in
            guard let data = data else {
                return
            }
            let result = String(data: data, encoding: .utf8)!
            let filter1 = result.split(separator: "&")
            let filter2 = filter1.split(separator: "=")
            let access_token = "\(filter2[0][0].split(separator: "=")[1])"
            Authenticator.access(access_token, callback)
        }.resume()
    }
        
}
