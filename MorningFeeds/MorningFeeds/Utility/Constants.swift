//
//  Constants.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 30/09/21.
//

import Foundation

 struct Constants {
    static let apiKey = "4f748987c39f457ea0b6e357f7420f99"
  
}
let UD = UserDefaults.standard
let exampleArticle = NewsItemModel(articleUrl: "https://www.theverge.com/2020/3/19/21187161/microsoft-directx-12-ultimate-api-release-xbox-series-x-pc-gaming",
                                    name: "Microsoft’s DirectX 12 Ultimate unifies graphics tech for PC gaming and Xbox Series X",
                                    description: "Bringing a suite of software advancements in gaming graphics onto a single platform",
                                    date: Date(),
                                    source: "The Verge",
                                    body: "Bringing a suite of software advancements in gaming graphics onto a single platform")
