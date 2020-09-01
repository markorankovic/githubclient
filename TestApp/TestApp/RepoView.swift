import Foundation
import SwiftUI
import Network

struct RepoView: View {
        
    var repo: GitHub.Repo
        
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(repo.name)")
            Text("Description: \(repo.description ?? "")")
        }
    }
    
}
