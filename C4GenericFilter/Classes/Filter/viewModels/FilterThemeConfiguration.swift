//
//  FilterThemeConfiguration.swift
//  Carrefour_FR_V2
//
//  Created by rboyer on 19/05/2017.
//  Copyright © 2017 Carrefour. All rights reserved.
//

import Foundation

public protocol FilterTheme {
  var color: UIColor { get }
  var font: UIFont { get }
}


public struct DefaultThemeType : FilterTheme {
  public var font: UIFont {
    return UIFont.applicationBoldFontWithSize(17)
  }
  
  public var color: UIColor {
    return UIColor.carrefourGrayDarkColor()
  }
}
