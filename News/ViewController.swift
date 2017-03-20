//
//  ViewController.swift
//  News
//
//  Created by Ella on 3/20/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topStoriesLabel: UILabel!
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register all the cells
        newsTableView.register(UINib(nibName: "OneImageCell", bundle: nil), forCellReuseIdentifier: "OneImageCell")
        newsTableView.register(UINib(nibName: "TwoImageCell", bundle: nil), forCellReuseIdentifier: "TwoImageCell")
        newsTableView.register(UINib(nibName: "SidewaysCell", bundle: nil), forCellReuseIdentifier: "SidewaysCell")

        newsTableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// MARK: - Table View Data Source

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row

        if indexPath.section == 0 {
            guard let oneImageCell = tableView.dequeueReusableCell(withIdentifier: "OneImageCell", for: indexPath) as? OneImageCell else {
                return UITableViewCell()
            }
            //        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            //
            //        cell.textLabel?.text = "\(array[indexPath.row])"
            //
            return oneImageCell
        } else if indexPath.section == 1 {
            guard let twoImageCell = tableView.dequeueReusableCell(withIdentifier: "TwoImageCell", for: indexPath) as? TwoImageCell else {
                return UITableViewCell()
            }
            return twoImageCell
        } else {
            guard let sidewaysCell = tableView.dequeueReusableCell(withIdentifier: "SidewaysCell", for: indexPath) as? SidewaysCell else {
                return UITableViewCell()
            }
            return sidewaysCell
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}
