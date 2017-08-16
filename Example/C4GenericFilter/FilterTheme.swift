//
//  FilterTheme.swift
//  C4GenericFilter
//
//  Created by rboyer on 11/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import C4GenericFilter


enum CarrefourContext : Int {
  case storeLocator
  case coupons
  case wishlist
  
  func theme() -> FilterTheme {
    
    switch self {
    case .coupons:
      return CouponsThemeType()
      
    case .storeLocator:
      return StoreThemeType()
      
    case .wishlist:
      return WishlistThemeType()
      
    }
  }
}

struct CatalogsThemeType : FilterTheme {
  var font: UIFont {
    return UIFont.systemFont(ofSize: 17)
  }
  
  var color: UIColor {
    return UIColor.green
  }
}

struct WishlistThemeType : FilterTheme {
  var font: UIFont {
    return UIFont.systemFont(ofSize: 17)
  }
  
  var color: UIColor {
    return UIColor.red
  }
}


struct CouponsThemeType : FilterTheme {
  var font: UIFont {
    return UIFont.systemFont(ofSize: 17)
  }
  
  var color: UIColor {
    return UIColor.orange
  }
}

struct StoreThemeType : FilterTheme {
  var font: UIFont {
    return UIFont.systemFont(ofSize: 17)
  }
  
  var color: UIColor {
    return UIColor.blue
  }
}
