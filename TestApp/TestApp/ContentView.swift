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
    
    var repositories: [GitHub.Repo] = []
    
    var body: some View {
        let fetcher = RepoFetcher()
        Text("GitHub Repositories")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
