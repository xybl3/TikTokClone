//
//  FeedVideoCellCollectionViewCell.swift
//  TikTok
//
//  Created by Olivier Marszałkowski on 31/05/2024.
//

import UIKit
import AVFoundation

class FeedVideoCellCollectionViewCell: UICollectionViewCell {
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.text = "Test"
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var titleText: UILabel!
    var descriptionText: UILabel!
    
    var url: URL?
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    private var isVideoPaused: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSideButtons()
        configureTitleDescription()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with url: URL) {
        self.url = url
        
        player = AVPlayer(url: url)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = .resizeAspectFill
        
        if let playerLayer = playerLayer {
            contentView.layer.insertSublayer(playerLayer, at: 0)
            playerLayer.frame = contentView.bounds
        }
        
        // Start the video playback
        player?.play()
        
        // Loop the video
        NotificationCenter.default.addObserver(self, selector: #selector(restartVideo), name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
        
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleVideoTap)))
        
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = contentView.bounds
    }

    @objc private func restartVideo() {
        player?.seek(to: .zero)
        player?.play()
    }
    
    @objc private func handleVideoTap() {
        if isVideoPaused {
            resumeVideo()
        }
        else {
            pauseVideo()
        }
    }
    
    private func pauseVideo() {
        player?.pause()
        isVideoPaused = true
    }
    private func resumeVideo() {
        player?.play()
        isVideoPaused = false
    }
    
    private func configureSideButtons() {
        let buttonSize: CGFloat = 40
        let buttonSpacing: CGFloat = 20
        let buttonImages = ["heart.fill", "message.fill", "arrowshape.turn.up.right.fill"]
        let selectors: [Selector] = [#selector(likeButtonTapped), #selector(commentButtonTapped), #selector(shareButtonTapped)]
        
        var previousButton: UIView!
        
        // Profile Button
        let userProfile = UIImageView(image: UIImage(named: "user"))
        userProfile.translatesAutoresizingMaskIntoConstraints = false
        userProfile.layer.masksToBounds = true
        userProfile.layer.cornerRadius = buttonSize / 2
        
        contentView.addSubview(userProfile)
        
        NSLayoutConstraint.activate([
            userProfile.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: buttonSize * 2),
            userProfile.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -buttonSpacing),
            userProfile.heightAnchor.constraint(equalToConstant: buttonSize),
            userProfile.widthAnchor.constraint(equalToConstant: buttonSize),
        ])
        
        previousButton = userProfile
        
        for buttonImage in buttonImages.enumerated() {
            let button = UIImageView()
            button.image = UIImage(systemName: buttonImage.element)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tintColor = .white
            
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: selectors[buttonImage.offset])
            button.isUserInteractionEnabled = true
            button.addGestureRecognizer(gestureRecognizer)
            
            contentView.addSubview(button)
            
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: previousButton.bottomAnchor, constant: buttonSpacing),
                button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -buttonSpacing),
                button.heightAnchor.constraint(equalToConstant: buttonSize),
                button.widthAnchor.constraint(equalToConstant: buttonSize)
            ])
            
            previousButton = button
        }
    }
    
    // Dummy selector methods
    @objc private func likeButtonTapped(_ sender: UITapGestureRecognizer) {
        print("Like button tapped")
        
        UIView.animate(withDuration: 0.3) {
            sender.view?.tintColor = .red
        }
    }
    
    @objc private func commentButtonTapped() {
        print("Comment button tapped")
    }
    
    @objc private func shareButtonTapped() {
        print("Share button tapped")
    }
    
    @objc private func followButtonTapped() {
        print("Follow button tapped")
    }
    
    @objc private func profileButtonTapped() {
        print("Profile button tapped")
    }
    
    private func configureTitleDescription() {
        // Description
        descriptionText = UILabel()
        descriptionText.text = "Welcome to tiktok clone!"
        descriptionText.font = .systemFont(ofSize: 14)
        descriptionText.textColor = .white.withAlphaComponent(0.8)
        descriptionText.numberOfLines = 1
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionText)
        
        NSLayoutConstraint.activate([
            descriptionText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            descriptionText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        ])
        
        titleText = UILabel()
        titleText.text = "tiktok.clone"
        titleText.font = .systemFont(ofSize: 17, weight: .semibold)
        titleText.textColor = .white
        titleText.numberOfLines = 1
        titleText.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleText)
        
        NSLayoutConstraint.activate([
            titleText.bottomAnchor.constraint(equalTo: descriptionText.topAnchor, constant: -10),
            titleText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        ])
    }
}
