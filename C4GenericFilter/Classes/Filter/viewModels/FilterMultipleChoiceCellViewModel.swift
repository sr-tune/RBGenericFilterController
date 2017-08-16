//
//  FilterMultipleChoiceCellViewModel.swift
//  Carrefour_FR_V2
//
//  Created by rboyer on 03/08/2016.
//  Copyright © 2016 Carrefour. All rights reserved.
//

import UIKit

public protocol FilterCell {
  static func idFilter() -> String
  static func title() -> String //TODO: optionnel
}

public protocol MultipleItemProtocol : FilterCell, Equatable {
  static func allValues(_ completionHandler: @escaping ([FilterSelectionableItem], NSError?) -> Void)
}


class FilterMultipleChoiceCellViewModel: NSObject {
  var title: String?
  var idFilter : String
  var items : [FilterSelectionableItem] = []

  init<T: MultipleItemProtocol>(withConfig config: T.Type, completionHandler: @escaping ([FilterSelectionableItem], NSError?) -> Void) {
    idFilter = "mangeur de banane"

    super.init()
    
    title = config.title()
    config.allValues { (itemsResult, error) in
      if error == nil {
        self.items = itemsResult
      }
      
      completionHandler(self.items, error)
    }
  }
  
  init(injectedValues : [FilterSelectionableItem], title : String?) {
    guard injectedValues.count > 0 else {
      self.idFilter = "error"
      return
    }
    
    self.idFilter = injectedValues[0].idFilter
    self.title = title
    self.items = injectedValues
  }
  
}


