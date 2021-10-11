//
//  CategoryItemRow.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 30/09/21.
//

import SwiftUI

struct CategoryItemRow: View {
    let categoryItem : String
   
  
    var body: some View {
        
        ZStack (alignment: .center){
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.white)
               
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            VStack{
                
                Image( categoryItem)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                
                Text(categoryItem)
                    .fontWeight(.medium)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            .padding(20)
        }

    }
}

struct CategoryItemRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemRow(categoryItem: "Hello")
    }
}
