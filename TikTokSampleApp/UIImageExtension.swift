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
        
        var image = UIImage()
        let session = URLSession(configuration: .default)

        let downloadPicTask = session.dataTask(with: url) { (data, response, error) in
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                        // Finally convert that Data into an image and do what you wish with it.
                        image = UIImage(data: imageData) ?? UIImage()
                        // Do something with your image.
                        completion(image)
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
    }
}
