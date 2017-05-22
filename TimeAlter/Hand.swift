//
//  Hand.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/03.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
import UIKit

class Hand: UIImageView {
    var handLength: CGFloat = 0
    var handWidth:  CGFloat = 0
    init(width: Int) {
        var width = width
        if width > Screen.width {
            width = Screen.width
        }
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: width))
    }
    convenience init() {
        self.init(width: Screen.width)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
     * @brief時計の針を進めるメソッド
     */
    func routate(angle: CGFloat) {
        self.transform = CGAffineTransform.identity;
        self.transform = self.transform.rotated(by: angle)
    }
    func drawRectangleOnImage(handColor: CGColor, handWidth: CGFloat, handLength: CGFloat) {
        let size = self.frame.size
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(handColor)
        context?.setLineWidth(handWidth)
        context?.setAllowsAntialiasing(false)
        context?.move(to: CGPoint(x: size.width / 2, y: handLength))
        context?.addLine(to: CGPoint(x: size.width / 2, y: size.width / 2))
        context?.closePath()
        context?.drawPath(using: .stroke)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.image = newImage!
    }
    func changeHand(color: UIColor) {
        drawRectangleOnImage(handColor: color.cgColor, handWidth: self.handWidth, handLength: self.handLength)
    }
}
