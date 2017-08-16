//
//  FilterGenericTableViewModel.swift
//  Carrefour_FR_V2
//
//  Created by rboyer on 04/08/2016.
//  Copyright © 2016 Carrefour. All rights reserved.
//

import UIKit

public enum FilterSelectionType {
  case radio
  case multi
  case swwitch
}

public enum FilterSpecializedCellType {
  case custom(type : FilterSelectionType, values : [FilterSelectionableItem], title : String?)
  case validator
}

public

class FilterGenericTableViewModel: NSObject {
  var configFilter : [[FilterSpecializedCellType]]
  var arrayOfCellForFilter = [[FilterGenericCell]]()
  
  
  init(withConfig configOrder: [[FilterSpecializedCellType]]) {
    configFilter = configOrder
    super.init()
    
    loadCellsForFilter()
  }
  
  func loadCellsForFilter() {
    
    
    for groupedConfig in configFilter {
      var groupedArrayOfCell = [FilterGenericCell]()
      
      for (subindex,filter) in groupedConfig.enumerated() {
        switch filter {
          
        case .custom(let type, _, _):
          switch type {
          case .multi, .radio:
            groupedArrayOfCell.append(FilterMultipleChoiceTableViewCell())
            
          case .swwitch:
            groupedArrayOfCell.append(FilterBooleanTableViewCell())
          
          default:
            return
          }
          
          
        case .validator:
          groupedArrayOfCell.append(FilterValidationCell())
          
          
        default:
          return 
        }
        
        if subindex == groupedConfig.count-1 {
          arrayOfCellForFilter.append(groupedArrayOfCell)
        }
        
      }
    }
  }
  
}
