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
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: TikTokViewModelType = TikTokViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: StringConstants.TikTokCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: StringConstants.TikTokCollectionViewCell)
    }
    
    func fetchData() {
        do {
            try viewModel.fetchData()
        } catch (let err) {
            print(err)
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
        return cell ?? UICollectionViewCell()
    }
}

