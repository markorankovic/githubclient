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
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            switch viewRouter.currentPage {
            case 3: ContentView3()
            default: Text("Loading")
            }
        }
    }
}
