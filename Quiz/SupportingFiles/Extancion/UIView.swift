//
//  UIView.swift
//  Quiz
//
//  Created by NikitaKorniuk   on 09.02.25.
//

import UIKit

extension UIView {
    func add(subviews: UIView...) {
        subviews.forEach(self.addSubview)
    }
}
