//
//  SearchParamOutputModel.swift
//  Carrefour_FR_V2
//
//  Created by rboyer on 08/09/2016.
//  Copyright © 2016 Carrefour. All rights reserved.
//

import UIKit


public class SearchParamOutputModel<U>: NSObject {
  
  var key : String
  var output : U
  
  
  init(withKey key: String, value: U) {
    self.key = key
    self.output = value
    super.init()
  }
  
  func descriptionMe() -> String {
    return "I'm a search param with key :\(key) and output: \(output)"
  }
}
