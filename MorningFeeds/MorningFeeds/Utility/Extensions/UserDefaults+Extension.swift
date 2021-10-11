//
//  UserDefaults+Extension.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 11/10/21.
//

import Foundation
extension UserDefaults{
    
    func setObject<T: Codable>(object: T, forKey: String) throws {
        
        let jsonData = try JSONEncoder().encode(object)
        set(jsonData, forKey: forKey)
    }
    
    
    func getObject<T: Codable>(objectType: T.Type, forKey: String) throws -> T? {
        
        guard let result = value(forKey: forKey) as? Data else {
            return nil
        }
        
        return try JSONDecoder().decode(objectType, from: result)
    }
}


class DefaultCountry : Codable ,ObservableObject{
    var countryName : String = ""
    var countryCode : String = ""
    
    init(countryName : String,countryCode : String){
        self.countryCode = countryCode
        self.countryName = countryName
    }
}
