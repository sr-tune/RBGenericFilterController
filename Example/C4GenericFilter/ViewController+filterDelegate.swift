//
//  ViewController+filterDelegate.swift
//  C4GenericFilter
//
//  Created by rboyer on 09/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import C4GenericFilter

extension ViewController : FilterGenericTableViewDelegate {
  
  func filterAdded(_ filterParams : NSDictionary) {
    print(filterParams)
  }
  
  func filterDidCancel() {
    
  }
}
