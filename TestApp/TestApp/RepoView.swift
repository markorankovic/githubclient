import Foundation
import SwiftUI

struct RepoView: View {
    
    @ObservedObject var repoStore: RepoStore
    
    var body: Text {
        return Text("\(repoStore.repos.count)")
    }
    
}
