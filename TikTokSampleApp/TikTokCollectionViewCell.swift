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
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var viewersLbl: UILabel!
    @IBOutlet weak var countLbl: UILabel!
    @IBOutlet weak var rightStack: UIStackView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var personStack: UIStackView!
    @IBOutlet weak var horizontalStack: UIStackView!
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var viewerLbl: UILabel!
    @IBOutlet weak var topicLbl: UILabel!
    // MARK: Variables
    private var playerLayer: AVPlayerLayer!
    private var player: AVPlayer?
    private var playerLooper: AVPlayerLooper?
    private var playerQueue: AVQueuePlayer?
    var isPlaying: Bool {
        return player?.rate == 0 ? false : true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupVideoPlayer()
    }
    
    private func setupVideoPlayer() {
        playerQueue = AVQueuePlayer()
        playerLayer = AVPlayerLayer(player: playerQueue)
        playerLayer.videoGravity = .resizeAspectFill
        videoView.layer.addSublayer(playerLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = contentView.bounds
    }
    
    func configure(with url: URL) {
        let asset = AVAsset(url: url)
        let item = AVPlayerItem(asset: asset)
        
        // Create a new looper for this video
        playerLooper = AVPlayerLooper(player: playerQueue!, templateItem: item)
        
        // Set the player and prepare for playback
        player = playerQueue
        startPlayback()
    }
    
    func startPlayback() {
        player?.play()
    }
    
    func stopPlayback() {
        player?.pause()
//        player?.seek(to: .zero)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        stopPlayback()
        
        // Clean up looper and player
        playerLooper = nil
        playerQueue?.removeAllItems()
    }
    
    func setupUI() {
        imgView.layer.cornerRadius = imgView.frame.width/2
        imgView.clipsToBounds = true
    }
    
    func configData(data: Video?) {
        guard let videoURL = data?.video, let url = URL(string: videoURL) else { return }
        configure(with: url)
        nameLbl.text = data?.username
        countLbl.text = "Likes:\(data?.likes ?? 0)"
        viewersLbl.text = "Viewers: \(data?.viewers ?? 0)"
        topicLbl.text = data?.topic
        viewerLbl.text = "\(data?.viewers ?? 0)"
        UIImage.loadURL(fileName: data?.profilePicURL, completion: { img in
            self.imgView.image = img
        })
    }
}
