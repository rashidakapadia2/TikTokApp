//
//  UIViewExtension.swift
//  TikTokSampleApp
//
//  Created by Cirrius on 15/12/24.
//

import Foundation
import UIKit

extension UIView {
    // MARK: Use this function to load an XIB file with a class.
    @MainActor func loadNib() {
        let name = String(describing: Self.self)
        _ = UINib(nibName: name, bundle: .main).instantiate(withOwner: self)
    }
    
    // MARK: Use this function to attach any `contentView` with a view whose XIB is loaded.
    @MainActor func combine(with view: UIView) {
        view.addSubview(self)
        self.frame = view.bounds
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.clipsToBounds = true
        view.backgroundColor = .clear
    }
}
