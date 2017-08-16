//
//  FilterCollectionViewCellViewModel.swift
//  Carrefour_FR_V2
//
//  Created by rboyer on 23/09/2016.
//  Copyright © 2016 Carrefour. All rights reserved.
//

import UIKit

class FilterCollectionViewCellViewModel: NSObject {
  
  var type : FilterSpecializedCellType
  var keyWS : String
  var objectForWS : String
  
  init(withType type: FilterSpecializedCellType, keyWs : String, object : String ) {
    self.type = type
    self.objectForWS = object
    self.keyWS = keyWs
    
    super.init()
  }
}
