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
    lazy var profileTab = UIView()
    lazy var userNameAndLastNameView: UIView = {
        let userNameAndLastNameView = UIView()
        userNameAndLastNameView.layer.cornerRadius = 10
        userNameAndLastNameView.clipsToBounds = true
        userNameAndLastNameView.backgroundColor =  UIColor(red: 0.02, green: 0.13, blue: 0.27, alpha: 1)
        return userNameAndLastNameView
    }()
    lazy var profile: UILabel = {
        let profile = UILabel()
        profile.layer.cornerRadius = 10
        profile.clipsToBounds = true
        profile.numberOfLines = 0
        profile.adjustsFontSizeToFitWidth = true
        profile.font = .preferredFont(forTextStyle: .headline)
        profile.font = profile.font.withSize(40)
        profile.text = " Profile "
        profile.textColor = UIColor(red: 0.14, green: 0.76, blue: 0.76, alpha: 1)
        return profile
    }()
    
    lazy var nameAndLastName: UILabel = {
        let nameAndLastName = UILabel()
        nameAndLastName.clipsToBounds = true
        nameAndLastName.adjustsFontSizeToFitWidth = true
        nameAndLastName.font = .preferredFont(forTextStyle: .title2)
        nameAndLastName.font = nameAndLastName.font.withSize(25)
        nameAndLastName.text = " - User name and last-name: "
        nameAndLastName.textColor = UIColor(red: 0.14, green: 0.76, blue: 0.76, alpha: 1)
        return nameAndLastName
    }()
    
    lazy var userNameAndLastName: UILabel = {
        let userNameAndLastName = UILabel()
        userNameAndLastName.clipsToBounds = true
        userNameAndLastName.numberOfLines = 0
        userNameAndLastName.adjustsFontSizeToFitWidth = true
        userNameAndLastName.font = .preferredFont(forTextStyle: .title2)
        userNameAndLastName.font = userNameAndLastName.font.withSize(20)
        userNameAndLastName.text = " Angela Lee "
        userNameAndLastName.textColor = UIColor(red: 0.14, green: 0.76, blue: 0.76, alpha: 1)
        return userNameAndLastName
    }()
    
    lazy var account: UILabel = {
        let account = UILabel()
        account.clipsToBounds = true
        account.adjustsFontSizeToFitWidth = true
        account.font = .preferredFont(forTextStyle: .title2)
        account.font = account.font.withSize(25)
        account.text = " - User Account: "
        account.textColor = UIColor(red: 0.14, green: 0.76, blue: 0.76, alpha: 1)
        return account
    }()
    
    lazy var userAccount: UILabel = {
        let userAccount = UILabel()
        userAccount.clipsToBounds = true
        userAccount.numberOfLines = 0
        userAccount.adjustsFontSizeToFitWidth = true
        userAccount.font = .preferredFont(forTextStyle: .title2)
        userAccount.font = userAccount.font.withSize(20)
        userAccount.text = " AngieLee99 "
        userAccount.textColor = UIColor(red: 0.14, green: 0.76, blue: 0.76, alpha: 1)
        return userAccount
    }()
    
    lazy var password: UILabel = {
        let password = UILabel()
        password.clipsToBounds = true
        password.adjustsFontSizeToFitWidth = true
        password.font = .preferredFont(forTextStyle: .title2)
        password.font = password.font.withSize(25)
        password.text = " - Password: "
        password.textColor = UIColor(red: 0.14, green: 0.76, blue: 0.76, alpha: 1)
        return password
    }()
    
    lazy var userPassword: UILabel = {
        let userPassword = UILabel()
        userPassword.clipsToBounds = true
        userPassword.numberOfLines = 0
        userPassword.adjustsFontSizeToFitWidth = true
        userPassword.font = .preferredFont(forTextStyle: .title2)
        userPassword.font = userPassword.font.withSize(20)
        userPassword.text = " Al123 "
        userPassword.textColor = UIColor(red: 0.14, green: 0.76, blue: 0.76, alpha: 1)
        return userPassword
    }()
    
    lazy var logout: UIButton = {
        let logout = UIButton()
        logout.layer.cornerRadius = 20
        logout.backgroundColor = UIColor(red: 0.14, green: 0.76, blue: 0.76, alpha: 1).withAlphaComponent(0.7)
        logout.setTitle("Logout", for: .normal)
        logout.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        return logout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        configureScreen()
    }

    func configureScreen() {
        view.backgroundColor = UIColor(red: 0.02, green: 0.13, blue: 0.27, alpha: 1)
        view.addSubview(profileTab)
        profileTab.pin(to: view)
        profileTab.addSubview(profile)
        setProfileConstrains()
        profileTab.addSubview(nameAndLastName)
        setUserNameConstrains()
        profileTab.addSubview(userNameAndLastName)
        setUserConstrains()
        profileTab.addSubview(account)
        setAccountConstrains()
        profileTab.addSubview(userAccount)
        setUserAccountConstrains()
        profileTab.addSubview(password)
        setPasswordConstrains()
        profileTab.addSubview(userPassword)
        setUserPasswordConstrains()
        profileTab.addSubview(logout)
        setLogoutConstrains()
    }
    
    @objc func logoutTapped() {
        coordinator?.loginScreen()
    }
}

