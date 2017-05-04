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
     * @brief時計の針を進めるクラス
     */
    func routate(angle: CGFloat) {
        self.transform = CGAffineTransform.identity;
        self.transform = self.transform.rotated(by: angle)
    }
}
