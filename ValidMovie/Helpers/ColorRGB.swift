//
//  ColorRGB.swift
//  ValidMovie
//
//  Created by OSCAR DAZA on 30/07/19.
//  Copyright © 2018 OSCAR DAZA. All rights reserved.
//

import Foundation
import  UIKit
func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    
    return UIColor(
        
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        
        alpha: CGFloat(1.0)
        
    )
    
}
