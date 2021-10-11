//
//  TabbarView.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 04/10/21.
//

import SwiftUI

struct TabbarView: View {
    
    var body: some View {
        //        NavigationView{
        TabView {
            NavigationView{
            
                HomeView()
                    .navigationBarTitle("Morning Feeds!")
            }
          
            .tabItem {
                Image(systemName: "square.stack")
                Text("Category")
            }
            .tag(1)
            NavigationView{
                SourcesFeedView()
                    .navigationBarTitle("Sources")
            }
           
            .tabItem {
                Image(systemName: "newspaper")
                Text("Sources")
            }
            .tag(2)
            NavigationView{
                SearchView()
                    .navigationBarTitle("Search")
            }
           
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            .tag(3)
            NavigationView{
                SettingsView()
                    .navigationBarTitle("Settings")
            }
           
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
            .tag(4)
        } //.navigationTitle(Text("Morning Feeds"))
        .navigationViewStyle(StackNavigationViewStyle())
        .edgesIgnoringSafeArea(.top)
    }
    
    
    //    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
