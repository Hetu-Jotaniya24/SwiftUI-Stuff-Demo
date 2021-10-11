//
//  URLSessionRequestManager.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 06/10/21.
//

import Foundation

typealias CompletionResponse<R:Codable> = (Bool,Codable?,Any) -> ()
class URLSessionRequestManager {
    
    static func BEARER_HEADER() -> [String:String]{
        return  APIEnvironment.headers
    }
    
    class func makeGetRequest<C:Codable>(urlString: URL?, responseModel: C.Type, completion: @escaping (_ status: Bool,_ modelObj: C?,_ dataDic: Any) -> ()) {
        
        if !Reachability.isConnectedToNetwork() {
            completion(false, nil, SessionErrors.noInternetConnection.dictionary)
            return
        }
     
        guard let url = urlString else {
            completion(false, nil, SessionErrors.urlIsMissing.dictionary)
            return
        }
        
//        var request = URLRequest(url: url)
//        request.httpMethod = GetRequestType.GET.rawValue
//        request.allHTTPHeaderFields = BEARER_HEADER()
        
        print("the url is \(url) and the headers are \(BEARER_HEADER())")
        
        CodableService.getResponseFromSession(url: url, codableObj: responseModel) { (status, obj, dic) in
            DispatchQueue.main.async {
                completion(status,obj,dic)
            }
        }
    }
}
