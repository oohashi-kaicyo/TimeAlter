//
//  SecondHand.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/03.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
import UIKit

class SecondHand: Hand {
    override init(width: Int) {
        super.init(width: width)
        self.image = drawRectangleOnImage()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func drawRectangleOnImage() -> UIImage {
        let size = self.frame.size
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineWidth(1)
        context?.setAllowsAntialiasing(false)
        context?.move(to: CGPoint(x: size.width / 2, y: 40))
        context?.addLine(to: CGPoint(x: size.width / 2, y: size.width / 2))
        context?.closePath()
        context?.drawPath(using: .stroke)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
