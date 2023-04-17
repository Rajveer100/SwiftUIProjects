//
//  ProfileView.swift
//  Codeforces
//
//  Created by Rajveer Singh on 19/04/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var userModel: UserModel
    let networkManager = NetworkManager()
    
    var body: some View {
        VStack {
            if let user = userModel.user,
               let profileImage = user.image {
                HStack {
                    Image(uiImage: profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, style: StrokeStyle(lineWidth: 4))
                        }
                        .shadow(radius: 7)
                        .frame(width: 100, height: 100, alignment: .topLeading)
                    
                    Text(user.handle)
                        .font(.title)
                }
                
                Text("Contest Rating: \(String(user.rating)) (\(user.rank.capitalized))")
                    .font(.title2)
                    .bold()
                Text("Max Rating: \(String(user.maxRating)) (\(user.maxRank.capitalized))")
                    .font(.title2)
                    .bold()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userModel: UserModel())
    }
}
