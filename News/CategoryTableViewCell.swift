//
//  CategoryTableViewCell.swift
//  News
//
//  Created by Ella on 3/23/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var categoryCollectionView: UICollectionView!

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

        categoryCollectionView.delegate = dataSourceDelegate
        categoryCollectionView.dataSource = dataSourceDelegate
        categoryCollectionView.tag = row
        categoryCollectionView.reloadData()
    }

}
