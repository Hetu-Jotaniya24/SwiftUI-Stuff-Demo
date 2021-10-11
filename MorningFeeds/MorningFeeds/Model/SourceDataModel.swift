//
//  SourceDataModel.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 05/10/21.
//

import Foundation
// MARK: - SourceModel
struct SourceDataModelRootClass : Codable {

        let sources : [allSources]?
        let status : String?

        enum CodingKeys: String, CodingKey {
                case sources = "sources"
                case status = "status"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                sources = try values.decodeIfPresent([allSources].self, forKey: .sources)
                status = try values.decodeIfPresent(String.self, forKey: .status)
        }

}

// MARK: - Source
struct allSources : Codable, Identifiable ,Hashable{

        let category : String?
        let country : String?
        let descriptionField : String?
        let id : String?
        let language : String?
        let name : String?
        let url : String?

        enum CodingKeys: String, CodingKey {
                case category = "category"
                case country = "country"
                case descriptionField = "description"
                case id = "id"
                case language = "language"
                case name = "name"
                case url = "url"
        }
 
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                category = try values.decodeIfPresent(String.self, forKey: .category)
                country = try values.decodeIfPresent(String.self, forKey: .country)
                descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
                id = try values.decodeIfPresent(String.self, forKey: .id)
                language = try values.decodeIfPresent(String.self, forKey: .language)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                url = try values.decodeIfPresent(String.self, forKey: .url)
        }

}
