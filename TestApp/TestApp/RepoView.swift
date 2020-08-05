import Foundation
import SwiftUI
import Network

struct RepoView: View {
        
    let repo: GitHub.Repo
    
    init(repo: GitHub.Repo) {
        self.repo = repo
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(repo.name)
            Text(repo.description ?? "")
        }
    }
    
}
