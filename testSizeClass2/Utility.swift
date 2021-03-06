//
//  Utility.swift
//  testSizeClass2
//
//  Created by JerryYang on 11/29/15.
//  Copyright (c) 2015 JerryYang. All rights reserved.
//

import Foundation
import UIKit

/**
get UIColor from a hexstring(e.g. #0298d7)

:param: rgba:String

:returns: UIColor
*/
    func colorFromHexString(rgba:String)->UIColor {
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var alpha: CGFloat = 1.0
    
    if rgba.hasPrefix("#")
    {
        let index = advance(rgba.startIndex,1)
        let hex = rgba.substringFromIndex(index)
        let scanner = NSScanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexLongLong(&hexValue)
        {
            switch (count(hex))
            {
            case 3:
                red = CGFloat((hexValue & 0xF00) >> 8) / 15.0
                green = CGFloat((hexValue & 0x0F0) >> 4) / 15.0
                blue = CGFloat(hexValue & 0x00F) / 15.0
            case 4:
                red = CGFloat((hexValue & 0xF000) >> 12) / 15.0
                green = CGFloat((hexValue & 0x0F00) >> 8) / 15.0
                blue = CGFloat((hexValue & 0x00F0) >> 4) / 15.0
                alpha = CGFloat(hexValue & 0x000F) / 15.0
            case 6:
                red = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8) / 255.0
                blue = CGFloat(hexValue & 0x0000FF) / 255.0
            case 8:
                red = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue = CGFloat((hexValue & 0x0000FF00) >> 8) / 255.0
                alpha = CGFloat(hexValue & 0x000000FF) / 255.0
            default:
                print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8")
                return UIColor.clearColor()
            }
        } else {
            println("Scan hex error")
            return UIColor.clearColor()
        }
    } else {
        println("Invalid RGB string, missing '#' as prefix")
        return UIColor.clearColor()
    }
    return UIColor(red: red, green: green, blue: blue, alpha: 1)
}