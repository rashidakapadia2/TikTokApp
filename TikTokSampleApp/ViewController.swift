//
//  ViewController.swift
//  TikTokSampleApp
//
//  Created by Cirrius on 15/12/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var customCommentView: CustomCommentView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: TikTokViewModelType = TikTokViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
        fetchComments()
        addKeyboardObserver()
        hideKeyboardWhenTappedAround()
        addTapGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func addTapGesture() {
        let tapToOpen = UITapGestureRecognizer(target: self, action: #selector(showHeart))
        tapToOpen.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(tapToOpen)
    }
    
    @objc func showHeart() {
        
    }

    func setupUI() {
        customCommentView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: StringConstants.TikTokCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: StringConstants.TikTokCollectionViewCell)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: StringConstants.CommentsTableViewCell, bundle: nil), forCellReuseIdentifier: StringConstants.CommentsTableViewCell)
    }
    
    func fetchData() {
        do {
            try viewModel.fetchVideos()
            collectionView.reloadData()
        } catch (let err) {
            showToast(message: err.localizedDescription)
        }
    }
    func fetchComments() {
        do {
            try viewModel.fetchComments()
            tableView.reloadData()
        } catch (let err) {
            showToast(message: err.localizedDescription)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.videos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StringConstants.TikTokCollectionViewCell, for: indexPath) as? TikTokCollectionViewCell
        cell?.setupUI()
        cell?.configData(data: viewModel.videos?[indexPath.item])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? TikTokCollectionViewCell else { return }
        if cell.isPlaying {
            cell.stopPlayback()
        } else {
            cell.startPlayback()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? TikTokCollectionViewCell else { return }
        cell.stopPlayback()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.CommentsTableViewCell, for: indexPath) as? CommentsTableViewCell
        cell?.setupUI()
        cell?.configData(comment: viewModel.comments?[indexPath.item])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

extension ViewController: CustomCommentViewDelegate {
    func endEditing() {
        
    }
    
    func beginEditing() {
        
    }
}
