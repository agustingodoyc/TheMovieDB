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
    
    lazy var usernameError: UILabel = {
        let usernameError = UILabel()
        usernameError.textColor = .red
        usernameError.text = "Username already exist, please try another"
        return usernameError
    }()
    
    lazy var passwordConfirmError: UILabel = {
        let passwordConfirmError = UILabel()
        passwordConfirmError.numberOfLines = 0
        passwordConfirmError.textColor = .red
        passwordConfirmError.text = "The verification password is not correct"
        return passwordConfirmError
    }()
    
    lazy var emptyFieldError: UILabel = {
        let emptyFieldError = UILabel()
        emptyFieldError.numberOfLines = 0
        emptyFieldError.textColor = .red
        emptyFieldError.text = "Please complete all fields"
        return emptyFieldError
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        configureScreen()
    }
    
    func configureScreen() {
        view.backgroundColor = UIColor(named: "movieBlue")
        usernameError.isHidden = true
        passwordConfirmError.isHidden = true
        emptyFieldError.isHidden = true
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
        view.addSubview(usernameError)
        setUserNameErrorConstrains()
        view.addSubview(passwordConfirmError)
        setPasswordConfirmErrorConstrains()
        view.addSubview(emptyFieldError)
        setEmptyFieldErrorConstrains()
    }
    
    @objc func registerTapped() {
        //Verificar a otra función
        //checkear contraseña coincidan
        guard let enterUserName = userName.text,
              !enterUserName.isEmpty,
              let enterPassword = password.text,
              !enterPassword.isEmpty,
              let enterPasswordConfirm = passwordConfirm.text,
              !enterPasswordConfirm.isEmpty
        else {
            emptyFieldError.isHidden = false

            return
        }
        //solo usuario y contraseña
        //Un delegate para manejar el error de createUser (usuario existente)
        guard viewModel.createUser(
            userName: enterUserName,
            password: enterPassword,
            passwordConfirm: enterPasswordConfirm)
                == .success else {
            if viewModel.createUser(
                userName: enterUserName,
                password: enterPassword,
                passwordConfirm: enterPasswordConfirm) == .existedUserName {
                usernameError.isHidden = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.usernameError.isHidden = true
                }
            } else {
                passwordConfirmError.isHidden = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.passwordConfirmError.isHidden = true
                }
            }
            return
        }
        coordinator?.start()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
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
    
    func setUserNameErrorConstrains() {
        usernameError.translatesAutoresizingMaskIntoConstraints = false
        usernameError.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameError.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
    
    func setPasswordConfirmErrorConstrains() {
        passwordConfirmError.translatesAutoresizingMaskIntoConstraints = false
        passwordConfirmError.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordConfirmError.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
    
    func setEmptyFieldErrorConstrains() {
        emptyFieldError.translatesAutoresizingMaskIntoConstraints = false
        emptyFieldError.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyFieldError.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
}
