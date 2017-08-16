//
//  FilterOneChoiceTableViewCell.swift
//  Carrefour_FR_V2
//
//  Created by rboyer on 03/08/2016.
//

import UIKit


class FilterBooleanTableViewCell: FilterGenericCell {
  
  var viewModel : FilterBooleanCellViewModel?
  var outputParameter : SearchParamOutputModel<Any>?
  
  var switchBtn = UISwitch()
  var label = UILabel()
  // var autoSelected = false
  
  var firstInit = true
  
  var previousSelectionChoice : Bool = false
  var theme : FilterTheme = DefaultThemeType()
  
  
  override func configureWithType(_ type: FilterSpecializedCellType, theme: FilterTheme) {
    self.type = type
    self.theme = theme
    
    
    
    self.selectionStyle = UITableViewCellSelectionStyle.none
    
    switch type {
    case .custom(.swwitch, let valuE, _):
      guard let valueSafe = valuE.first else {
        return
      }
      
      self.viewModel = FilterBooleanCellViewModel.init(value: valueSafe)
      // autoSelected = (viewModel?.selected)!
      
      if firstInit {
        previousSelectionChoice = (viewModel?.selected)!
      }
      
      updateOutlets()
    default:
      updateOutlets()
      return
    }
    
  }
  
  func changeValue() {
    viewModel?.selected = switchBtn.isOn
  }
  
  func updateOutlets() {
    removeAllOutlets()
    addSwitch()
    addLabel()
  }
  
  func addSwitch() {
    switchBtn.addTarget(self, action: #selector(self.changeValue), for: UIControlEvents.valueChanged)
    
    switchBtn.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(switchBtn)
    
    
    switchBtn.setOn(previousSelectionChoice, animated: false)
    changeValue()
    
    switchBtn.onTintColor = self.theme.color
    
    
    switchBtn.alignRightInSuperViewWithMarging(30)
    switchBtn.centerVerticallyInSuperview()
  }
  
  func addLabel() {
    label.text = viewModel?.text
    
    label.translatesAutoresizingMaskIntoConstraints = false
    
    contentView.addSubview(label)
    label.textAlignment = NSTextAlignment.left
    label.textColor = self.theme.color
    label.alignLeftInSuperViewWithMarging(30)
    label.constraintForWidth(200)
    label.centerVerticallyInSuperview()
  }
  
  override func selection() -> SearchParamOutputModel<Any>? {
    
    saveUISelection()
    firstInit = false
    
    outputParameter = SearchParamOutputModel.init(withKey: (viewModel?.idFilter)!, value: (viewModel?.selected)!)
    
    return outputParameter
  }
  
  func saveUISelection() {
    previousSelectionChoice = switchBtn.isOn
  }
  
  override func reinit() {
    outputParameter = nil
    switchBtn.setOn(false, animated: true)
    changeValue()
  }
  
  
}
