//
//  UserCell.swift
//  project-for-tutorial
//
//  Created by Iurii Gubanov on 02/09/2020.
//  Copyright © 2020 Iurii Gubanov. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor.black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let avatarContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initUI()
    }
    
    private func initUI() {
        contentView.addSubview(avatarContainerView)
        avatarContainerView.addSubview(avatarImageView)
        containerView.addSubview(usernameLabel)
        containerView.addSubview(numberLabel)
        contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([avatarContainerView.widthAnchor.constraint(equalToConstant: 30),
                                     avatarContainerView.heightAnchor.constraint(equalToConstant: 30),
                                     avatarImageView.widthAnchor.constraint(equalToConstant: 20),
                                     avatarImageView.heightAnchor.constraint(equalToConstant: 20),
                                     avatarImageView.centerYAnchor.constraint(equalTo: avatarContainerView.centerYAnchor),
                                     avatarImageView.centerXAnchor.constraint(equalTo: avatarContainerView.centerXAnchor),
                                     avatarContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
                                     avatarContainerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     usernameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                                     usernameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                                     usernameLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
                                     usernameLabel.bottomAnchor.constraint(equalTo: numberLabel.topAnchor, constant: -2),
                                     numberLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                                     numberLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor),
                                     numberLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                                     containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     containerView.leadingAnchor.constraint(equalTo: avatarContainerView.trailingAnchor, constant: 24),
                                     containerView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -24)
        ])
        
        avatarContainerView.layer.cornerRadius = 15
        avatarContainerView.layer.borderWidth = 1
        avatarContainerView.layer.borderColor = UIColor.black.cgColor
        avatarContainerView.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with user: User) {
        avatarImageView.image = UIImage(named: "icon-contacts")
        usernameLabel.text = user.fullname
        numberLabel.text = user.number
    }
}
