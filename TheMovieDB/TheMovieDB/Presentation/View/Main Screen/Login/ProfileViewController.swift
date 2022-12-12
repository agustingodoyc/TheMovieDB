//
//  LoginViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 12/12/2022.
//

import Foundation
import UIKit
import SwiftUI

class ProfileViewController: UIViewController, BaseViewController {
    weak var coordinator: MainCoordinator?
    //lazy var viewModel = LoginViewModel()
    lazy var loginView = UIView()
    lazy var profile: UILabel = {
        let profile = UILabel()
        profile.layer.cornerRadius = 10
        profile.clipsToBounds = true
        profile.numberOfLines = 0
        profile.adjustsFontSizeToFitWidth = true
        profile.font = .preferredFont(forTextStyle: .title1)
        profile.backgroundColor =  UIColor(red: 0.14, green: 0.76, blue: 0.76, alpha: 1).withAlphaComponent(0.5)
        profile.text = " Profile "
        profile.textColor = UIColor(red: 0.02, green: 0.13, blue: 0.27, alpha: 1)
        return profile
    }()
    
    lazy var nameAndLastName: UILabel = {
        let nameAndLastName = UILabel()
        nameAndLastName.clipsToBounds = true
        nameAndLastName.adjustsFontSizeToFitWidth = true
        nameAndLastName.font = .preferredFont(forTextStyle: .title2)
        nameAndLastName.text = " User name and last-name: "
        nameAndLastName.textColor = UIColor(red: 0.02, green: 0.13, blue: 0.27, alpha: 1)
        return nameAndLastName
    }()
    
    lazy var userNameAndLastName: UILabel = {
        let userNameAndLastName = UILabel()
        userNameAndLastName.clipsToBounds = true
        userNameAndLastName.numberOfLines = 0
        userNameAndLastName.adjustsFontSizeToFitWidth = true
        userNameAndLastName.font = .preferredFont(forTextStyle: .title2)
        userNameAndLastName.text = " Angela Lee "
        userNameAndLastName.textColor = UIColor(red: 0.02, green: 0.13, blue: 0.27, alpha: 1)
        return userNameAndLastName
    }()
    
    lazy var account: UILabel = {
        let account = UILabel()
        account.clipsToBounds = true
        account.adjustsFontSizeToFitWidth = true
        account.font = .preferredFont(forTextStyle: .title2)
        account.text = " User Account: "
        account.textColor = UIColor(red: 0.02, green: 0.13, blue: 0.27, alpha: 1)
        return account
    }()
    
    lazy var userAccount: UILabel = {
        let userAccount = UILabel()
        userAccount.clipsToBounds = true
        userAccount.numberOfLines = 0
        userAccount.adjustsFontSizeToFitWidth = true
        userAccount.font = .preferredFont(forTextStyle: .title2)
        userAccount.text = " AngieLee99 "
        userAccount.textColor = UIColor(red: 0.02, green: 0.13, blue: 0.27, alpha: 1)
        return userAccount
    }()
    
    lazy var password: UILabel = {
        let password = UILabel()
        password.clipsToBounds = true
        password.adjustsFontSizeToFitWidth = true
        password.font = .preferredFont(forTextStyle: .title2)
        password.text = " Password: "
        password.textColor = UIColor(red: 0.02, green: 0.13, blue: 0.27, alpha: 1)
        return password
    }()
    
    lazy var userPassword: UILabel = {
        let userPassword = UILabel()
        userPassword.clipsToBounds = true
        userPassword.numberOfLines = 0
        userPassword.adjustsFontSizeToFitWidth = true
        userPassword.font = .preferredFont(forTextStyle: .title2)
        userPassword.text = " Al123 "
        userPassword.textColor = UIColor(red: 0.02, green: 0.13, blue: 0.27, alpha: 1)
        return userPassword
    }()
    
