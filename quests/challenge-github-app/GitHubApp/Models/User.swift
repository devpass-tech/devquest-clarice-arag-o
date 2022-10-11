//
//  User.swift
//  GitHubApp
//
//  Created by clarice aragao on 10/10/22.
//

import Foundation

struct User: Decodable {
    
    let name: String
    let bio: String
    let folllowers: Int
    let email: String?
    let location: String
}
