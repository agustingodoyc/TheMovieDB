//
//  LoginViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 13/12/2022.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, ProfileBaseController {
    // MARK: - Properties
    weak var profileCoordinator: ProfileCoordinator?
    lazy var viewModel = LoginViewModel()
    lazy var welcome: UILabel = {
        let welcome = UILabel()
        welcome.clipsToBounds = true
        welcome.adjustsFontSizeToFitWidth = true
        welcome.font = .preferredFont(forTextStyle: .headline)
        welcome.font = welcome.font.withSize(40)
        welcome.text = " Welcome "
        welcome.textColor = UIColor(named: "movieLightBlue")
        return welcome
    }()
    
    lazy var userName: UITextField = {
        let userName = UITextField()
        userName.backgroundColor = .white.withAlphaComponent(0.5)
        userName.placeholder = " Enter your username"
        return userName
    }()

    lazy var password: UITextField = {
        let password = UITextField()
        password.backgroundColor = .white.withAlphaComponent(0.5)
        password.placeholder = " Enter your password"
        password.isSecureTextEntry = true
        return password
    }()
    
    lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.backgroundColor = UIColor(named: "movieLightBlue")?.withAlphaComponent(0.7)
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return loginButton
    }()
    
    lazy var createdAccountText: UILabel = {
        let createdAccountText = UILabel()
        createdAccountText.text = "If you don't have an account yet..."
        createdAccountText.textColor = .white
        createdAccountText.font = .preferredFont(forTextStyle: .headline)
        createdAccountText.font = welcome.font.withSize(18)
        createdAccountText.backgroundColor = UIColor(named: "movieBlue")
        return createdAccountText
    }()
    
    lazy var registerButton: UIButton = {
        let registerButton = UIButton()
        registerButton.backgroundColor = UIColor(named: "movieLightBlue")?.withAlphaComponent(0.7)
        registerButton.setTitle("Register", for: .normal)
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        return registerButton
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Login"
        configureScreen()
    }
    
    func configureScreen() {
        view.backgroundColor = UIColor(named: "movieBlue")
        view.addSubview(welcome)
        setLoginConstrains()
        view.addSubview(userName)
        setUserNameConstrains()
        view.addSubview(password)
        setPasswordConstrains()
        view.addSubview(loginButton)
        setLoginButtonConstrains()
        view.addSubview(createdAccountText)
        setCreatedAccountTextConstrains()
        view.addSubview(registerButton)
        setRegisterButtonConstrains()
    }
    
    @objc func loginTapped() {
        profileCoordinator?.loginSuccess()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func registerTapped() {
        profileCoordinator?.goToRegisterScreen()
    }
}

// MARK: - Constrains
extension LoginViewController {
    func setLoginConstrains() {
        welcome.translatesAutoresizingMaskIntoConstraints = false
        welcome.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        welcome.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setUserNameConstrains() {
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.topAnchor.constraint(equalTo: welcome.bottomAnchor, constant: 100).isActive = true
        userName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        userName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        userName.heightAnchor.constraint(equalTo: userName.widthAnchor, multiplier: 1/8).isActive = true
        userName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setPasswordConstrains() {
        password.translatesAutoresizingMaskIntoConstraints = false
        password.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 20).isActive = true
        password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        password.heightAnchor.constraint(equalTo: userName.widthAnchor, multiplier: 1/8).isActive = true
        password.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setLoginButtonConstrains() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 50).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        loginButton.heightAnchor.constraint(equalTo: userName.widthAnchor, multiplier: 1/8).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setCreatedAccountTextConstrains() {
        createdAccountText.translatesAutoresizingMaskIntoConstraints = false
        createdAccountText.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 50).isActive = true
        createdAccountText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        createdAccountText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        createdAccountText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setRegisterButtonConstrains() {
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.topAnchor.constraint(equalTo: createdAccountText.bottomAnchor, constant: 50).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        registerButton.heightAnchor.constraint(equalTo: userName.widthAnchor, multiplier: 1/8).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
