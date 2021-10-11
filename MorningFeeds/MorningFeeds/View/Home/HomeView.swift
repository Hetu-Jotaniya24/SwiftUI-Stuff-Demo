//
//  HomeView.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 30/09/21.
//

import SwiftUI

struct HomeView: View {
    
//    @ObservedObject var list: ListItems = ListItems()
//    public init() {
//        self.list.fetch()
//
//    }
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
   
    
    var body: some View {
        
//        NavigationView{
      
          
            
            ScrollView {
               
                GeometryReader { geometry in
                    VStack{
                        LazyVGrid(columns: gridItemLayout, spacing: 10) {
                            ForEach((NewsCategory.array), id: \.self){ category in
                                NavigationLink(destination:NavigationLazyView(CategoryTypeFeeds(categoryType: category)) ) {
                                CategoryItemRow(categoryItem: category)
                                    .frame(width:  geometry.size.width * 0.28, height: 130 )
                                }
                            }
                        }
                    }.padding(10)

                }
            }
       

//        }
//        NavigationView{
//            List(NewsCategory.array, id: \.self){ category in
//                if #available(iOS 15.0, *) {
//
//                    NavigationLink(destination:NavigationLazyView(CategoryTypeFeeds(categoryType: category)) ) {
//
//                        CategoryItemRow(categoryItem: category)
//
//                    }
//
//                    .listRowSeparator(.hidden)
//                }
//            }
//
//            .navigationTitle(Text("Morning Feeds"))
//            .listStyle(.plain)
//
//        }
        
//        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        
        
    }
}

