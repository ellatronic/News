//
//  TwoImageCell.swift
//  News
//
//  Created by Ella on 3/20/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit

class TwoImageCell: UITableViewCell {
    @IBOutlet weak var twoCellInnerView: UIView!
    @IBOutlet weak var leftArticleImage: UIImageView!
    @IBOutlet weak var rightArticleImage: UIImageView!
    @IBOutlet weak var leftSourceLabel: UILabel!
    @IBOutlet weak var leftTitleLabel: UILabel!
    @IBOutlet weak var rightSourceLabel: UILabel!
    @IBOutlet weak var rightTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
