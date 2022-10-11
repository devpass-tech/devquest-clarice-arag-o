//
//  Repository.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 14/01/22.
//

import Foundation

struct Repository: Decodable {
    
    let name: String
    let owner: Owner
    
}

struct Owner: Decodable {
    
    let avatarUrl: String
}
