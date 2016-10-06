//
//  NetworkManager.swift
//  GitHubReps
//
//  Created by Dima Nikolayenko on 10/6/16.
//  Copyright © 2016 Dima Nikolayenko. All rights reserved.
//

import Foundation

class NetworkManager {
    static let sharedInstance = NetworkManager()
    
    private let url = "https://api.github.com/search/repositories?q=swift&sort=stars&order=desc"
    
    
}
