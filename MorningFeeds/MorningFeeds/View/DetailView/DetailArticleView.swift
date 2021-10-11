//
//  DetailArticleView.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 01/10/21.
//

import SwiftUI
import URLImage

struct DetailArticleView: View {
    
    var article : NewsItemModel
    @State private var showingWebView = false
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
        
                if let imageURL  = article.imageUrl {
                    URLImage(imageURL, content: { image in
                        image.resizable()
                            
                            .aspectRatio( contentMode: .fit)
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
                HStack{
                    Text(article.sourceWebsite ?? "Unknown").font(.footnote).foregroundColor(.gray)
                    Spacer()
                    Text(Utils.getFormattedDateString(someDate: article.date)).font(.footnote).foregroundColor(.gray)
                    
                }
               
                Text(article.name)
                    .padding(.top)
                    .font(.title3)
                    .lineLimit(nil)
             
                Text(article.description)
                    .padding(.top)
                    .font(.caption2)
                
                Spacer()

                GeometryReader { geometry in
                    HStack(alignment: .center, spacing: 0){
                        Button(action: {
                            print("Request to open article \(self.article.articleUrl)")
                            let url: URL? = URL(string: self.article.articleUrl)!
                            guard url != nil else {
                                return
                            }
                            UIApplication.shared.open(url!)
                        }, label: {
                            Text("Read full article")
                        }).disabled(article.articleUrl.isEmpty)
                            .padding()
                            .frame(width: geometry.size.width * 0.48)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .shadow(radius: 10)
                            
                      
                        Spacer()
                        Button("Share") {
                            let url: URL? = URL(string: self.article.articleUrl)!
                            guard url != nil else {
                                return
                            }
                            actionSheet(url: url!)
                        }.disabled(article.articleUrl.isEmpty)
                        .padding()
                            .frame(width: geometry.size.width * 0.48)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .shadow(radius: 10)
                            
                    }
                }.frame(height: 50)
            }.padding()
        }
    }
    
    func actionSheet(url:URL) {
           let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
           UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
       }
}

struct DetailArticleView_Previews: PreviewProvider {
    static var previews: some View {
        DetailArticleView(article: exampleArticle)
    }
}
