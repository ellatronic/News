//
//  SidewaysCell.swift
//  News
//
//  Created by Ella on 3/20/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit

class SidewaysCell: UITableViewCell {
    @IBOutlet weak var sidewaysInnerView: UIView!
    @IBOutlet weak var topArticleImage: UIImageView!
    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        topArticleImage.layer.cornerRadius = 5.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
