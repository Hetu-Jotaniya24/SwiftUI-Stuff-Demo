//
//  NewsItemModel.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 01/10/21.
//

import Foundation


import Foundation



class ListItems: ObservableObject {
    
    @Published var items: [NewsItemModel]
    
    public init() {
        self.items = []

    }
    
    public func fetchOnSource(source : String){
        NewsApi.fetchFeeds(source: source) {
            if ($0 != nil && $0?.status == "ok") {
                $0?.articles.forEach {
                    article in
                    DispatchQueue.main.async {
                        self.items.append(NewsItemModel(articleUrl: article.url ?? "", name: article.title!, imageUrl: article.urlToImage, description: article.description, date: article.publishedAt, source: article.source?.name, body: article.content))

                    }
                }
            } else {
                print("API Request failed")
            }
        }
    }
    
    public func fetch(category :String) {
     
        NewsApi.fetchFeeds(category: category) {
            if ($0 != nil && $0?.status == "ok") {
                $0?.articles.forEach {
                    article in
                    DispatchQueue.main.async {
                        self.items.append(NewsItemModel(articleUrl: article.url ?? "", name: article.title!, imageUrl: article.urlToImage, description: article.description, date: article.publishedAt, source: article.source?.name, body: article.content))

                    }
                }
            } else {
                print("API Request failed")
            }
        }
    }
}


