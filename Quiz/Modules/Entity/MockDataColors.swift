//
//  MockDataColor.swift
//  Quiz
//
//  Created by NikitaKorniuk   on 11.02.25.
//

import Foundation
import UIKit

enum Colors {
    
    static let BacgroundViewColor = UIColor(red: 248/255, green: 215/255, blue: 155/255, alpha: 1)
    
    enum CircularProgress {
        static let GreenColor = UIColor(red: 220/255, green: 255/255, blue: 147/255, alpha: 1)
        static let OrangeColor = UIColor(red: 255/255, green: 230/255, blue: 166/255, alpha: 1)
        static let RedColor = UIColor(red: 255/255, green: 38/255, blue: 38/255, alpha: 1)
    }
    
    enum ButtonsMainView {
        static let BlueColor = UIColor(red: 77/255, green: 171/255, blue: 247/255, alpha: 1)
        static let BlueBorderColor = UIColor(red: 34/255, green: 139/255, blue: 230/255, alpha: 1)
        static let WhiteColor = UIColor(red: 248/255, green: 215/255, blue: 155/255, alpha: 1)
        static let WhiteBorderColor = UIColor(red: 199/255, green: 215/255, blue: 155/255, alpha: 1)
    }
    
    private func setupColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
