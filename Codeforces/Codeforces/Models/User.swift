//
//  UserData.swift
//  Codeforces
//
//  Created by Rajveer Singh on 20/04/23.
//

import Foundation
import SwiftUI

let networkManager = NetworkManager()

struct User: Hashable, Codable {
    var handle: String
    var email: String?
    var firstName: String?
    var country: String?
    
    var contribution: Int
    
    var rating: Int
    var maxRating: Int
    var rank: String
    var maxRank: String
    
    var friendOfCount: Int
    
    var avatar: String
    var titlePhoto: String
    
    var image: UIImage?
    
    enum CodingKeys: String, CodingKey {
        case handle
        case email
        case firstName
        case country
        
        case contribution
        
        case rating
        case maxRating
        case rank
        case maxRank
        
        case friendOfCount
        
        case avatar
        case titlePhoto
    }
}

final class UserModel: ObservableObject {
    @Published var user: User?
}
