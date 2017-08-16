//
//  UIButton+C4.swift
//  Carrefour_FR_V2
//
//  Created by Lamine NDIAYE on 05/04/16.
//  Copyright © 2016 Carrefour. All rights reserved.
//

import Foundation
import UIKit

let CTAPrincipalHeight: CGFloat = 34
let CTAPrincipalBigHeight: CGFloat = 50
let CTAPrincipalWidth: CGFloat = 194

extension UIButton {
  
  func setWidth(_ width: CGFloat) {
    frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: width, height: width)
  }
  
  func C4_ButtonRound(_ color : UIColor, imageCustom: UIImage?, width:CGFloat) {
    
    layer.cornerRadius = width/2
    backgroundColor = color
    setWidth(width)
    imageView?.contentMode = .scaleAspectFit
    
    layer.shadowOffset = CGSize(width: 0, height: 2)
    layer.shadowRadius = 2
    layer.shadowOpacity = 0.2
    
    imageView?.alignBordersInSuperViewWithMargin(width * 5/100)
    
    if let imgCustom = imageCustom {
      setImage(imgCustom, for: UIControlState())
    }
  }
  
  func setHeight(_ height: CGFloat) {
    self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: height)
  }
  
  func C4_ButtonBackgroundRounded(_ title: String?, color: UIColor) {
    
    titleLabel?.font = UIFont.systemFont(ofSize: 17)
    titleLabel?.text =  title?.uppercased()
    setTitle(title?.uppercased(), for: UIControlState())
    titleLabel?.textColor = UIColor.white
    backgroundColor = color
    layer.cornerRadius = CTAPrincipalHeight/2
    
    let instrinsicWidth = titleLabel!.intrinsicContentSize.width
    
    translatesAutoresizingMaskIntoConstraints = false
    
    self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(25)-[titleLabel(labelwidth)]-(25)-|",
                                                       options: NSLayoutFormatOptions(rawValue: 0),
                                                       metrics: ["labelwidth": instrinsicWidth],
                                                       views: ["titleLabel" : titleLabel!]))
    
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[titleLabel(labelHeight)]|",
                                                  options: NSLayoutFormatOptions(rawValue: 0),
                                                  metrics: ["labelHeight": CTAPrincipalHeight],
                                                  views: ["titleLabel": titleLabel!]))
  }
  
  func C4_ButtonBackgroundRoundedBig(_ title: String?, color: UIColor) {
    
    titleLabel?.font = UIFont.systemFont(ofSize: 17)
    titleLabel?.text =  title?.uppercased()
    setTitle(title?.uppercased(), for: UIControlState())
    titleLabel?.textColor = UIColor.white
    backgroundColor = color
    layer.cornerRadius = CTAPrincipalBigHeight/2
    
    let instrinsicWidth = titleLabel!.intrinsicContentSize.width
    
    translatesAutoresizingMaskIntoConstraints = false
    
    self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(25)-[titleLabel(labelwidth)]-(25)-|",
                                                       options: NSLayoutFormatOptions(rawValue: 0),
                                                       metrics: ["labelwidth": instrinsicWidth],
                                                       views: ["titleLabel" : titleLabel!]))
    
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[titleLabel(labelHeight)]|",
                                                  options: NSLayoutFormatOptions(rawValue: 0),
                                                  metrics: ["labelHeight": CTAPrincipalBigHeight],
                                                  views: ["titleLabel": titleLabel!]))
  }
  
  func C4_ButtonBackgroundRounded(title: String?, color: UIColor) -> UIButton {
    
    titleLabel?.font = UIFont.systemFont(ofSize: 17)
    titleLabel?.text =  title?.uppercased()
    setTitle(title?.uppercased(), for: UIControlState())
    titleLabel?.textColor = UIColor.white
    backgroundColor = color
    layer.cornerRadius = CTAPrincipalHeight/2
    
    let instrinsicWidth = titleLabel!.intrinsicContentSize.width
    
    translatesAutoresizingMaskIntoConstraints = false
    
    self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(25)-[titleLabel(labelwidth)]-(25)-|",
                                                       options: NSLayoutFormatOptions(rawValue: 0),
                                                       metrics: ["labelwidth": instrinsicWidth],
                                                       views: ["titleLabel" : titleLabel!]))
    
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[titleLabel(labelHeight)]|",
                                                  options: NSLayoutFormatOptions(rawValue: 0),
                                                  metrics: ["labelHeight": CTAPrincipalHeight],
                                                  views: ["titleLabel": titleLabel!]))
    
    return self
  }
  
  func C4_FloatingButton(_ title : String, color : UIColor) {
    
    self.titleLabel!.font = UIFont.systemFont(ofSize: 17)
    self.setTitle(title.uppercased(), for: UIControlState())
    self.setTitleColor(.white, for: UIControlState())
    self.backgroundColor = color
    
    self.translatesAutoresizingMaskIntoConstraints = false
    self.alignLeftInSuperViewWithMarging(0)
    self.alignRightInSuperViewWithMarging(0)
    self.alignBottomInSuperViewWithMarging(0)
    self.constraintForHeight(60)
  }
  
  func C4_ButtonRounded(_ title : String, color : UIColor) {
    
    self.titleLabel!.font = UIFont.systemFont(ofSize: 17)
    titleLabel?.text =  title.uppercased()
    self.setTitle(title.uppercased(), for: UIControlState())
    self.setTitleColor(color, for: UIControlState())
    self.backgroundColor = UIColor.clear
    layer.cornerRadius = CTAPrincipalHeight/2
    self.layer.borderColor = color.cgColor
    self.layer.borderWidth = 1.0
    
    let instrinsicWidth = self.titleLabel?.intrinsicContentSize.width
    
    self.translatesAutoresizingMaskIntoConstraints = false

    self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(25)-[titleLabel(labelwidth)]-(25)-|",
                                                       options: NSLayoutFormatOptions.init(rawValue: 0),
                                                       metrics: ["labelwidth": instrinsicWidth!],
                                                       views: ["titleLabel" : self.titleLabel!]))
    
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[titleLabel(labelHeight)]|",
                                                  options: NSLayoutFormatOptions(rawValue: 0),
                                                  metrics: ["labelHeight": CTAPrincipalHeight],
                                                  views: ["titleLabel": titleLabel!]))
  }
  
  func C4_ButtonBackgroundRoundedWithImageAndTitle(_ title: String, color: UIColor, image: UIImage) {
    
    titleLabel?.removeFromSuperview()
    backgroundColor = color
    layer.cornerRadius = 25
    
    let imageV = UIImageView.init()
    imageV.image = image
    imageV.translatesAutoresizingMaskIntoConstraints = false
    
    let titleLab = UILabel()
    titleLab.font = UIFont.systemFont(ofSize: 17)
    
    titleLab.text = title.uppercased()
    titleLab.textColor = UIColor.white
    
    titleLab.translatesAutoresizingMaskIntoConstraints = false
    
    addSubview(titleLab)
    addSubview(imageV)
    
    let instrinsicWidth = titleLab.intrinsicContentSize.width
    
    translatesAutoresizingMaskIntoConstraints = false
    needsUpdateConstraints()
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(25)-[titleLabel(labelwidth)]-20-[img(40)]-(25)-|",
                                                  options: NSLayoutFormatOptions(rawValue: 0),
                                                  metrics: ["labelwidth": instrinsicWidth],
                                                  views: ["titleLabel" : titleLab, "img" : imageV]))
    
    
    
    titleLab.centerVerticallyInSuperview()
    constraintForHeight(50)
    constraintForWidth(instrinsicWidth + 50 + 40 + 20)
    
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[img(40)]-5-|",
                                                  options: NSLayoutFormatOptions(rawValue: 0),
                                                  metrics: nil,
                                                  views: ["img" : imageV]))
  }
  
  func enableButton(_ enable: Bool, color: UIColor? = nil) {
    isEnabled = enable
    if let color = color {
      backgroundColor = color
    } else {
      backgroundColor = UIColor.carrefourGrayLight()
    }
  }

  func C4_PastilleWall(_ s: String) {
    layer.cornerRadius = frame.height/2
    backgroundColor = .carrefourRedColor()
    setTitle(s, for: UIControlState())
    setTitleColor(.white, for: UIControlState())
    titleLabel?.font = UIFont.systemFont(ofSize: 17)
    
    var width = frame.height
    let nbChar: Int = s.characters.count
    if nbChar >= 2 {
      width += CGFloat(10*(nbChar-2))
    }
    constraintForWidth(width)
    
  }
  
}
