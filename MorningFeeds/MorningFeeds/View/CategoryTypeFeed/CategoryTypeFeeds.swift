//
//  CategoryTypeFeeds.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 01/10/21.
//

import SwiftUI

struct CategoryTypeFeeds: View {
    
    @ObservedObject var list: ListItems = ListItems()
    
    var categoryType : String? = nil
    var source : String? = nil
    
    var body: some View {
        List(self.list.items){ art in
    
            NavigationLink(destination:DetailArticleView(article:art) ) {
                CategoryFeedItem(article: art)
                    .frame( height: 190)
                   
           }
        }
        .listStyle(.plain)
        .navigationBarTitle((categoryType ?? source) ?? "nil", displayMode: .inline)
        .onAppear(perform: {
            UITableView.appearance().separatorColor = .clear
            if categoryType != nil{
                self.list.fetch(category: categoryType ?? "general")
            }else if source != nil{
                self.list.fetchOnSource(source: source ?? "abc-news-au")
            }else{
                
            }
   
        })
   
    }
   
}

struct CategoryTypeFeeds_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTypeFeeds(categoryType: "Hello")
    }
}
