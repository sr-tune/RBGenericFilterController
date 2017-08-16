//
//  UIView+C4.swift
//  Carrefour_FR_V2
//
//  Created by rboyer on 04/04/2016.
//  Copyright © 2016 Carrefour. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  
  
  func alignTopInSuperViewWithMarging(_ margin: CGFloat) {
    
    self.translatesAutoresizingMaskIntoConstraints = false;
    
    self.superview?.addConstraint(NSLayoutConstraint (
      
      item: self,
      attribute: NSLayoutAttribute.top,
      relatedBy: NSLayoutRelation.equal,
      toItem: self.superview,
      attribute: NSLayoutAttribute.top,
      multiplier: 1,
      constant: margin))
    
  }
  
  
  func alignBottomInSuperViewWithMarging(_ margin: CGFloat) {
    
    self.translatesAutoresizingMaskIntoConstraints = false;
    
    self.superview?.addConstraint(NSLayoutConstraint (
      
      item: self,
      attribute: NSLayoutAttribute.bottom,
      relatedBy: NSLayoutRelation.equal,
      toItem: self.superview,
      attribute: NSLayoutAttribute.bottom,
      multiplier: 1,
      constant: -margin))
  }
  
  func constraintForHeight(_ height : CGFloat) {
    
    self.translatesAutoresizingMaskIntoConstraints = false;
    
    self.superview?.addConstraint(NSLayoutConstraint (
      
      item: self,
      attribute: NSLayoutAttribute.height,
      relatedBy: NSLayoutRelation.equal,
      toItem: nil,
      attribute: NSLayoutAttribute.notAnAttribute,
      multiplier: 1,
      constant: height))
  }
  
  func constraintForWidth(_ width : CGFloat) {
    
    self.translatesAutoresizingMaskIntoConstraints = false;
    
    self.superview?.addConstraint(NSLayoutConstraint (
      
      item: self,
      attribute: NSLayoutAttribute.width,
      relatedBy: NSLayoutRelation.equal,
      toItem: nil,
      attribute: NSLayoutAttribute.notAnAttribute,
      multiplier: 1,
      constant: width))
  }
  
  func alignLeftInSuperViewWithMarging(_ margin: CGFloat) {
    
    self.translatesAutoresizingMaskIntoConstraints = false;
    
    self.superview?.addConstraint(NSLayoutConstraint (
      
      item: self,
      attribute: NSLayoutAttribute.left,
      relatedBy: NSLayoutRelation.equal,
      toItem: self.superview,
      attribute: NSLayoutAttribute.left,
      multiplier: 1,
      constant: margin))
    
  }
  
  func alignRightInSuperViewWithMarging(_ margin: CGFloat) {
    
    self.translatesAutoresizingMaskIntoConstraints = false;
    
    self.superview?.addConstraint(NSLayoutConstraint (
      
      item: self,
      attribute: NSLayoutAttribute.right,
      relatedBy: NSLayoutRelation.equal,
      toItem: self.superview,
      attribute: NSLayoutAttribute.right,
      multiplier: 1,
      constant: -margin))
  }
  
  func alignBordersInSuperView() {
    alignRightInSuperViewWithMarging(0)
    alignLeftInSuperViewWithMarging(0)
    alignTopInSuperViewWithMarging(0)
    alignBottomInSuperViewWithMarging(0)
  }
  
  func alignBordersInSuperViewWithMargin(_ margin : CGFloat) {
    alignRightInSuperViewWithMarging(margin)
    alignLeftInSuperViewWithMarging(margin)
    alignTopInSuperViewWithMarging(margin)
    alignBottomInSuperViewWithMarging(margin)
  }
  
  func alignBordersInSuperView(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
    alignRightInSuperViewWithMarging(right)
    alignLeftInSuperViewWithMarging(left)
    alignTopInSuperViewWithMarging(top)
    alignBottomInSuperViewWithMarging(bottom)
  }
  
  
  func centerHorizontalyInSuperview() {
    
    self.translatesAutoresizingMaskIntoConstraints = false;
    
    self.superview?.addConstraint(NSLayoutConstraint (
      
      item: self,
      attribute: NSLayoutAttribute.centerX,
      relatedBy: NSLayoutRelation.equal,
      toItem: self.superview,
      attribute: NSLayoutAttribute.centerX,
      multiplier: 1,
      constant: 0))

  }
  
  func centerVerticallyInSuperview() {
    self.translatesAutoresizingMaskIntoConstraints = false;
    
    self.superview?.addConstraint(NSLayoutConstraint (
      
      item: self,
      attribute: NSLayoutAttribute.centerY,
      relatedBy: NSLayoutRelation.equal,
      toItem: self.superview,
      attribute: NSLayoutAttribute.centerY,
      multiplier: 1,
      constant: 0))

  }
  
  func setEqualWidthToSuperview(multiplier: CGFloat) -> NSLayoutConstraint {
    
    let constraint = NSLayoutConstraint(
      item: self,
      attribute: .width,
      relatedBy: .equal,
      toItem: superview,
      attribute: .width,
      multiplier: multiplier,
      constant: 0)
    
    self.superview?.addConstraint(constraint)
    
    return constraint
  }
  
  func setEqualHeightToSuperview(multiplier: CGFloat) -> NSLayoutConstraint {
    
    let constraint = NSLayoutConstraint(
      item: self,
      attribute: .height,
      relatedBy: .equal,
      toItem: superview,
      attribute: .height,
      multiplier: multiplier,
      constant: 0)
    
    self.superview?.addConstraint(constraint)
    
    return constraint
  }
  
  
  /*  Border color for layout   */
  
  func showBlueBorder() {
    
    self.layer.borderColor = UIColor.blue.cgColor
    self.layer.borderWidth = 1.0

  }
  
  func showRedBorder() {
    
    self.layer.borderColor = UIColor.red.cgColor
    self.layer.borderWidth = 1.0

  }
  
  func showYellowBorder() {
    
    self.layer.borderColor = UIColor.yellow.cgColor
    self.layer.borderWidth = 1.0

  }
  
  func showWhiteBorder() {
    
    self.layer.borderColor = UIColor.white.cgColor
    self.layer.borderWidth = 1.0

  }
  
  func showGreenBorder() {
    
    self.layer.borderColor = UIColor.green.cgColor
    self.layer.borderWidth = 1.0

  }
  
  func showPurpulBorder() {
    
    self.layer.borderColor = UIColor.purple.cgColor
    self.layer.borderWidth = 1.0

  }
  
  func showGrayBorder() {
    
    self.layer.borderColor = UIColor.carrefourGrayLight().cgColor
    self.layer.borderWidth = 1.0

  }
  
  func showMainGrayBorder() {
    
    self.layer.borderColor = UIColor.carrefourGrayMainColor().cgColor
    self.layer.borderWidth = 1.0

  }
  
  func showCarrefourOrangeBorder() {
    
    self.layer.borderColor = UIColor.carrefourOrangeColor().cgColor
    self.layer.borderWidth = 1.0

  }
  
  func showShadow() {
    self.layer.shadowOffset = CGSize.zero
    self.layer.shadowOpacity = 0.2
    
  }

}

public extension UIView {
  public class func fromNib(nibNameOrNil: String? = nil) -> Self {
    return fromNib(nibNameOrNil: nibNameOrNil, type: self)
  }
  
  public class func fromNib<T : UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T {
    let v: T? = fromNib(nibNameOrNil: nibNameOrNil, type: T.self)
    return v!
  }
  
  public class func fromNib<T : UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T? {
    var view: T?
    let name: String
    if let nibName = nibNameOrNil {
      name = nibName
    } else {
      // Most nibs are demangled by practice, if not, just declare string explicitly
      name = nibName
    }
    let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
    for v in nibViews! {
      if let tog = v as? T {
        view = tog
      }
    }
    return view
  }
  
  public class var nibName: String {
    let name =  "\(self)".components(separatedBy: ".").first ?? ""
    return name
  }
  public class var nib: UINib? {
    if let _ = Bundle.main.path(forResource: nibName, ofType: "nib") {
      return UINib(nibName: nibName, bundle: nil)
    } else {
      return nil
    }
  }
}




