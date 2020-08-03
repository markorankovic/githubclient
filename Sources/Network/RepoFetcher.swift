import Foundation

public class RepoFetcher {
    
    var ºrepos: [GitHub.Repo]?
    
    public func fetch(callBack: @escaping (_ repos: [GitHub.Repo]?) -> ()) {
        guard let url = URL(string: "https://api.github.com/user/repos") else {
            return
        }
                
        let session = URLSession(configuration: .default)
        
        var req = URLRequest(url: url)
        req.addValue("token \(GitHub.token)", forHTTPHeaderField: "Authorization")
        
        let task = session.dataTask(with: req) { ºdata, ºresponse, ºerror in
            defer { callBack(self.ºrepos) }
            guard let data = ºdata else {
                return
            }
            do {
                self.ºrepos = try JSONDecoder().decode([GitHub.Repo].self, from: data)
            }
            catch {
                print("\(error)")
            }
        }
        
        task.resume()
    }

}
