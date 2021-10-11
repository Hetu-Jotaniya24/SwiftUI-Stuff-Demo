//
//  FeedModel.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 30/09/21.
//

import Foundation


// MARK: - TopHeadlinesResponse
struct FeedModel: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?, name: String?
}

struct NewsItemModel: Identifiable , Codable {
    var id: UUID
    var name: String
    var description: String
    var isFavorite: Bool
    var imageUrl: URL?
    var date: Date?
    var sourceWebsite: String?
    var body: String?
    var articleUrl: String
    
    var debugDescription: String {
        return "Name: \(self.name) | Favorite?: \(self.isFavorite)"
    }
    
    public init(articleUrl: String, name: String, imageUrl: String? = nil, description: String? = nil, date: Date? = nil, source: String? = nil, body: String? = nil) {
        self.articleUrl = articleUrl
        self.name = name
        id = UUID()
        self.description = description ?? "No description provided"
        self.isFavorite = false
        self.imageUrl = imageUrl != nil ? URL(string: imageUrl!) : nil
        self.date = date
        self.sourceWebsite = source
        self.body = body
    }
}
