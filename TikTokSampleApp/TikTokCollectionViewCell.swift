//
//  TikTokCollectionViewCell.swift
//  TikTokSampleApp
//
//  Created by Cirrius on 15/12/24.
//

import UIKit
import AVFoundation

class TikTokCollectionViewCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var viewersLbl: UILabel!
    @IBOutlet weak var countLbl: UILabel!
    @IBOutlet weak var rightStack: UIStackView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var personStack: UIStackView!
    @IBOutlet weak var horizontalStack: UIStackView!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        
    }
    
    func configData() {
        
    }

}
