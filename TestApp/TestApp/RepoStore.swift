import Foundation
import Network
import SwiftUI

class RepoStore: ObservableObject {
    
    static var access_token: String?
    
    @Published var repos: [GitHub.Repo] = []
    
    private let f = RepoFetcher()
            
    init() { get() }
    
    func get() {
        if let access_token = RepoStore.access_token {
            f.access_token = access_token
        }
        f.fetch { [weak self] status in
            print(status)
            guard String(describing: status).contains("ok") else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.repos = self.f.ºrepos!
            }
        }
    }
}
