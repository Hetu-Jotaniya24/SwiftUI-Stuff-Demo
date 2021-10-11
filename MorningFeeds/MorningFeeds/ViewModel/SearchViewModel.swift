//
//  SearchViewModel.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 07/10/21.
//

import Foundation
import Combine
import SwiftUI

class SearchViewModel : ObservableObject {
    
       @Published var arraySearch: [NewsItemModel]

       var searchTerm: String = ""


    init() {
        self.arraySearch = []
    }

//    func onClearTap(){
//        self.arraySearch = []
//    }
//
       func onSearchTapped() {
         fetch(search: searchTerm)
       }

    public func fetch(search :String) {
        NewsApi.fetchSearchResult(searchText: search) {
            if ($0 != nil && $0?.status == "ok") {
                if $0?.articles.count ?? 0 > 0{
                    self.arraySearch = []
                    $0?.articles.forEach {
                        article in
                        DispatchQueue.main.async {
                            self.arraySearch.append(NewsItemModel(articleUrl: article.url ?? "", name: article.title ?? "", imageUrl: article.urlToImage, description: article.description, date: article.publishedAt, source: article.source?.name, body: article.content))
                        }
                    }
                }else{
                    self.arraySearch = []
                }

            } else {
                print("API Request failed")
            }
        }
    }
}


