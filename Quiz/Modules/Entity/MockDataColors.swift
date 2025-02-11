//
//  MockDataColor.swift
//  Quiz
//
//  Created by NikitaKorniuk   on 11.02.25.
//

import Foundation
import UIKit

enum Colors {
    
    static let BacgroundViewColor = setupColor(red: 248, green: 255, blue: 228, alpha: 1)
    
    enum CircularProgress {
        static let GreenColor = setupColor(red: 220, green: 255, blue: 147, alpha: 1)
        static let OrangeColor = setupColor(red: 255, green: 230, blue: 166, alpha: 1)
        static let RedColor = setupColor(red: 255, green: 38, blue: 38, alpha: 1)
    }
    
    enum ButtonsMainView {
        static let BlueColor = setupColor(red: 77, green: 171, blue: 247, alpha: 1)
        static let BlueBorderColor = setupColor(red: 34, green: 139, blue: 230, alpha: 1)
        static let WhiteColor = setupColor(red: 248, green: 215, blue: 155, alpha: 1)
        static let WhiteBorderColor = setupColor(red: 199, green: 215, blue: 155, alpha: 1)
    }
    
    private static func setupColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
