//
//  ProfileViewController.swift
//  TikTok
//
//  Created by Olivier Marszałkowski on 31/05/2024.
//

import UIKit

class ProfileViewController: UIViewController  {
    
    var collectionView: UICollectionView!
    
    var navBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureCollectionview()
        
        
        
    }
    
    func configureCollectionview() {
        let layout = UICollectionViewFlowLayout()
        //        layout.itemSize = CGSize(width: (view.frame.width / 3) - 1, height: (view.frame.width / 3) - 1)
        layout.itemSize = CGSize(width: (view.frame.width / 3) - 1, height: 200)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.headerReferenceSize = CGSize(width: view.frame.width, height: 600)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30 // Liczba zdjęć w siatce
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .gray // Zastąp to obrazem
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! HeaderView
            return header
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
}


class HeaderView: UICollectionReusableView {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "user")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jacob West"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    let handleLabel: UILabel = {
        let label = UILabel()
        label.text = "@jacob_w"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    let followingLabel: UILabel = {
        let label = UILabel()
        label.text = "14\nFollowing"
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let followersLabel: UILabel = {
        let label = UILabel()
        label.text = "38\nFollowers"
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.text = "91\nLikes"
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap to add bio"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupProfileImageView()
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupProfileImageView() {
        addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupLabels() {
        let stackView = UIStackView(arrangedSubviews: [followingLabel, followersLabel, likesLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(usernameLabel)
        addSubview(handleLabel)
        addSubview(stackView)
        addSubview(bioLabel)
        
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        handleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            usernameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            usernameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            
            handleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            handleLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
            
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.topAnchor.constraint(equalTo: handleLabel.bottomAnchor, constant: 15),
            stackView.widthAnchor.constraint(equalToConstant: 300),
            
            bioLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            bioLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10)
        ])
    }
}
