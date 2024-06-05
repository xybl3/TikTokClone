//
//  FirstLaunchViewController.swift
//  TikTok
//
//  Created by Olivier Marszałkowski on 31/05/2024.
//

import UIKit

class FirstLaunchViewController: UIViewController {
    
    var welcomeText: UILabel!
    var tiktokImage: UIImageView!
    var signInButton: UIButton!
    var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureWelcomeText()
        configureTiktokImageView()
        configureSignInRegisterButtons()
        
        // Do any additional setup after loading the view.
    }
    
    func configureWelcomeText() {
        welcomeText = UILabel()
        welcomeText.text = "Make life better"
        welcomeText.font = .systemFont(ofSize: 70, weight: .black)
        welcomeText.translatesAutoresizingMaskIntoConstraints = false
        welcomeText.numberOfLines = 0
        welcomeText.shadowColor = .systemPink
        welcomeText.shadowOffset = .init(width: 3, height: 3)
        
        view.addSubview(welcomeText)
        
        NSLayoutConstraint.activate([
            welcomeText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            welcomeText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            welcomeText.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
        ])
    }
    
    func configureTiktokImageView() {
        tiktokImage = UIImageView()
        
        let img = UIImage(named: "logo")
        tiktokImage.image = img
        
        tiktokImage.contentMode = .scaleAspectFit
        
        
        tiktokImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tiktokImage)
        
        NSLayoutConstraint.activate([
            tiktokImage.bottomAnchor.constraint(equalTo: welcomeText.topAnchor),
            tiktokImage.leadingAnchor.constraint(equalTo: welcomeText.leadingAnchor, constant: -50),
            
            tiktokImage.heightAnchor.constraint(equalToConstant: 300),
            tiktokImage.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    func configureSignInRegisterButtons() {
        
        //        this needs to be in that specific order because of constraints
        
        //        configure register button
        registerButton = UIButton()
        
        registerButton.setTitle("Create account", for: .normal)
        
        registerButton.setTitleColor(.label, for: .normal)
        
        registerButton.layer.borderWidth = 1
        registerButton.layer.borderColor = UIColor.systemGray.cgColor
        
        registerButton.layer.cornerRadius = 10
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            registerButton.widthAnchor.constraint(equalToConstant: 300)
        ])
        //        configure sign in button
        
        signInButton = UIButton()
        
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        
        signInButton.setTitleColor(.white, for: .normal)
        
        signInButton.layer.backgroundColor = UIColor.systemPink.cgColor
        signInButton.layer.cornerRadius = 10
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInButton)
        
        NSLayoutConstraint.activate([
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -5),
            
            signInButton.heightAnchor.constraint(equalToConstant: 40),
            signInButton.widthAnchor.constraint(equalToConstant: 300)
        ])
        
    }
    
    
    @objc func didTapSignInButton() {
        navigationController?.pushViewController(SignInAccountViewController(), animated: true)
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
