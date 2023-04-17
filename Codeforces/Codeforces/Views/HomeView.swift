//
//  HomeView.swift
//  Codeforces
//
//  Created by Rajveer Singh on 18/04/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.all, 30)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
