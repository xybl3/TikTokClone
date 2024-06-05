//
//  SignInAccountViewController.swift
//  TikTok
//
//  Created by Olivier Marszałkowski on 31/05/2024.
//

import UIKit

class SignInAccountViewController: UIViewController {
    
    var loginTextField:    UITextField!
    var passwordTextField: UITextField!
    var loginButton:       UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        title = "Sign in"
        navigationController?.navigationBar.tintColor = .label
        
        
        configureTextFields()
        configureButton()
        // Do any additional setup after loading the view.
    }
    
    func configureTextFields() {
        loginTextField = UITextField()
        
        // Basic properties
        loginTextField.placeholder = "Login"
        loginTextField.font = .preferredFont(forTextStyle: .body)
        loginTextField.textColor = .label
        loginTextField.textAlignment = .left
        loginTextField.returnKeyType = .done
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // Border and background
        loginTextField.layer.borderColor = UIColor.systemGray3.cgColor
        loginTextField.layer.borderWidth = 1.0
        loginTextField.layer.cornerRadius = 10
        loginTextField.backgroundColor = UIColor.systemGray6
        
        // Padding inside the text field
        loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTextField.frame.height))
        loginTextField.leftViewMode = .always
        
        view.addSubview(loginTextField)
        
        NSLayoutConstraint.activate([
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        passwordTextField = UITextField()
        
        // Basic properties
        passwordTextField.placeholder = "Password"
        passwordTextField.font = .preferredFont(forTextStyle: .body)
        passwordTextField.textColor = .label
        passwordTextField.textAlignment = .left
        passwordTextField.returnKeyType = .done
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // Border passwordTextFieldbackground
        passwordTextField.layer.borderColor = UIColor.systemGray3.cgColor
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.backgroundColor = UIColor.systemGray6
        
        
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        
        view.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    func configureButton() {
        loginButton = UIButton()
        
        loginButton.setTitle("Sign In", for: .normal)
        loginButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        
        loginButton.setTitleColor(.white, for: .normal)
        
        loginButton.layer.backgroundColor = UIColor.systemPink.cgColor
        loginButton.layer.cornerRadius = 10
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
    }
    
    @objc func didTapSignInButton(){
        let feedVC = MainScreenViewController()
        
        feedVC.modalPresentationStyle = .fullScreen
        
        present(feedVC, animated: true)
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
