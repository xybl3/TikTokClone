//
//  FeedViewController.swift
//  TikTok
//
//  Created by Olivier Marszałkowski on 31/05/2024.
//

import UIKit

class FeedViewController: UIViewController {
    
    var feedCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureFeedCollectionView()
        // Do any additional setup after loading the view.
    }
    
    
    func configureFeedCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        
        feedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        feedCollectionView.showsVerticalScrollIndicator = false
        feedCollectionView.backgroundColor = .black
        feedCollectionView.isPagingEnabled = true
        
        feedCollectionView.contentInsetAdjustmentBehavior = .never // Prevent automatic adjustment of content insets
        feedCollectionView.contentInset = .zero
        
        feedCollectionView.dataSource = self
        feedCollectionView.delegate = self
        feedCollectionView.register(FeedVideoCellCollectionViewCell.self, forCellWithReuseIdentifier: "VideoCell")

        
        view.addSubview(feedCollectionView)
        feedCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            feedCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            feedCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            feedCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
}

extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath) as! FeedVideoCellCollectionViewCell
//        let videoURL = videoURLs[indexPath.item]
        cell.configure(with: URL(string: "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4")!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}
