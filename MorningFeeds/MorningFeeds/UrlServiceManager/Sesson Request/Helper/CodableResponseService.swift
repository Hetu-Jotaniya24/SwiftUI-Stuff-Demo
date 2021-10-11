//
//  CodableResponseService.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 06/10/21.
//

import Foundation

class CodableService {
    
    // Description: As per my requirement have initiated dataTask with "URL", It may not work with post request with parameter as we have to make it dataTask with "Request"
    class func getResponseFromSession<C:Codable>(url: URL, codableObj: C.Type, completion: @escaping  (_ status: Bool,_ modelObj: C?,_ dataDic: Any) -> ()){
        var responseDic : Any?
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let ERR = error{
                        completion(false, nil, ERR.localizedDescription)
                  
                }else{
                    if let httpResponse = response as? HTTPURLResponse{
                        print("Status code of the request:=>",httpResponse.statusCode)
                        var statusCode : Bool = false
                        if httpResponse.statusCode == 200{
                            if  let responseData = data {
                                responseDic = getResponseDicFromData(responseData:  responseData)
                                if let mainDic = responseDic as? [String: Any], let APIStatus = (mainDic[UrlConstant.Status] as? String) == "ok" ? true : false {
                                    statusCode = APIStatus
                                }
                                if let obj = getCodableObjectFromData(jsonData: responseData, codableObj: codableObj){
                                    completion(statusCode, obj, responseDic ?? "")
                                }else{
                                    completion(statusCode, nil, responseDic  ?? SessionErrors.failedToConvertJson.dictionary)
                                }
                            }else{
                                completion(statusCode, nil, SessionErrors.dataNotReceived.dictionary)
                            }
                        }else if httpResponse.statusCode == 403{
                            //Do Force Logout
                            completion(statusCode, nil, SessionErrors.serverAuthorization.dictionary)
                        }else{
                            completion(statusCode, nil, SessionErrors.somethingWentWrong.dictionary)
                        }
                    }
                }
            }
        }.resume()
    }
    
    class func getCodableObjectFromData<C:Codable>(jsonData: Data, codableObj: C.Type) -> C?{
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        let feedResponse = try? jsonDecoder.decode(codableObj, from: jsonData)
        if (feedResponse != nil) {
            return feedResponse
        } else {
            print("JSON deserialization failed :(")
            return nil
          
        }
//         let obj = try? JSONDecoder().decode(codableObj, from: jsonData)
//        return obj
    }
    
    //MARK: Just for printing Response
    class func getResponseDicFromData(responseData: Data) -> Any{
        let json = try? JSONSerialization.jsonObject(with: responseData)
           
           if let jsonObj = json{
               print(" Response is ->  \n \(String(describing: json))")
               return jsonObj
           }else{
               return SessionErrors.serializationError.dictionary
           }
    }
}
