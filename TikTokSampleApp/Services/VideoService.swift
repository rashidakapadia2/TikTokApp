//
//  VideoService.swift
//  TikTokSampleApp
//
//  Created by Cirrius on 15/12/24.
//

import Foundation

class VideoService {
    
    // MARK: Singleton Class
    private init() { }
    static let shared: VideoService = VideoService()
    
    // MARK: JSON Decoder
    func readJSONFile<T: Decodable>(forName name: String) -> Result<T,Error> {
       do {
          // creating a path from the main bundle and getting data object from the path
          if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
          let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
             // Decoding the Product type from JSON data using JSONDecoder() class.
              let product = try JSONDecoder().decode(T.self, from: jsonData)
              return .success(product)
          }
           return .failure(CommonError.dataNotFound)
       } catch (let err) {
           return .failure(err)
       }
    }
}
