//
//  ArticleViewController.swift
//  News
//
//  Created by Ella on 3/20/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!

    var article: Article!

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.delegate = self
        if let url = URL(string: article.articleURL) {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