    lazy var logout: UIButton = {
        let logout = UIButton()
        logout.setTitle("Logout", for: .normal)
        logout.frame = CGRect(x: 200, y: 200, width: 300, height: 50)
        logout.layer.cornerRadius = 10
        logout.backgroundColor = UIColor(red: 0.02, green: 0.13, blue: 0.27, alpha: 1)
        logout.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        return logout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScreen()
    }

    func configureScreen() {
        view.backgroundColor = UIColor(red: 0.14, green: 0.76, blue: 0.76, alpha: 1)
        view.addSubview(loginView)
        loginView.pin(to: view)
        loginView.addSubview(profile)
        setProfileConstrains()
        loginView.addSubview(nameAndLastName)
        setUserNameConstrains()
        loginView.addSubview(userNameAndLastName)
        setUserConstrains()
        loginView.addSubview(account)
        setAccountConstrains()
        loginView.addSubview(userAccount)
        setUserAccountConstrains()
        loginView.addSubview(password)
        setPasswordConstrains()
        loginView.addSubview(userPassword)
        setUserPasswordConstrains()
        loginView.addSubview(logout)
        setLogoutConstrains()
    }
    
    @objc func logoutTapped() {
        coordinator?.goToSearchMovieScreen()
    }
}

// MARK: - Constrains
extension ProfileViewController {
    func setProfileConstrains() {
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 100).isActive = true
        profile.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
    }
    
    func setUserNameConstrains() {
        nameAndLastName.translatesAutoresizingMaskIntoConstraints = false
        nameAndLastName.topAnchor.constraint(equalTo: profile.topAnchor, constant: 50).isActive = true
        nameAndLastName.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 15).isActive = true
        nameAndLastName.trailingAnchor.constraint(lessThanOrEqualTo: loginView.trailingAnchor, constant: -15).isActive = true
    }
    
    func setUserConstrains() {
        userNameAndLastName.translatesAutoresizingMaskIntoConstraints = false
        userNameAndLastName.topAnchor.constraint(equalTo: nameAndLastName.topAnchor, constant: 50).isActive = true
        userNameAndLastName.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 50).isActive = true
        userNameAndLastName.trailingAnchor.constraint(lessThanOrEqualTo: loginView.trailingAnchor, constant: -15).isActive = true
    }
    
    func setAccountConstrains() {
        account.translatesAutoresizingMaskIntoConstraints = false
        account.topAnchor.constraint(equalTo: userNameAndLastName.topAnchor, constant: 80).isActive = true
        account.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 15).isActive = true
        account.trailingAnchor.constraint(lessThanOrEqualTo: loginView.trailingAnchor, constant: -15).isActive = true
    }
    
    func setUserAccountConstrains() {
        userAccount.translatesAutoresizingMaskIntoConstraints = false
        userAccount.topAnchor.constraint(equalTo: account.topAnchor, constant: 50).isActive = true
        userAccount.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 50).isActive = true
        userAccount.trailingAnchor.constraint(lessThanOrEqualTo: loginView.trailingAnchor, constant: -15).isActive = true
    }
    
    func setPasswordConstrains() {
        password.translatesAutoresizingMaskIntoConstraints = false
        password.topAnchor.constraint(equalTo: userAccount.topAnchor, constant: 80).isActive = true
        password.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 15).isActive = true
        password.trailingAnchor.constraint(lessThanOrEqualTo: loginView.trailingAnchor, constant: -15).isActive = true
    }
    
    func setUserPasswordConstrains() {
        userPassword.translatesAutoresizingMaskIntoConstraints = false
        userPassword.topAnchor.constraint(equalTo: password.topAnchor, constant: 50).isActive = true
        userPassword.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 50).isActive = true
        userPassword.trailingAnchor.constraint(lessThanOrEqualTo: loginView.trailingAnchor, constant: -15).isActive = true
    }
    
    func setLogoutConstrains() {
        logout.translatesAutoresizingMaskIntoConstraints = false
        logout.topAnchor.constraint(equalTo: userPassword.topAnchor, constant: 100).isActive = true
        logout.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
    }
}
