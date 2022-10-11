//
//  Owner.swift
//  GitHubApp
//
//  Created by clarice aragao on 28/09/22.
//

import Foundation

struct User: Decodable {
    let name: String
    let bio: String
    let followers: Int
    let email: String
    let location: String
    
}
