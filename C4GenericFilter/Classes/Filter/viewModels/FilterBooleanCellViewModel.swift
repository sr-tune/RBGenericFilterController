//
//  FilterOneChoiceCellViewModel.swift
//  Carrefour_FR_V2
//
//  Created by rboyer on 04/08/2016.
//  Copyright © 2016 Carrefour. All rights reserved.
//

import UIKit

struct FilterBooleanCellViewModel {  // BooleanCell
  
  var idFilter : String
  var output : String
  var text : String
  var selected : Bool = false
  
  
  init(value: FilterSelectionableItem) {
    self.text = value.textForLabel
    self.idFilter = value.idFilter
    self.selected = value.selected
    self.output = value.genericOutput
  }
  
}
