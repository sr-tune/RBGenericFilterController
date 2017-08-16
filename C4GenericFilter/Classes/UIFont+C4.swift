//
//  UIFont+C4.swift
//  Carrefour_FR_V2
//
//  Created by Lamine NDIAYE on 01/04/16.
//

import Foundation
import UIKit

enum TyposType {
  
  case xxtra
  case xtra
  case bigger
  case big
  case medium
  case small
  case tiny
  
  
  func sizeForStandardiPhone() -> CGFloat {
    switch self {
    case .xxtra:
      return 40

    case .xtra:
      return 32

    case .bigger:
      return 21
      
    case .big:
      return 16
      
    case .medium:
      return 13
      
    case .small:
      return 11
      
    case .tiny:
      return 9
    }
  }
  
  func sizeForiPhone6() -> CGFloat {
    switch self {
    case .xxtra:
      return 44
      
    case .xtra:
      return 35
      
    case .bigger:
      return 23
      
    case .big:
      return 18
      
    case .medium:
      return 14
      
    case .small:
      return 12
      
    case .tiny:
      return 10
    }
  }
  
  func sizeForiPhone6Plus() -> CGFloat {
    switch self {
    case .xxtra:
      return 48
      
    case .xtra:
      return 38
      
    case .bigger:
      return 25
      
    case .big:
      return 19
      
    case .medium:
      return 15
      
    case .small:
      return 13
      
    case .tiny:
      return 11
    }
  }
  
}

extension UIFont {
  
  static func applicationFontWithSize(_ size: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size)
  }
  
  static func applicationBoldFontWithSize(_ size: CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: size)
  }
  
  
//  class func carrefourRobotoRegular(_ size: TyposType) -> UIFont {
//    return UIFont(name: "Roboto-Regular", size: sizeForIphone(size))!
//  }
//  
//  class func carrefourRobotoBold(_ size: TyposType) -> UIFont {
//    return UIFont(name: "Roboto-Bold", size: sizeForIphone(size))!
//  }
//  
//  class func carrefourRobotoMedium(_ size: TyposType) -> UIFont {
//    return UIFont(name: "Roboto-Medium", size: sizeForIphone(size))!
//  }
//  
//  class func carrefourRobotoBlack(_ size: TyposType) -> UIFont {
//    return UIFont(name: "Roboto-Black", size: sizeForIphone(size))!
//  }
//  
////  class func carrefourCaveat() -> UIFont {
////    
////    if !(DeviceType.IS_IPHONE_4_OR_LESS || DeviceType.IS_IPHONE_5) {
////      return UIFont(name: "Caveat", size: 19)!
////    } else {
////      return UIFont(name: "Caveat", size: 17)!
////    }
////  }
////  
////  class func carrefourCaveatWithSize(_ size: TyposType) -> UIFont {
////      return UIFont(name: "Caveat", size: sizeForIphone(size))!
////  }
////  
//  class func sizeForIphone(_ size: TyposType) -> CGFloat {
//    if DeviceType.IS_IPHONE_6P {
//      return size.sizeForiPhone6Plus()
//    } else if DeviceType.IS_IPHONE_6 {
//      return size.sizeForiPhone6()
//    } else {
//      return size.sizeForStandardiPhone()
//    }
//  }
  
}
