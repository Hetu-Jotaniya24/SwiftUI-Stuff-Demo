//
//  Enums.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 30/09/21.
//

import Foundation

enum GetRequestType: String{
    case GET
    case POST
}

enum NewsCategory : String, Hashable, CaseIterable,Codable {
   
    case business = "Business"
    case entertainment = "Entertainment"
    case general = "General"
    case health = "Health"
    case science = "Science"
    case sports = "Sports"
    case technology = "Technology"
    
    static var array : [String] = Self.allCases.map { $0.rawValue }
  
}

enum NewsCountry : String, Hashable, CaseIterable {
    
    case Argentina = "Argentina"
    case Austria = "Austria"
    case Brazil = "Brazil"
    case Canada = "Canada"
    case China = "China"
    case USA = "USA"
    case Germany = "Germany"
    case India = "India"
    
    var countryCode: String {
           switch self {
           case .Argentina:
               return "ar"
           case .Austria:
               return "at"
           case .Brazil:
               return "br"
           case .Canada:
               return "ca"
           case .China:
               return "cn"
           case .USA:
               return "us"
           case .Germany:
               return "de"
           case .India:
               return "in"
           }
       }
    static var arrayStr : [String] = Self.allCases.map{ $0.rawValue}
}



enum UserDefaultKeys: String, CaseIterable {
    case countryName
}

