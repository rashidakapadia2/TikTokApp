//
//  CommentModelData.swift
//  TikTokSampleApp
//
//  Created by Cirrius on 15/12/24.
//

import Foundation

struct CommentModel: Codable {
    let comments: [Comment]?
}

struct Comment: Codable {
    let id: Int?
    let username: String?
    let picURL: String?
    let comment: String?
}
