//
//  FilterCollectionViewCell.swift
//  Carrefour_FR_V2
//
//  Created by Lamine NDIAYE on 28/04/16.
//  Copyright © 2016 Carrefour. All rights reserved.
//

import UIKit
//import AlamofireImage


public protocol FilterSelectionableItem {
  var image: UIImage? { get }
  var textForLabel: String { get }
  var genericOutput: String { get }
  var idFilter: String { get }
  var selected : Bool { get }
}

public struct StaticSelectionableItem : FilterSelectionableItem {
  public var selected: Bool

  public var idFilter: String

  public var image: UIImage?
  public var textForLabel: String
  public var genericOutput: String
  
  public init(image: UIImage? = nil, text : String, output : String, idFilter: String, selected : Bool) {
    self.image = image
    self.textForLabel = text
    self.genericOutput = output
    self.idFilter = idFilter
    self.selected = selected
  }
}

class FilterCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet var mainView: UIView!
  @IBOutlet var imgView: UIImageView!
  @IBOutlet var checkSelectedImgView: UIImageView!
  @IBOutlet var lblName: UILabel!
  
  var item : FilterSelectionableItem?
  var theme : FilterTheme = DefaultThemeType()
  override func awakeFromNib() {
    super.awakeFromNib()
    checkSelectedImgView.isHidden = true
    
    mainView.layer.borderWidth = 1
    mainView.layer.borderColor = UIColor.gray.cgColor
  }
  
  func configureWith(item : FilterSelectionableItem, theme : FilterTheme) {
    self.item = item
    self.theme = theme
    
   // contentView.showGreenBorder()
    
    manageOutletVisibility()
    setupStyle()
  }
  
  func manageOutletVisibility() {
    if let imageItem = self.item?.image {
      imgView.image = imageItem
      lblName.isHidden = true
      imgView.isHidden = !lblName.isHidden
    } else {
      lblName.isHidden = false
      imgView.isHidden = !lblName.isHidden
      lblName.text = self.item?.textForLabel
    }
  }
  
  func setupStyle() {
    lblName.textColor = theme.color
    lblName.font = theme.font
  }
  
  
  override var isSelected: Bool {
    get {
      return super.isSelected
    }
    set {
      if newValue {
        super.isSelected = true
        mainView.layer.shadowOffset = CGSize(width: 0, height: 3)
        mainView.layer.shadowRadius = 2
        mainView.layer.shadowOpacity = 0.3
        mainView.layer.masksToBounds = false
        checkSelectedImgView.isHidden = false
      } else if newValue == false {
        super.isSelected = false
        mainView.layer.shadowOffset = CGSize(width: 0, height: 0)
        mainView.layer.masksToBounds = false
        mainView.layer.shadowRadius = 0
        mainView.layer.shadowOpacity = 0
        checkSelectedImgView.isHidden = true
      }
    }
  }
}

