//
//  APIManager.swift
//  News
//
//  Created by Ella on 3/20/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import Foundation

class APIManager {

    func getArticles(for source: String, and sort: String, completion: @escaping ([Article]) -> Void) {
        let apiKey = "&apiKey=47ace008ec4b41b08056775cc83d6c92"
        let sourceString = "?source=" + source
        let sortString = "&sortBy=" + sort
        let baseURLString = "https://newsapi.org/v1/articles" + sourceString + sortString + apiKey

        guard let url = URL(string: baseURLString) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else { return }

            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }

                guard let articles = json["articles"] as? [[String: Any]] else { return }
                var newsArticles = [Article]()
                for article in articles {
                    if let newsArticle = Article.create(from: article) {
                        newsArticles.append(newsArticle)
                    }
                }

                completion(newsArticles)

            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
