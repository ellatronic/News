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
    var collectionArticles = [Article]()
    var sources = Source.categoryArray
    var currentCategory = 0
    var topOrLatest = "top"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register all the cells
        newsTableView.register(UINib(nibName: "OneImageCell", bundle: nil), forCellReuseIdentifier: "OneImageCell")
        newsTableView.register(UINib(nibName: "SidewaysCell", bundle: nil), forCellReuseIdentifier: "SidewaysCell")

        // Configure table view cell row height
        newsTableView.rowHeight = UITableViewAutomaticDimension

        loadNewsArticles(for: sources, sortedBy: "top")
        loadCollectionArticles(for: sources, sortedBy: "top")
    }

    // MARK: - IBActions
    @IBAction func pressedTopButton(_ sender: UIButton) {
        loadNewsArticles(for: sources, sortedBy: "top")
        loadCollectionArticles(for: sources, sortedBy: "top")
        topOrLatest = "top"
    }
    @IBAction func pressedLatestButton(_ sender: UIButton) {
        loadNewsArticles(for: sources, sortedBy: "latest")
        loadCollectionArticles(for: sources, sortedBy: "latest")
        topOrLatest = "latest"
    }

    // MARK: - Helper Functions
    func go(toArticle article: Article) {
        self.performSegue(withIdentifier: "toArticle", sender: article)
    }

    func loadNewsArticles(for category: [Source], sortedBy: String) {
        let sources = category[currentCategory].sources
        apiManager.getArticles(for: sources[1], and: sortedBy, completion: { newsArticles in
            self.newsArticles = newsArticles
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }
        })
    }

    func loadCollectionArticles(for category: [Source], sortedBy: String) {
        let sources = category[currentCategory].sources
        apiManager.getArticles(for: sources[0], and: sortedBy, completion: { newsArticles in
            self.collectionArticles = newsArticles
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }
        })
    }
}

// MARK: - Table View Data Source

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return newsArticles.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let categoryCell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell else { return UITableViewCell() }
            categoryCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            return categoryCell
        } else {
            let row = indexPath.row
            let article = newsArticles[row]

            if row == 0 {
                guard let oneImageCell = tableView.dequeueReusableCell(withIdentifier: "OneImageCell", for: indexPath) as? OneImageCell else {
                    return UITableViewCell()
                }
                oneImageCell.titleLabel.text = article.title
                oneImageCell.authorLabel.text = article.author
                oneImageCell.articleImageView.image = article.convertStringToURLToImage(from: article.imageURL)

                return oneImageCell
            } else if row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellForCollectionView", for: indexPath)
                return cell
            } else {
                guard let sidewaysCell = tableView.dequeueReusableCell(withIdentifier: "SidewaysCell", for: indexPath) as? SidewaysCell else {
                    return UITableViewCell()
                }
                sidewaysCell.topTitleLabel.text = "\(newsArticles[row].title)"
                sidewaysCell.authorLabel.text = "\(newsArticles[row].author)"
                sidewaysCell.topArticleImage.image = newsArticles[row].convertStringToURLToImage(from: newsArticles[row].imageURL)
                return sidewaysCell
            }
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? CellForCollectionViewTableViewCell else { return }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        go(toArticle: newsArticles[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let articleViewController = segue.destination as? ArticleViewController else { return }
        if let theArticle = sender as? Article {
            articleViewController.article = theArticle
        }
    }
}

// MARK: - Collection View
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView is MyCustonCollectionView {
            return collectionArticles.count
        } else {
            return sources.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView is MyCustonCollectionView {
            let row = collectionArticles[indexPath.row]

            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
            cell.articleImageView.image = row.convertStringToURLToImage(from: row.imageURL)
            cell.collectionLabel.text = row.title
            return cell
        }
        else {
            guard let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            categoryCell.categoryLabel.text = sources[indexPath.row].category
            return categoryCell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView is MyCustonCollectionView {
            go(toArticle: collectionArticles[indexPath.row])
            collectionView.deselectItem(at: indexPath, animated: true)
        } else {
            currentCategory = indexPath.row
            loadNewsArticles(for: sources, sortedBy: topOrLatest)
            loadCollectionArticles(for: sources, sortedBy: topOrLatest)
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
}

class MyCustonCollectionView: UICollectionView {}
