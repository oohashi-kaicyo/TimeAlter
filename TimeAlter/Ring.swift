//
//  Ring.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/21.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
import UIKit

class Ring: UIImageView {
    init(width: Int) {
        var width = width
        if width > Screen.width {
            width = Screen.width
        }
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: width))
        changeRingColor(color: .black)
    }
    convenience init() {
        self.init(width: Screen.width)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func changeRingColor(color: UIColor) {
        let size = self.frame.size
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(color.cgColor)
        context?.setFillColor(color.cgColor)
        let point: CGFloat = 20
        context?.setLineWidth(40)
        context?.addEllipse(in: CGRect(x: point, y: point, width: self.frame.size.width - point * 2, height: self.frame.size.height - point * 2))
        context?.drawPath(using: .stroke)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.image = newImage!
    }
}
