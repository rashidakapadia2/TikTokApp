//
//  CommentsTableViewCell.swift
//  TikTokSampleApp
//
//  Created by Cirrius on 15/12/24.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    // MARK: IBoutlets
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var innerStackView: UIStackView!
    @IBOutlet weak var userImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupUI() {
        userImg.layer.cornerRadius = userImg.frame.height/2
        userImg.clipsToBounds = true
    }
    
    func configData(comment: Comment?) {
        userNameLbl.text = comment?.username
        commentLbl.text = comment?.comment
        UIImage.loadURL(fileName: comment?.picURL, completion: { [weak self] img in
            DispatchQueue.main.async {
                self?.userImg.image = img
            }
        })
    }
}
