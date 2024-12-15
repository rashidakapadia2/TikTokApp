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
    func readJSONFile(forName name: String) {
       do {
       
          // creating a path from the main bundle and getting data object from the path
          if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
          let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
             // Decoding the Product type from JSON data using JSONDecoder() class.
             let product = try JSONDecoder().decode(Product.self, from: jsonData)
             print("Product name: \(product.title) and its price: \(product.price)")
          }
       } catch {
          print(error)
       }
    }
}
