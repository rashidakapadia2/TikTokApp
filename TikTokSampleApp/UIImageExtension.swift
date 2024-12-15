//
//  UIImageExtension.swift
//  TikTokSampleApp
//
//  Created by Cirrius on 15/12/24.
//

import Foundation
import UIKit

extension UIImage {
    static func loadURL(fileName: String?, completion: @escaping (UIImage) -> ()) {
        guard let fileName, let url = URL(string: fileName) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                        let image = UIImage(data: imageData) ?? UIImage()
                        completion(image)
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }.resume()
    }
}
