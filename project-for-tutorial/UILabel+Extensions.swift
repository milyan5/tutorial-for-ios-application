//
//  UILabel+Extensions.swift
//  project-for-tutorial
//
//  Created by Iurii Gubanov on 05/09/2020.
//  Copyright © 2020 Iurii Gubanov. All rights reserved.
//

import UIKit

extension UILabel {
    class func labelForTutorial(text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = .boldSystemFont(ofSize: 14)
        label.text = text
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
}

