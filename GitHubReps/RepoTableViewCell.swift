//
//  RepoTableViewCell.swift
//  GitHubReps
//
//  Created by Dima Nikolayenko on 10/6/16.
//  Copyright © 2016 Dima Nikolayenko. All rights reserved.
//

import UIKit
import AlamofireImage

class RepoTableViewCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel?
    @IBOutlet private weak var avatarImageView: UIImageView?
    @IBOutlet private weak var descLabel: UILabel?
    @IBOutlet private weak var urlButton: UIButton?
    
    var repo = Repo() {
        didSet {
            nameLabel?.text = repo.ownerName
            descLabel?.text = repo.description
            urlButton?.setTitle(repo.url?.absoluteString, for: .normal)
            
            if let url = URL(string: repo.ownerAvatar) {
                avatarImageView?.af_setImage(withURL: url)
            }
        }
    }
    
    @IBAction func onUrlButtonTapped(_ sender: AnyObject) {
        if let url = repo.url {
            UIApplication.shared.openURL(url)
        }
    }
}
