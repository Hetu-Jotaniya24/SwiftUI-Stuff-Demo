//
//  SearchView.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 07/10/21.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    var body: some View {
    
            VStack {
                SearchBar(text: $viewModel.searchTerm,
                          onSearchButtonClicked: viewModel.onSearchTapped)
                List(viewModel.arraySearch, id: \.id) { game in
                    NavigationLink(destination:DetailArticleView(article:game) ) {
                        CategoryFeedItem(article: game)
                            .frame( height: 190)
                           
                   }
                }.resignKeyboardOnDragGesture()
            }
        }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
