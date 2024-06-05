//
//  FeedViewController.swift
//  TikTok
//
//  Created by Olivier Marszałkowski on 31/05/2024.
//

import UIKit

class MainScreenViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let feedVC = FeedViewController()
        let friendsVC = FriendsViewController()
        let inboxVC = InboxViewController()
        let profileVC = ProfileViewController()
        
        feedVC.tabBarItem = UITabBarItem(title: "Home", image: .init(systemName: "house"), tag: 0)
        friendsVC.tabBarItem = UITabBarItem(title: "Friends", image: .init(systemName: "person.2"), tag: 1)
        inboxVC.tabBarItem = UITabBarItem(title: "Inbox", image: .init(systemName: "tray"), tag: 2)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: .init(systemName: "person"), tag: 3)
        
        
        setViewControllers([feedVC, friendsVC, inboxVC, profileVC], animated: true)
        
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .black
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
