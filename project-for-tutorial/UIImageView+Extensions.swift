//
//  UIImageView+Extensions.swift
//  project-for-tutorial
//
//  Created by Iurii Gubanov on 05/09/2020.
//  Copyright © 2020 Iurii Gubanov. All rights reserved.
//

import UIKit

extension UIImageView {
    class func imageView(with size: CGSize) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageView.heightAnchor.constraint(equalToConstant: size.height),
                                     imageView.widthAnchor.constraint(equalToConstant: size.width)
        ])
        return imageView
    }
}
