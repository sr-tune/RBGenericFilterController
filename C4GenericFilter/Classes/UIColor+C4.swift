//
//  UIColor+C4.swift
//  Carrefour_FR_V2
//
//  Created by Lamine NDIAYE on 01/04/16.
//  Copyright © 2016 Carrefour. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
  
  // MARK: - INIT

  convenience init(red: Int, green: Int, blue: Int, transparency: CGFloat) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")
    
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: transparency)
  }
  
  convenience init(hex: Int) {
    self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff, transparency: 1)
  }
  
  convenience init(transparencyWithHex hex: Int, transparency: CGFloat = 0.1) {
    self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff, transparency: transparency)
  }
  
  
  /////////////////////////////////////////////////////////////
  
  static func carrefourBlueCarrefourColor() -> UIColor {
    return UIColor(hex: 0x1e5bc6)
  }
  
  static func carrefourTransparencyBlueCarrefourColor() -> UIColor {
    return UIColor(transparencyWithHex: 0x1e5bc6)
  }
  
  static func carrefourTransparencyWhiteCarrefourColor() -> UIColor {
    return UIColor(transparencyWithHex: 0xffffff)
  }
  
  // MARK: - ECOUPON
  static func carrefourOrangeColor() -> UIColor {
    return UIColor(hex: 0xf0780a)
  }
  
  static func carrefourTransparencyOrangeColor() -> UIColor {
    return UIColor(transparencyWithHex: 0xf0780a)
  }
  
  static func carrefourTransparencyGrayMainColor() -> UIColor {
    return UIColor(transparencyWithHex: 0x797c8a)
  }
  
  // MARK: - STORELOCATOR | CATALOG
  static func carrefourTurquoiseColor() -> UIColor {
    return UIColor(hex: 0x00b7bf)
  }
  
  static func carrefourTransparencyTurquoiseColor() -> UIColor {
    return UIColor(transparencyWithHex: 0x00b7bf)
  }
  
  static func carrefourTurquoiseDarkColor() -> UIColor {
    return UIColor(hex: 0x00838f)
  }
  
  // MARK: - FIDELITY
  static func carrefourBlueColor() -> UIColor {
    return UIColor(hex: 0x49bef5)
  }
  
  static func carrefourTransparencyBlueColor() -> UIColor {
    return UIColor(transparencyWithHex: 0x49bef5)
  }
  
  static func carrefourRedColor() -> UIColor {
    return UIColor(hex: 0xf15145)
  }
  
  static func carrefourTransparencyRedColor() -> UIColor {
    return UIColor(transparencyWithHex: 0xf15145)
  }
  
  static func carrefourGreenColor() -> UIColor {
    return UIColor(hex: 0x24b84c)
  }
  
  static func carrefourTransparencyGreenColor() -> UIColor {
    return UIColor(transparencyWithHex: 0x24b84c)
  }
  
  static func carrefourGreenLightColor() -> UIColor {
    return UIColor(hex: 0x93d363)
  }
  
  static func carrefourGreenBisColor() -> UIColor {
    return UIColor(hex: 0x12934F)
  }
  
  // MARK: - RECIPE
  
  static func carrefourPurpleColor() -> UIColor {
    return UIColor(hex: 0x59003b)
  }
  
  static func carrefourTransparencyPurpleColor() -> UIColor {
    return UIColor(transparencyWithHex: 0x59003b, transparency: 0.7)
  }
  
  // MARK: - MEAL PLANNER
  
  
  static func carrefourPinkColor() -> UIColor {
    return UIColor(hex: 0xA8006F)
  }
  
  static func carrefourLightPinkColor() -> UIColor {
    return UIColor(hex: 0xD7008E)
  }
  
  static func carrefourLightGrayColor() -> UIColor {
    return UIColor(hex: 0xD6DBDF)
  }
  
  // MARK: - GRAY
  
  static func carrefourGrayDarkColor() -> UIColor {
    return UIColor(hex: 0x34495e)
  }
  
  static func carrefourGrayMainColor() -> UIColor {
    return UIColor(hex: 0x797c8a)
  }
  
  static func carrefourTransparencyGrayMainColor(_ transparency: CGFloat) -> UIColor {
    return UIColor(transparencyWithHex: 0x797c8a, transparency: transparency)
  }
  
  static func carrefourGrayBlueLight() -> UIColor {
    return UIColor(hex: 0xd6d7dc)
  }
  
  static func carrefourGrayLight() -> UIColor {
    return UIColor(hex: 0xeaeaea)
  }
  
  static func carrefourGrayExtraLight() -> UIColor {
    return UIColor(hex: 0xF9F9F9)
  }
  
  static func redErrorBrandColor() -> UIColor {
    return UIColor(hex: 0xFF0000)
  }
  
  static func carrefourLightblue() -> UIColor {
    return UIColor(hex: 0xF3F6FC)
  }
  
}
