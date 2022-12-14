//
//  RegisterViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 13/12/2022.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    lazy var viewModel = RegisterViewModel()
    weak var coordinator: MainCoordinator?
    lazy var register: UILabel = {
        let register = UILabel()
        register.layer.cornerRadius = 10
        register.clipsToBounds = true
        register.adjustsFontSizeToFitWidth = true
        register.font = .preferredFont(forTextStyle: .headline)
        register.font = register.font.withSize(40)
        register.text = " Register "
        register.textColor = UIColor(named: "movieLightBlue")
        return register
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
    
    lazy var passwordConfirm: UITextField = {
        let passwordConfirm = UITextField()
        passwordConfirm.backgroundColor = .white.withAlphaComponent(0.5)
        passwordConfirm.placeholder = " Enter your password again"
        passwordConfirm.isSecureTextEntry = true
        return passwordConfirm
    }()
    
    lazy var createAccount: UIButton = {
        let createAccount = UIButton()
        createAccount.backgroundColor = UIColor(named: "movieLightBlue")?.withAlphaComponent(0.7)
        createAccount.setTitle("Create Account", for: .normal)
        createAccount.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        return createAccount
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        configureScreen()
    }
    
    func configureScreen() {
        view.backgroundColor = UIColor(named: "movieBlue")
        view.addSubview(register)
        setLoginConstrains()
        view.addSubview(userName)
        setUserNameConstrains()
        view.addSubview(password)
        setPasswordConstrains()
        view.addSubview(passwordConfirm)
        setPasswordConfirmConstrains()
        view.addSubview(createAccount)
        setRegisterButtonConstrains()
    }
    
    @objc func registerTapped() {
        if viewModel.createUser(userName: userName.text ?? "", password: password.text ?? "", passwordConfirm: passwordConfirm.text ?? "") == true {
            coordinator?.start()
        } else {
            var alert: UIAlertController = UIAlertController(title: "Error", message: "The username already exists or the repeated password is incorrect", preferredStyle: .alert)

        }
    }
}

extension RegisterViewController {
    func setLoginConstrains() {
        register.translatesAutoresizingMaskIntoConstraints = false
        register.topAnchor.constraint(equalTo: view.topAnchor, constant: 180).isActive = true
        register.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setUserNameConstrains() {
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.topAnchor.constraint(equalTo: register.bottomAnchor, constant: 100).isActive = true
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
    
    func setPasswordConfirmConstrains() {
        passwordConfirm.translatesAutoresizingMaskIntoConstraints = false
        passwordConfirm.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20).isActive = true
        passwordConfirm.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        passwordConfirm.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        passwordConfirm.heightAnchor.constraint(equalTo: userName.widthAnchor, multiplier: 1/8).isActive = true
        passwordConfirm.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setRegisterButtonConstrains() {
        createAccount.translatesAutoresizingMaskIntoConstraints = false
        createAccount.topAnchor.constraint(equalTo: passwordConfirm.bottomAnchor, constant: 50).isActive = true
        createAccount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        createAccount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        createAccount.heightAnchor.constraint(equalTo: userName.widthAnchor, multiplier: 1/8).isActive = true
        createAccount.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
