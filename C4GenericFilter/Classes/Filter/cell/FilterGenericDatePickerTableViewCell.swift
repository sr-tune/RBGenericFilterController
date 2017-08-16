//
//  FilterGenericDatePickerTableViewCell.swift
//  Carrefour_FR_V2
//
//  Created by rboyer on 05/08/2016.
//  Copyright © 2016 Carrefour. All rights reserved.
//

import UIKit


class FilterGenericDatePickerTableViewCell: FilterGenericCell {
  
  var txtfield : UITextField?
  var outputParameter : SearchParamOutputModel<Any>?
  
  @IBOutlet weak var txtfieldDate: UITextField!
  var datePicker = UIDatePicker()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func configureWithType(_ type: FilterSpecializedCellType, theme: FilterTheme) {
    self.type = type
    
    updateOutlets()
  }
  
  func addLabel() {
    let label = UILabel()
    label.text = "ouvert le"

    
    contentView.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    
    label.alignLeftInSuperViewWithMarging(20)
    label.centerVerticallyInSuperview()
  }
  
  func updateOutlets() {
    removeAllOutlets()
    addLabel()
    addTextfield()
  }

  
  func addTextfield() {
    
    func customizeTxtfield(_ txtF: UITextField) {
      txtF.delegate = self
      txtF.translatesAutoresizingMaskIntoConstraints = false
      
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "dd MMM yyyy"
      txtF.text = dateFormatter.string(from: Date()) + "     📆"
      txtF.textAlignment = NSTextAlignment.right
    }
    
    func addConstraintOnTextField(_ txtF :UITextField) {
      txtF.centerVerticallyInSuperview()
      txtF.alignRightInSuperViewWithMarging(10)
      txtF.constraintForWidth(200)
    }
    
    let txtField = UITextField()
    customizeTxtfield(txtField)
    contentView.addSubview(txtField)
    addConstraintOnTextField(txtField)
    
    self.txtfield = txtField
  }
  
  
  override func selection() -> SearchParamOutputModel<Any>? {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMM yyyy"
    
    
    let dateSelected = dateFormatter.date(from: txtfield!.text!)
    
    if (dateSelected != nil) {
     // outputParameter = ["date_selected":txtfield!.text!]
      
     // outputParameter = SearchParamOutputModel.init(withKey: .dateSelected, key: dateSelected!)
      outputParameter = SearchParamOutputModel.init(withKey: "dateSelected", value: String(describing: dateSelected))
      return outputParameter
      
    }
    else {
      return nil
    }
    
  }
  
  override func reinit() {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMM yyyy"
    
    let dateReinitWithTodayDate = dateFormatter.string(from: Date())
    txtfield?.text = dateReinitWithTodayDate + "     📆"
    
   // outputParameter = ["date_selected": "-"]
    outputParameter = nil
  }

  
}

extension FilterGenericDatePickerTableViewCell : UITextFieldDelegate  {
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    
    let datePickerView:UIDatePicker = UIDatePicker()
    datePickerView.datePickerMode = UIDatePickerMode.date
    textField.inputView = datePickerView
    
    datePickerView.addTarget(self, action: #selector(self.datePickerValueChanged), for: UIControlEvents.valueChanged)
    
    datePicker = datePickerView
  }
  
  func datePickerValueChanged() {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMM yyyy"
    // let datePickerView = pickerView as! UIDatePicker
    txtfield!.text = dateFormatter.string(from: datePicker.date) + "     📆"
  }
  
}


