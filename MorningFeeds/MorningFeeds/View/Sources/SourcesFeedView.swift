//
//  SourcesFeedView.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 04/10/21.
//

import SwiftUI

struct SourcesFeedView: View {
    
    @ObservedObject var sourceViewModel: SourceItemsModel = SourceItemsModel()
    @State private var searchText = ""
    
    var body: some View {

        if #available(iOS 15.0, *) {
            List {
                ForEach(sourceViewModel.items.filter {
                    self.searchText.isEmpty ?
                    true :
                    "\($0.name ?? "")".localizedStandardContains(self.searchText)
                }, id: \.self) { item in
                    
                    NavigationLink(destination:CategoryTypeFeeds( source : item.id ?? "abc-news" ) ) {
                        SourceItemView(source: item.name  ?? "")
                            .frame( height: 50)
                    }
                    
                    
                }
            }.searchable(text: $searchText)
            .onAppear {
                    UITableView.appearance().separatorColor = .clear
                    sourceViewModel.fetch()
                }
        } else {
            List(sourceViewModel.items, rowContent: { sourceobj in
                NavigationLink(destination:CategoryTypeFeeds( source : sourceobj.id ?? "abc-news" ) ) {
                    SourceItemView(source: sourceobj.name  ?? "")
                        .frame( height: 50)
                }
                
                
            })  .listStyle(.plain)
                .onAppear {
                        UITableView.appearance().separatorColor = .clear
                        sourceViewModel.fetch()
                    }
            
        }
    }
}

struct SourcesFeedView_Previews: PreviewProvider {
    static var previews: some View {
        SourcesFeedView()
    }
}
