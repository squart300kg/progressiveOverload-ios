//
//  UIView+Extension.swift
//  overload
//
//  Created by SangYun Song on 2022/02/13.
//

import UIKit

extension UIView {
    
  func addDashedBorder() {
      let shapeLayer:CAShapeLayer = CAShapeLayer()

      let frameSize = self.frame.size
      let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

      shapeLayer.bounds = shapeRect
      shapeLayer.name = "DashBorder"
      shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
      shapeLayer.fillColor = UIColor.clear.cgColor
      shapeLayer.strokeColor = UIColor.black.cgColor
      shapeLayer.lineWidth = 1.5
      shapeLayer.lineJoin = .round
      shapeLayer.lineDashPattern = [2,4]
      shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 10).cgPath

      self.layer.masksToBounds = false

      self.layer.addSublayer(shapeLayer)
    }
}
