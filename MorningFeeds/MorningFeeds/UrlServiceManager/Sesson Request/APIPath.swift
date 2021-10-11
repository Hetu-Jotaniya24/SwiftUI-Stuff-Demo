//
//  APIPath.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 05/10/21.
//

import Foundation


enum APIEnvironment : String {
 
    
    static var headers : [String:String]
    {
        return ["Content-Type":"application/json"]
    }
    
    case url = "https://newsapi.org/v2/top-headlines/"
    case searchUrl = "https://newsapi.org/v2/everything?"
     
    static var baseURL: String{
        return APIEnvironment.environment.rawValue
    }
    
    static var searchURL: String{
        return APIEnvironment.searchUrl.rawValue
    }
    
    static var environment: APIEnvironment{
        return .url
    }
    
}
enum ApiKey: String {
    case source    = "sources?"
}
