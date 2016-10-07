//
//  ViewController.swift
//  GitHubReps
//
//  Created by Dima Nikolayenko on 10/6/16.
//  Copyright © 2016 Dima Nikolayenko. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var repos = [Repo]()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NetworkManager.sharedInstance.getRepos { (repos) in
            if repos != nil {
                self.repos = repos!
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RepoTableViewCell.self)) as! RepoTableViewCell
        
        cell.repo = repos[indexPath.row]
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let repo = repos[indexPath.row]
//        if let url = repo.url {
//            UIApplication.shared.openURL(url)
//        }
//    }
}

