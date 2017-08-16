//
//  FilterGenericCellTableViewCell.swift
//  Carrefour_FR_V2
//
//  Created by rboyer on 09/08/2016.
//

import UIKit

protocol FilterGenericProtocolDelegate {
  func configureWithType(_ type: FilterSpecializedCellType, theme : FilterTheme)
  func selection() -> SearchParamOutputModel<Any>?
  func reinit()
}

protocol FilterCellReloadDelegate {
  func reloadFullFilter()
  func reloadCell()
}

class FilterGenericCell: UITableViewCell, FilterGenericProtocolDelegate {
  func configureWithType(_ type: FilterSpecializedCellType, theme: FilterTheme) {
    // to override
  }
  
  var type = FilterSpecializedCellType.validator
  
  func removeAllOutlets() {
    for view in contentView.subviews {
      view.removeFromSuperview()
    }
  }
  
  func selection() -> SearchParamOutputModel<Any>? {
    // to override
    return nil
  }
  
  func reinit() {
    // to override
  }
  
  func cancel() {
    // to override
  }
  
}
