import SwiftUI
import Network

struct RepoList: View {
    @ObservedObject var repoStore = RepoStore()
    
    var body: some View {
        NavigationView {
            List(repoStore.repos) { repo in RepoView(repo: repo) }
                .navigationBarTitle("Repositories")
        }
    }
}