// MARK: - Constrains
extension ProfileViewController {
    func setProfileConstrains() {
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.topAnchor.constraint(equalTo: profileTab.topAnchor, constant: 80).isActive = true
        profile.centerXAnchor.constraint(equalTo: profileTab.centerXAnchor).isActive = true
    }
    
    func setUserNameConstrains() {
        nameAndLastName.translatesAutoresizingMaskIntoConstraints = false
        nameAndLastName.topAnchor.constraint(equalTo: profile.topAnchor, constant: 100).isActive = true
        nameAndLastName.leadingAnchor.constraint(equalTo: profileTab.leadingAnchor, constant: 15).isActive = true
        nameAndLastName.trailingAnchor.constraint(lessThanOrEqualTo: profileTab.trailingAnchor, constant: -15).isActive = true
    }
    
    func setUserConstrains() {
        userNameAndLastName.translatesAutoresizingMaskIntoConstraints = false
        userNameAndLastName.topAnchor.constraint(equalTo: nameAndLastName.topAnchor, constant: 50).isActive = true
        userNameAndLastName.leadingAnchor.constraint(equalTo: profileTab.leadingAnchor, constant: 50).isActive = true
        userNameAndLastName.trailingAnchor.constraint(lessThanOrEqualTo: profileTab.trailingAnchor, constant: -15).isActive = true
    }
    
    func setAccountConstrains() {
        account.translatesAutoresizingMaskIntoConstraints = false
        account.topAnchor.constraint(equalTo: userNameAndLastName.topAnchor, constant: 80).isActive = true
        account.leadingAnchor.constraint(equalTo: profileTab.leadingAnchor, constant: 15).isActive = true
        account.trailingAnchor.constraint(lessThanOrEqualTo: profileTab.trailingAnchor, constant: -15).isActive = true
    }
    
    func setUserAccountConstrains() {
        userAccount.translatesAutoresizingMaskIntoConstraints = false
        userAccount.topAnchor.constraint(equalTo: account.topAnchor, constant: 50).isActive = true
        userAccount.leadingAnchor.constraint(equalTo: profileTab.leadingAnchor, constant: 50).isActive = true
        userAccount.trailingAnchor.constraint(lessThanOrEqualTo: profileTab.trailingAnchor, constant: -15).isActive = true
    }
    
    func setPasswordConstrains() {
        password.translatesAutoresizingMaskIntoConstraints = false
        password.topAnchor.constraint(equalTo: userAccount.topAnchor, constant: 80).isActive = true
        password.leadingAnchor.constraint(equalTo: profileTab.leadingAnchor, constant: 15).isActive = true
        password.trailingAnchor.constraint(lessThanOrEqualTo: profileTab.trailingAnchor, constant: -15).isActive = true
    }
    
    func setUserPasswordConstrains() {
        userPassword.translatesAutoresizingMaskIntoConstraints = false
        userPassword.topAnchor.constraint(equalTo: password.topAnchor, constant: 50).isActive = true
        userPassword.leadingAnchor.constraint(equalTo: profileTab.leadingAnchor, constant: 50).isActive = true
        userPassword.trailingAnchor.constraint(lessThanOrEqualTo: profileTab.trailingAnchor, constant: -15).isActive = true
    }
    
    func setLogoutConstrains() {
        logout.translatesAutoresizingMaskIntoConstraints = false
        logout.bottomAnchor.constraint(equalTo: profileTab.bottomAnchor, constant: -200).isActive = true
        logout.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        logout.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        logout.heightAnchor.constraint(equalTo: logout.widthAnchor, multiplier: 1/8).isActive = true
        logout.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
