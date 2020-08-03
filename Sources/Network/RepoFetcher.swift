import Foundation

public class RepoFetcher {
    
    public static func fetch(callBack: @escaping (_ repos: [GitHub.Repo]?) -> ()) {
        guard let url = URL(string: "https://api.github.com/user/repos") else {
            return
        }
                
        let session = URLSession(configuration: .default)
        
        var req = URLRequest(url: url)
        req.addValue("token \(GitHub.token)", forHTTPHeaderField: "Authorization")
        
        let task = session.dataTask(with: req) { ºdata, ºresponse, ºerror in
            var ºrepos: [GitHub.Repo]?
            defer { callBack(ºrepos) }
            guard let data = ºdata else {
                return
            }
            do {
                ºrepos = try JSONDecoder().decode([GitHub.Repo].self, from: data)
            }
            catch {
                print("\(error)")
            }
        }
        
        task.resume()
    }

}
