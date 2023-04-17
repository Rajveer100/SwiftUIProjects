//
//  ContentView.swift
//  Codeforces
//
//  Created by Rajveer Singh on 18/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                HomeView()
                UserView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
