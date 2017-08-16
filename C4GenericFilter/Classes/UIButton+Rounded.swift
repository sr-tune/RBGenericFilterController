//
//  UIIButton+Rounded.swift
//  Carrefour_FR_V2
//
//  Created by rboyer on 15/04/2016.
//

import UIKit

@IBDesignable
class UIButton_Rounded : UIButton {
  
  var backgroundLayer: CAShapeLayer!
  @IBInspectable var backgroundLayerColor: UIColor = UIColor.gray {
    didSet { setNeedsDisplay() }
  }
  @IBInspectable var lineWidth: CGFloat = 1.0 {
    didSet { setNeedsDisplay() }
  }
  @IBInspectable var buttonWidth : CGFloat = 50 {
    didSet { setNeedsDisplay() }
  }
  @IBInspectable var frameCustom : CGRect = CGRect(x: 0, y: 0, width: 50, height: 50) {
    didSet { setNeedsDisplay() }
  }
  
  var imageLayer: CALayer!
  @IBInspectable var image: UIImage?
  
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setFrameCustom()
    setBackgroundLayer()
    setBackgroundImageLayer()
    setImage()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    setBackgroundLayer()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setBackgroundLayer()
  }
  
  func setBackgroundLayer() {
    
    backgroundLayer = CAShapeLayer()
    layer.addSublayer(backgroundLayer)
    let rect = bounds.insetBy(dx: lineWidth / 2.0, dy: lineWidth / 2.0)
    let path = UIBezierPath(ovalIn: rect)
    backgroundLayer.path = path.cgPath
    
    backgroundLayer.lineWidth = lineWidth
    backgroundLayer.fillColor = backgroundLayerColor.cgColor
    backgroundLayer.frame = CGRect(x: layer.bounds.origin.x, y: layer.bounds.origin.y, width: layer.bounds.size.width, height: layer.bounds.size.width)
  }
  
  
  func setBackgroundImageLayer() {
    
    let mask = CAShapeLayer()
    let dx = lineWidth + 3.0
    let path = UIBezierPath(ovalIn: self.bounds.insetBy(dx: dx, dy: dx))
    mask.fillColor = UIColor.black.cgColor
    mask.path = path.cgPath
    mask.frame = self.bounds
    layer.addSublayer(mask)
    imageLayer = CAShapeLayer()
    imageLayer.frame = self.bounds
    imageLayer.mask = mask
    imageLayer.contentsGravity = kCAGravityResizeAspectFill
    layer.addSublayer(imageLayer)
  }
  
  func setImage() {
    if let pic = image {
      imageLayer.contents = pic.cgImage
    }
  }
  
  func setFrameCustom() {
    self.frame = frameCustom
  }
    
}
