//
//  PostTableViewCell.swift
//  CIA
//
//  Created by Paul Hulatt on 26/09/2019.
//  Copyright © 2019 Apptimal Ltd. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var postImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var likesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
