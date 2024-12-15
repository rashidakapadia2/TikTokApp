//
//  CustomCommentView.swift
//  TikTokSampleApp
//
//  Created by Cirrius on 15/12/24.
//

import Foundation
import UIKit

@MainActor protocol CustomCommentViewDelegate {
    func beginEditing()
    func endEditing()
    func showGiftBox()
}

extension CustomCommentViewDelegate {
    func beginEditing() { }
    func endEditing() { }
}

@MainActor class CustomCommentView: UIView {
    
    @IBOutlet weak var videoBtn: UIButton!
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var forwardBtn: UIButton!
    @IBOutlet weak var giftButton: UIButton!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var bgView: UIView!
    
    var delegate: (any CustomCommentViewDelegate)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    func setupView() {
        loadNib()
        contentView.combine(with: self)
    }
    
    func configView() {
        txtField.attributedPlaceholder = NSAttributedString(
        string: "Comment",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        txtField.delegate = self
    }
    @IBAction func giftBtnTapped(_ sender: Any) {
        delegate?.showGiftBox()
    }
}

extension CustomCommentView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.beginEditing()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.endEditing()
    }
}
