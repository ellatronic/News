//
//  CollectionViewCell.swift
//  News
//
//  Created by Ella on 3/22/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var collectionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        articleImageView.layer.cornerRadius = 5.0
    }
}
