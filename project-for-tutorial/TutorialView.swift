//
//  TutorialView.swift
//  project-for-tutorial
//
//  Created by Iurii Gubanov on 06/09/2020.
//  Copyright © 2020 Iurii Gubanov. All rights reserved.
//

import UIKit

class TutorialView: UIView {
    
    private let overlayImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0.9
        return imageView
    }()
    
    private var rects: [CGRect] = []
    private let descriptionWidth: CGFloat = 120
    
    init() {
        super.init(frame: .zero)
        
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        isHidden = true
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(overlayImageView)
        NSLayoutConstraint.activate([overlayImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     overlayImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     overlayImageView.topAnchor.constraint(equalTo: topAnchor),
                                     overlayImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configureAddBarButton(_ button: UIBarButtonItem) {
        
        guard let window = UIApplication.shared.windows.first else { return }
        guard let addButtonView = button.value(forKey: "view") as? UIView else { return }
        guard let statusBarHeight = window.windowScene?.statusBarManager?.statusBarFrame.size.height else { return }
        
        var addButtonFrame = addButtonView.convert(addButtonView.frame, to: self)
        addButtonFrame.origin.y = statusBarHeight
        addButtonFrame.origin.x = UIScreen.main.bounds.size.width - addButtonFrame.size.width - 7
        rects.append(addButtonFrame)
        
        let size = CGSize(width: 50, height: 250)
        let arrowAddButtonImageView = UIImageView.imageView(with: size)
        let startPoint = CGPoint(x: 0, y: size.height)
        let endPoint = CGPoint(x: size.width - 10, y: 0)
        let arrowAddButtonImage = DrawHelper.drawArrow(size: size,
                                                       color: .white,
                                                       startPoint: startPoint,
                                                       endPoint: endPoint)
        arrowAddButtonImageView.image = arrowAddButtonImage
        addSubview(arrowAddButtonImageView)

        NSLayoutConstraint.activate([arrowAddButtonImageView.topAnchor.constraint(equalTo: topAnchor,
                                                                                  constant: addButtonFrame.maxY + 10),
                                     arrowAddButtonImageView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                                                       constant: -addButtonFrame.size.width / 2 + 3)
        ])

        let addButtonDescriptionLabel = UILabel.labelForTutorial(text: "Добавление контакта")
        addSubview(addButtonDescriptionLabel)
        let descriptionWidth: CGFloat = 120
        NSLayoutConstraint.activate([addButtonDescriptionLabel.widthAnchor.constraint(equalToConstant: descriptionWidth),
                                     addButtonDescriptionLabel.topAnchor.constraint(equalTo: arrowAddButtonImageView.bottomAnchor,
                                                                                    constant: 10),
                                     addButtonDescriptionLabel.leadingAnchor.constraint(equalTo: arrowAddButtonImageView.leadingAnchor,
                                                                                        constant: -descriptionWidth / 2)
        ])
    }
    
    func configureAvatar(_ cell: UITableViewCell) {
        
        guard let userCell = cell as? UserCell else { return }
        
        let avatarRect = userCell.avatarContainerView.convert(userCell.avatarContainerView.bounds, to: self)
        rects.append(avatarRect)
        
        let size = CGSize(width: 40, height: 100)
        let arrowAvatarImageView = UIImageView.imageView(with: size)
        let startPoint = CGPoint(x: size.width, y: size.height)
        let endPoint = CGPoint(x: size.width / 2, y: 0)
        let arrowAvatarImage = DrawHelper.drawArrow(size: size,
                                                    color: .white,
                                                    startPoint: startPoint,
                                                    endPoint: endPoint)
        arrowAvatarImageView.image = arrowAvatarImage
        addSubview(arrowAvatarImageView)

        NSLayoutConstraint.activate([arrowAvatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: avatarRect.maxY + 10),
                                     arrowAvatarImageView.centerXAnchor.constraint(equalTo: userCell.avatarContainerView.centerXAnchor)
        ])
        
        let avatarDescriptionLabel = UILabel.labelForTutorial(text: "Аватар контакта")
        addSubview(avatarDescriptionLabel)

        NSLayoutConstraint.activate([avatarDescriptionLabel.widthAnchor.constraint(equalToConstant: descriptionWidth),
                                     avatarDescriptionLabel.topAnchor.constraint(equalTo: arrowAvatarImageView.bottomAnchor,
                                                                                 constant: 10),
                                     avatarDescriptionLabel.trailingAnchor.constraint(equalTo: arrowAvatarImageView.trailingAnchor,
                                                                                      constant: descriptionWidth / 2)
        ])
    }
    
    func configureUsername(_ cell: UITableViewCell) {
        
        guard let userCell = cell as? UserCell else { return }
        
        let usernameRect = userCell.containerView.convert(userCell.containerView.bounds, to: self)
        rects.append(usernameRect)
        
        let size = CGSize(width: 40, height: 50)
        let arrowUsernameImageView = UIImageView.imageView(with: size)
        let startPoint = CGPoint(x: size.width, y: size.height)
        let endPoint = CGPoint(x: size.width / 2, y: 0)
        let arrowUsernameImage = DrawHelper.drawArrow(size: size,
                                                      color: .white,
                                                      startPoint: startPoint,
                                                      endPoint: endPoint)
        arrowUsernameImageView.image = arrowUsernameImage
        addSubview(arrowUsernameImageView)

        NSLayoutConstraint.activate([arrowUsernameImageView.topAnchor.constraint(equalTo: topAnchor,
                                                                                 constant: usernameRect.maxY + 10),
                                     arrowUsernameImageView.centerXAnchor.constraint(equalTo: userCell.containerView.centerXAnchor)
        ])

        let usernameDescriptionLabel = UILabel.labelForTutorial(text: "Имя контакта и номер телефона")
        addSubview(usernameDescriptionLabel)

        NSLayoutConstraint.activate([usernameDescriptionLabel.widthAnchor.constraint(equalToConstant: descriptionWidth),
                                     usernameDescriptionLabel.topAnchor.constraint(equalTo: arrowUsernameImageView.bottomAnchor,
                                                                                   constant: 10),
                                     usernameDescriptionLabel.trailingAnchor.constraint(equalTo: arrowUsernameImageView.trailingAnchor,
                                                                                        constant: descriptionWidth / 2)
        ])
    }
    
    func configureTabBarItems(_ items: [UITabBarItem], safeAreaBottomInset: CGFloat) {
        
        let barButtonsDescriptions = [0: "Список контактов", 1: "Различные настройки приложения"]
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        let itemScreenWidth = screenWidth / CGFloat(items.count)
        items.enumerated().forEach { (index, item) in
            guard let barButtonView = item.value(forKey: "view") as? UIView else { return }
            
            let buttonWidth: CGFloat = 70
            let xPos = CGFloat(index) * itemScreenWidth + (itemScreenWidth - buttonWidth) / 2
            let yPos = screenHeight - safeAreaBottomInset
            var buttonRect = barButtonView.frame
            buttonRect.origin.x = xPos
            buttonRect.origin.y = yPos
            buttonRect.size.width = buttonWidth
            
            rects.append(buttonRect)
            
            let tabBarItemSize = CGSize(width: 20, height: 100)
            let arrowTabBarItemImageView = UIImageView.imageView(with: tabBarItemSize)
            let startPoint = CGPoint(x: tabBarItemSize.width / 2, y: 0)
            let endPoint = CGPoint(x: tabBarItemSize.width / 2, y: tabBarItemSize.height)
            let arrowTabBarItemImage = DrawHelper.drawArrow(size: tabBarItemSize,
                                                            color: .white,
                                                            startPoint: startPoint,
                                                            endPoint: endPoint)
            arrowTabBarItemImageView.image = arrowTabBarItemImage
            addSubview(arrowTabBarItemImageView)

            NSLayoutConstraint.activate([arrowTabBarItemImageView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                                                          constant: -(safeAreaBottomInset + 10)),
                                         arrowTabBarItemImageView.centerXAnchor.constraint(equalTo: barButtonView.centerXAnchor)
            ])

            if let text = barButtonsDescriptions[index] {
                let tabBarItemDescriptionLabel = UILabel.labelForTutorial(text: text)
                addSubview(tabBarItemDescriptionLabel)

                NSLayoutConstraint.activate([tabBarItemDescriptionLabel.bottomAnchor.constraint(equalTo: arrowTabBarItemImageView.topAnchor,
                                                                                                constant: -10),
                                             tabBarItemDescriptionLabel.centerXAnchor.constraint(equalTo: arrowTabBarItemImageView.centerXAnchor),
                                             tabBarItemDescriptionLabel.widthAnchor.constraint(equalToConstant: descriptionWidth)
                ])
            }
        }
    }
    
    func showTutorial() {
        
        isHidden = false
        let image = DrawHelper.createCroppingRectangles(to: rects)
        guard let cropImage = DrawHelper.cropBlackRectangles(image: image) else { return }
        let blackImage = DrawHelper.changeColor(.white, newColor: .black, image: cropImage)
        overlayImageView.image = blackImage
    }
}
