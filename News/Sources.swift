//
//  Sources.swift
//  News
//
//  Created by Ella on 3/23/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import Foundation

class Sources {
    let name: String
    let imageName: String

    // let techSources = ["techcrunch", "the-verge", "ars-technica", "engadget", "hacker-news", "techradar"]

    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }

    let sources = [
        Sources(name: "techcrunch", imageName: "hi")
    ]
}
