//
//  ContentView.swift
//  TestApp
//
//  Created by Marko Rankovic on 8/3/20.
//  Copyright © 2020 Marko Rankovic. All rights reserved.
//

import SwiftUI
import Network

struct ContentView: View {
    @ObservedObject var repoStore = RepoStore()
    var body: some View {
        NavigationView {
            List(repoStore.repos) { repo in RepoView(repo: repo) }
                .navigationBarTitle("Repositories")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
