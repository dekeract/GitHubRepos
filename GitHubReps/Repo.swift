//
//  Repo.swift
//  GitHubReps
//
//  Created by Dima Nikolayenko on 10/6/16.
//  Copyright © 2016 Dima Nikolayenko. All rights reserved.
//

import Foundation

class Repo {
    var ownerName = "Unspecified"
    var ownerAvatar = ""
    var description = "Mistery"
    var url: URL?
    
    init(dict: [String: AnyObject]) {
        if let ownerDict = dict["owner"] as? Dictionary<String, AnyObject> {
            ownerName = ownerDict["login"] as? String ?? "Unspecified"
            ownerAvatar = ownerDict["avatar_url"] as? String ?? ""
        }
        
        description = dict["description"] as? String ?? "Mistery"
        let stringURL = dict["html_url"] as? String ?? ""
        url = URL(string: stringURL)
    }
    
    init() {
        
    }
}
