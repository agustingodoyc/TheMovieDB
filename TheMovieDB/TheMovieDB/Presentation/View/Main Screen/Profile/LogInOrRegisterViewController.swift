//
//  LogInViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 14/12/2022.
//

import Foundation
import UIKit
import SwiftUI

class LoginOrRegisterViewController: UIViewController, BaseViewController {
    weak var coordinator: MainCoordinator?
    lazy var profileTab = UIView()
    
    lazy var loginOrRegister: UILabel = {
        let loginOrRegister = UILabel()
        loginOrRegister.clipsToBounds = true
        loginOrRegister.adjustsFontSizeToFitWidth = true
        loginOrRegister.font = .preferredFont(forTextStyle: .headline)
        loginOrRegister.font = loginOrRegister.font.withSize(40)
        loginOrRegister.text = " Login or Register "
        loginOrRegister.textColor = UIColor(named: "movieLightBlue")
        return loginOrRegister
    }()
    
    lazy var loginText: UILabel = {
        let loginText = UILabel()
        loginText.text = "If you are not logged in, please press the following button"
        loginText.textColor = .white
        loginText.numberOfLines = 0
        loginText.font = .preferredFont(forTextStyle: .caption1)
        loginText.font = loginText.font.withSize(18)
        loginText.backgroundColor = UIColor(red: 0.02, green: 0.13, blue: 0.27, alpha: 1)
        return loginText
    }()
    
    lazy var login: UIButton = {
        let login = UIButton()
        login.layer.cornerRadius = 20
        login.backgroundColor = UIColor(named: "movieLightBlue")?.withAlphaComponent(0.7)
        login.setTitle("Login", for: .normal)
        login.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return login
    }()
    
    lazy var registerText: UILabel = {
        let registerText = UILabel()
        registerText.text = "If you don't have an account yet, please press the following button"
        registerText.textColor = .white
        registerText.numberOfLines = 0
        registerText.font = .preferredFont(forTextStyle: .caption1)
        registerText.font = registerText.font.withSize(18)
        registerText.backgroundColor = UIColor(red: 0.02, green: 0.13, blue: 0.27, alpha: 1)
        return registerText
    }()
    
    lazy var register: UIButton = {
        let register = UIButton()
        register.layer.cornerRadius = 20
        register.backgroundColor = UIColor(named: "movieLightBlue")?.withAlphaComponent(0.7)
        register.setTitle("Register", for: .normal)
        register.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        return register
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Login or Register"
        configureScreen()
    }
    
    func configureScreen() {
        view.backgroundColor = UIColor(named: "movieBlue")
        view.addSubview(profileTab)
        profileTab.pin(to: view)
        profileTab.addSubview(loginOrRegister)
        setLoginOrRegisterContrains()
        profileTab.addSubview(loginText)
        setLoginTextConstrains()
        profileTab.addSubview(login)
        setLoginConstrains()
        profileTab.addSubview(registerText)
        setRegisterTextConstrains()
        profileTab.addSubview(register)
        setRegisterConstrains()
    }
    
    @objc func loginTapped() {
        coordinator?.loginScreen()
    }
    @objc func registerTapped() {
        coordinator?.registerScreen()
    }
}

// MARK: - Constrains
extension LoginOrRegisterViewController {
    func setLoginOrRegisterContrains() {
        loginOrRegister.translatesAutoresizingMaskIntoConstraints = false
        loginOrRegister.topAnchor.constraint(equalTo: profileTab.topAnchor, constant: 100).isActive = true
        loginOrRegister.centerXAnchor.constraint(equalTo: profileTab.centerXAnchor).isActive = true
    }
    
    func setLoginTextConstrains() {
        loginText.translatesAutoresizingMaskIntoConstraints = false
        loginText.topAnchor.constraint(equalTo: loginOrRegister.bottomAnchor, constant: 50).isActive = true
        loginText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        loginText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        loginText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setLoginConstrains() {
        login.translatesAutoresizingMaskIntoConstraints = false
        login.topAnchor.constraint(equalTo: loginText.bottomAnchor, constant: 50).isActive = true
        login.leadingAnchor.constraint(equalTo: profileTab.leadingAnchor, constant: 50).isActive = true
        login.trailingAnchor.constraint(equalTo: profileTab.trailingAnchor, constant: -50).isActive = true
        login.heightAnchor.constraint(equalTo: login.widthAnchor, multiplier: 1/8).isActive = true
        login.centerXAnchor.constraint(equalTo: profileTab.centerXAnchor).isActive = true
    }
    
    func setRegisterTextConstrains() {
        registerText.translatesAutoresizingMaskIntoConstraints = false
        registerText.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 50).isActive = true
        registerText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        registerText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        registerText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setRegisterConstrains() {
        register.translatesAutoresizingMaskIntoConstraints = false
        register.topAnchor.constraint(equalTo: registerText.bottomAnchor, constant: 50).isActive = true
        register.leadingAnchor.constraint(equalTo: profileTab.leadingAnchor, constant: 50).isActive = true
        register.trailingAnchor.constraint(equalTo: profileTab.trailingAnchor, constant: -50).isActive = true
        register.heightAnchor.constraint(equalTo: register.widthAnchor, multiplier: 1/8).isActive = true
        register.centerXAnchor.constraint(equalTo: profileTab.centerXAnchor).isActive = true
    }
}
