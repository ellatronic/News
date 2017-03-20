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

    var newsArticles = [Article]()
    let apiManager = APIManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register all the cells
        newsTableView.register(UINib(nibName: "OneImageCell", bundle: nil), forCellReuseIdentifier: "OneImageCell")
        newsTableView.register(UINib(nibName: "TwoImageCell", bundle: nil), forCellReuseIdentifier: "TwoImageCell")
        newsTableView.register(UINib(nibName: "SidewaysCell", bundle: nil), forCellReuseIdentifier: "SidewaysCell")

        // Configure table view cell row height
        newsTableView.rowHeight = UITableViewAutomaticDimension

        apiManager.getArticles(for: "techcrunch", and: "top", completion: { newsArticles in
            self.newsArticles = newsArticles
            loadImage(atURL: newsArticles.first?.imageURL)
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }

//            let url = URL(string: (giphys.first?.imageURL)!)
//
//            DispatchQueue.global().async {
//                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
//                DispatchQueue.main.async {
//                    self.giphyImageView.image = UIImage(data: data!)
//                }

        })
    }

    func loadImage(atURL url: URL) -> UIImage? {

        if let data = try? Data(contentsOf: url) {
            return UIImage(data: data)
        }

        return nil
    }
}

// MARK: - Table View Data Source

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArticles.count
        //        return 1
        //        if section == 0 {
        //            return 1
        //        } else {
        //            return 2
        //        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row

        guard let oneImageCell = tableView.dequeueReusableCell(withIdentifier: "OneImageCell", for: indexPath) as? OneImageCell else {
            return UITableViewCell()
        }
        oneImageCell.titleLabel.text = "\(newsArticles[row].title)"
//        oneImageCell.imageView?.image = UIImage(named: <#T##String#>)

        //        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //
        //        cell.textLabel?.text = "\(array[indexPath.row])"
        //
        return oneImageCell

        //        if indexPath.section == 1 {
        //            guard let twoImageCell = tableView.dequeueReusableCell(withIdentifier: "TwoImageCell", for: indexPath) as? TwoImageCell else {
        //                return UITableViewCell()
        //            }
        //            return twoImageCell
        //        } else {
        //            guard let sidewaysCell = tableView.dequeueReusableCell(withIdentifier: "SidewaysCell", for: indexPath) as? SidewaysCell else {
        //                return UITableViewCell()
        //            }
        //            return sidewaysCell
        //        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
