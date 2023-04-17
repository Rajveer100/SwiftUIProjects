//
//  UserView.swift
//  Codeforces
//
//  Created by Rajveer Singh on 18/04/23.
//

import SwiftUI

struct UserView: View {
    @StateObject var userModel = UserModel()
    @State private var username: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter Your Username", text: $username)
                .font(.title)
                .multilineTextAlignment(.center)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            NavigationLink(destination: ProfileView(userModel: userModel), label: {
                Image(systemName: "arrow.forward.circle")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .padding(20)
            })
            .simultaneousGesture(TapGesture().onEnded({
                Task {
                    if let fetchedUserProfile = try await fetchUserProfile(),
                       let profileImage = try? await networkManager.fetchProfileImage(with: fetchedUserProfile.titlePhoto) {
                        userModel.user = fetchedUserProfile
                        userModel.user?.image = profileImage
                    }
                }
            }))
        }
    }
    
    func fetchUserProfile() async throws -> User? {
        return try? await networkManager.fetchUserData(for: username)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
