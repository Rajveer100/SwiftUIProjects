//
//  Networking.swift
//  Codeforces
//
//  Created by Rajveer Singh on 20/04/23.
//

import Foundation
import SwiftUI

struct UserSearchResponse: Codable {
    let status: String
    let result: [User]
}

class NetworkManager {
    var urlComponents = URLComponents(string: "https://codeforces.com/api/user.info")!
    
    func fetchProfileImage(with imageURLString: String) async throws -> UIImage? {
        guard let imageURL = URL(string: imageURLString),
              let data = try? Data(contentsOf: imageURL) else {
            return nil
        }
        
        return UIImage(data: data)
    }
    
    func fetchUserData(for username: String?) async throws -> User? {
        guard let username = username else {
            return nil
        }
        
        urlComponents.queryItems = ["handles": [username]].map({ (key: String, value: [String]) in
            URLQueryItem(name: key, value: value.first)
        })
        
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        if let httpResponse = response as? HTTPURLResponse,
           httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
            let decoder = JSONDecoder()
            let searchResponse = try decoder.decode(UserSearchResponse.self, from: data)
            
            return searchResponse.result.first
        }
        
        return nil
    }
}

extension Data {
    func prettyPrintedJSONString() {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
              let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
              let prettyJSONString = String(data: jsonData, encoding: .utf8) else {
            print("Failed to read JSON Object.")
            return
        }
        
        print(prettyJSONString)
    }
}
