//
//  CellForCollectionViewTableViewCell.swift
//  News
//
//  Created by Ella on 3/22/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit

class CellForCollectionViewTableViewCell: UITableViewCell {
    @IBOutlet private weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {

        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }

}
