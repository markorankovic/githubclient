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
    var body: some View {
        print(1)
        return RepoView(repoStore: RepoStore())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
