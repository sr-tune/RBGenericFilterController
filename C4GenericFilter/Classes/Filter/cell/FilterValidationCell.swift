//
//  FilterValidationCell.swift
//  Carrefour_FR_V2
//
//  Created by rboyer on 10/08/2016.
//

import UIKit
 protocol FilterValidatorDelegate {
  func validateSelections()
  func cancelFilterSelection()
  func reinitFilter()
}

class FilterValidationCell: FilterGenericCell {
  
  var btnValidator = UIButton()
  var btnCancel = UIButton()
  var btnReInit = UIButton()
  var delegate : FilterValidatorDelegate?
  
  
  override func configureWithType(_ type: FilterSpecializedCellType, theme: FilterTheme) {
    self.type = type
    self.selectionStyle = UITableViewCellSelectionStyle.none

    updateOutlets()
  }
  
  func updateOutlets() {
    func addValidorsButton() {
      btnValidator.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview(btnValidator)
      
      btnValidator.centerHorizontalyInSuperview()
      btnValidator.C4_ButtonBackgroundRounded("filtrer", color: UIColor.red)
      btnValidator.addTarget(self, action: #selector(self.pushOnValidateButton), for: .touchUpInside)
      
    }
    
    func addReinitButton() {
      btnReInit.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview(btnReInit)
      
      let attrsDictionary = [NSUnderlineStyleAttributeName: 1, NSFontAttributeName: UIFont.systemFont(ofSize: 17), NSForegroundColorAttributeName: UIColor.carrefourBlueCarrefourColor()] as [String : Any]
      let attrString = NSAttributedString(string: "Reinitialiser", attributes: attrsDictionary)
      btnReInit.setAttributedTitle(attrString, for: UIControlState())
      
      
      btnReInit.setTitleColor(UIColor.carrefourBlueColor(), for: UIControlState())
      btnReInit.addTarget(self, action: #selector(self.pushOnReinitButton), for: .touchUpInside)
      
      btnReInit.centerHorizontalyInSuperview()
    }
    
    func removeAllOutlets() {
      for view in contentView.subviews {
        view.removeFromSuperview()
      }
    }
    
    removeAllOutlets()
    addValidorsButton()
    addReinitButton()
    manageConstraintBetweenButtons()
    
  }
  
  func manageConstraintBetweenButtons() {
    contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[filterBtn]-10-[reinitBtn]-1-|",
                                                              options: NSLayoutFormatOptions.init(rawValue: 0),
                                                              metrics: nil,
                                                              views: ["filterBtn" : btnValidator,"reinitBtn" : btnReInit]))
  }
  
  func pushOnReinitButton() {
    delegate?.reinitFilter()
    delegate?.validateSelections()
  }
  
  func pushOnValidateButton() {
    delegate?.validateSelections()
  }
  
  func pushOnCancelButton() {
    delegate?.cancelFilterSelection()
  }
}
