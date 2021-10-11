//
//  FetchManager.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 30/09/21.
//

import Foundation

class NewsApi {
    
    static let DEFAULT_PAGE_SIZE = 100
   
    static func fetchSources(completion: @escaping (SourceDataModelRootClass?) -> Void){
       
        var urlComponents = URLComponents(string: APIEnvironment.baseURL + ApiKey.source.rawValue)!
        print("Identified Locale: " + (Locale.current.regionCode ?? "Unknown"))
        urlComponents.queryItems = [
            URLQueryItem(name: "apikey", value: Constants.apiKey)
        ]
        print("URL***********",urlComponents.url!)
        URLSessionRequestManager.makeGetRequest(urlString: urlComponents.url!, responseModel: SourceDataModelRootClass.self) { status, modelObj, dataDic in
            completion(modelObj)
        }
    }
    
    
    static func fetchFeeds(category: String? = nil, source: String? = nil,completion: @escaping (FeedModel?) -> Void) {
        var urlComponents = URLComponents()
        urlComponents = URLComponents(string: APIEnvironment.baseURL)!
        if category != nil{
          
            print("Identified Locale: " + (Locale.current.regionCode ?? "Unknown"))
          
            let countryobj = try? UserDefaults.standard.getObject(objectType: DefaultCountry.self, forKey: UserDefaultKeys.countryName.rawValue)
         
            urlComponents.queryItems = [
                URLQueryItem(name: "country", value:   countryobj?.countryCode),
                URLQueryItem(name: "category", value: category),
                URLQueryItem(name: "pageSize", value: "\(DEFAULT_PAGE_SIZE)"),
                URLQueryItem(name: "apikey", value: Constants.apiKey)
            ]
           
        }else if source != nil{
           
           print("Identified Locale: " + (Locale.current.regionCode ?? "Unknown"))
           urlComponents.queryItems = [
               URLQueryItem(name: "sources", value: source),
               URLQueryItem(name: "apikey", value: Constants.apiKey)
           ]
        }
        
       
        print("URL***********",urlComponents.url!)
        URLSessionRequestManager.makeGetRequest(urlString: urlComponents.url!, responseModel: FeedModel.self) { status, modelObj, dataDic in
            completion(modelObj)
        }
    }
    
   static func fetchSearchResult(searchText : String,completion: @escaping (FeedModel?) -> Void){
        var urlComponents = URLComponents(string: APIEnvironment.searchURL)!
        print("Identified Locale: " + (Locale.current.regionCode ?? "Unknown"))
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: searchText),
            URLQueryItem(name: "apikey", value: Constants.apiKey)
        ]
        print("URL***********",urlComponents.url!)
        URLSessionRequestManager.makeGetRequest(urlString: urlComponents.url!, responseModel: FeedModel.self) { status, modelObj, dataDic in
            completion(modelObj)
        }
    }
    
}
