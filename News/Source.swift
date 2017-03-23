//
//  Source.swift
//  News
//
//  Created by Ella on 3/23/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import Foundation

class Source {
    let category: String
    let sources: [String]

    init(category: String, sources: [String]) {
        self.category = category
        self.sources = sources
    }

    static let categoryArray = [
        Source(category: "GENERAL", sources: ["associated-press", "metro", "newsweek", "new-york-magazine", "reuters", "time", "usa-today"]),
        Source(category: "TECHNOLOGY", sources: ["the-verge", "techcrunch", "ars-technica", "engadget", "hacker-news", "techradar"]),
        Source(category: "BUSINESS", sources: ["business-insider", "financial-times", "fortune", "the-economist"]),
        Source(category: "ENTERTAINMENT", sources: ["buzzfeed", "daily-mail", "mashable", "mtv-news"]),
        Source(category: "SPORT", sources: ["the-sport-bible", "talksport", "sky-sports-news", "nfl-news", "fox-sports"])
    ]
}
