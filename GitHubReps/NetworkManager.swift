//
//  NetworkManager.swift
//  GitHubReps
//
//  Created by Dima Nikolayenko on 10/6/16.
//  Copyright © 2016 Dima Nikolayenko. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    static let sharedInstance = NetworkManager()
    
    private let url = "https://api.github.com/search/repositories?q=swift&sort=stars&order=desc"
    
    func getRepos(_ completionClosure: ((_ repos: [Repo]?) -> ())?) {
        Alamofire.request(url).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                var repos: [Repo]? = nil
                
                if let dict = value as? [String: AnyObject] {
                    if let items = dict["items"] as? Array<[String: AnyObject]> {
                        repos = [Repo]()
                        
                        for repoDict in items {
                            let repo = Repo(dict: repoDict)
                            repos?.append(repo)
                        }
                    }
                }
                
                if completionClosure != nil {
                    completionClosure!(repos)
                }
            case .failure(let error):
                print(error)
                
                if completionClosure != nil {
                    completionClosure!(nil)
                }
            }
        }
    }
}
