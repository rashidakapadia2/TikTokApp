//
//  VideoModelData.swift
//  TikTokSampleApp
//
//  Created by Cirrius on 15/12/24.
//

import Foundation

struct VideoData: Codable {
    let videos: [Video]?
}

struct Video: Codable {
    let id, userID: Int?
    let username: String?
    let profilePicURL: String?
    let description, topic: String?
    let viewers, likes: Int?
    let video: String?
    let thumbnail: String?
}
