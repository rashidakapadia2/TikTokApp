//
//  ViewModel.swift
//  TikTokSampleApp
//
//  Created by Cirrius on 15/12/24.
//

import Foundation

protocol TikTokViewModelType {
    var videos: [Video]? { get }
    func fetchData() throws
}

class TikTokViewModel: TikTokViewModelType {
    
    var videos: [Video]?
    
    func fetchData() throws {
        let result: Result<VideoData,Error> = VideoService.shared.readJSONFile(forName: StringConstants.VideoData)
        switch result {
        case .success(let val):
            self.videos = val.videos
        case .failure(let err):
            throw err
        }
    }
}
