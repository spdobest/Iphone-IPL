//
//  ArticleTableViewCell.swift
//  IPL
//
//  Created by sibaprasad on 16/03/18.
//  Copyright © 2018 SP infotech. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet var myImage: UIImageView!
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
