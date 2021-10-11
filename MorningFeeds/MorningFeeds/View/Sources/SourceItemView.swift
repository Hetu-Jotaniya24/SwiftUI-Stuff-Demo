//
//  SourceItemView.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 05/10/21.
//

import SwiftUI

struct SourceItemView: View {
    var source : String
    
    var body: some View {
        ZStack (alignment: .center){
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.white)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            VStack{
                Text(source)
                    .fontWeight(.medium)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
           
        } 
    }
}

struct SourceItemView_Previews: PreviewProvider {
    static var previews: some View {
        SourceItemView(source: "ABC News")
    }
}
