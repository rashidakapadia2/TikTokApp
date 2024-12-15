//
//  ViewModel.swift
//  TikTokSampleApp
//
//  Created by Cirrius on 15/12/24.
//

import Foundation

protocol TikTokViewModelType {
    var videos: [Video]? { get }
    var comments: [Comment]? { get }
    func fetchVideos() throws
    func fetchComments() throws
}

class TikTokViewModel: TikTokViewModelType {
    
    var videos: [Video]?
    var comments: [Comment]?
    
    func fetchVideos() throws {
        let result: Result<VideoData, Error> = VideoService.shared.readJSONFile(forName: StringConstants.VideoData)
        switch result {
        case .success(let val):
            self.videos = val.videos
        case .failure(let err):
            throw err
        }
    }
    
    func fetchComments() throws {
        let result: Result<CommentModel, Error> = VideoService.shared.readJSONFile(forName: StringConstants.CommentData)
        switch result {
        case .success(let val):
            self.comments = val.comments
        case .failure(let err):
            throw err
        }
    }
}
