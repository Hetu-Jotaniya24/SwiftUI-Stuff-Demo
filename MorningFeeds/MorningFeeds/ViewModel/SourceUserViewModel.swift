//
//  SourceUserViewModel.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 05/10/21.
//

import Foundation

class SourceItemsModel : ObservableObject {
    @Published var items: [allSources]
 
    public init() {
        self.items = []

    }
    
    public func fetch() {
        NewsApi.fetchSources { sources in
            if (sources != nil && sources?.status == "ok") {
                    DispatchQueue.main.async {
                        if let obj = sources?.sources{
                            self.items = obj
                            print("Name of Sources:-> \n",self.items.map{ $0.name})
                        }
                    }
            } else {
                print("API Request failed")
            }
        }
       
    }
}


