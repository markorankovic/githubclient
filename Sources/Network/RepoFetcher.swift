import Foundation

public class RepoFetcher {
    
    public enum Status {
        case inactive
        case active
        case error(String)
        case ok(String)
    }
            
    static let session = URLSession(configuration: .default)

    public var ºrepos: [GitHub.Repo]?
    public var status: Status = .inactive
    
    public var fakeOk: Data?
    
    public init() { }
    
    public func fetch(callBack: @escaping (_ status: Status) -> ()) {
        status = .active
        
        if let fakeOk = fakeOk {
            return handler(callBack, fakeOk, nil, nil)
        }
        
        guard let url = URL(string: "https://api.github.com/user/repos") else {
            status = .error("Invalid URL")
            return
        }
        
        var req = URLRequest(url: url)
        req.addValue("token \(GitHub.token)", forHTTPHeaderField: "Authorization")
        
        let task = RepoFetcher.session.dataTask(with: req) { ºdata, ºresponse, ºerror in
            self.handler(callBack, ºdata, ºresponse, ºerror)
        }
        
        task.resume()
    }
    
    func handler(_ callBack: @escaping (_ status: Status) -> (), _ ºdata: Data?, _ ºresponse: URLResponse?, _ ºerror: Error?) {
        defer { callBack(self.status) }
        guard let data = ºdata else {
            self.status = .error("No data")
            return
        }
        do {
            self.ºrepos = try JSONDecoder().decode([GitHub.Repo].self, from: data)
            self.status = .ok("\(self.ºrepos!)")
        }
        catch {
            self.status = .error("\(error)")
            print("\(error)")
        }
    }

}
