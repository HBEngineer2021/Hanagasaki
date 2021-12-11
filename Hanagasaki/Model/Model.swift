//
//  DbModel.swift
//  Hanagasaki
//
//  Created by Motoki Onayama on 2021/07/31.
//

import Foundation

struct modelArticle {
    var id: String?
    var articleTitle: String?
    var url: String?
}

struct modelVideo {
    var id: String?
    var videoTitle: String?
    var image: String?
    var url: String?
}

struct Qiita: Codable {
    let title: String
    let created_at: String
    let user: User
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case created_at = "created_at"
        case user = "user"
        case url = "url"
    }
}

struct User: Codable {
    let name: String
    let profileImageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case profileImageUrl = "profile_image_url"
    }
}

struct Menu {
    var list: String
    var url: String
}
