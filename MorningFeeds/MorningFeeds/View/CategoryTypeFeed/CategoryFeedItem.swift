//
//  CategoryFeedItem.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 01/10/21.
//

import SwiftUI
import URLImage


struct CategoryFeedItem : View {
    
    var article : NewsItemModel
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            if let imageURL  = article.imageUrl {
                URLImage(imageURL, content: { image in
                    image.resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1.8, contentMode: .fit)
                        .cornerRadius(20)
                        .clipped()
                })
            }else{
                Image("placeholder")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .aspectRatio(1.8, contentMode: .fit)
                    .cornerRadius(10)
                    .clipped()
            }
            
            Text(article.name)
                .multilineTextAlignment(.center)
                .frame(width: 250, height: 40, alignment: .leading)
                .padding(6)
                .font(.caption)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
                .lineLimit(2)
        }
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
    }
}

struct CategoryFeedItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFeedItem(article:exampleArticle)
    }
}

//            URLImage(article.imageUrl) {
//                // This view is displayed before download starts
//                EmptyView()
//            } inProgress: { progress in
//                // Display progress
//                Text("Loading...")
//            } failure: { error, retry in
//                // Display error and retry button
//                VStack {
//                    Text(error.localizedDescription)
//                    Button("Retry", action: retry)
//                }
//            } content: { image in
//                // Downloaded image
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//            }
