//
//  HourHand.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/03.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
import UIKit

class HourHand: Hand {
    override init(width: Int) {
        super.init(width: width)
        drawRectangleOnImage(handColor: AnalogClock.conf.fgColor.cgColor, handWidth: 4, handLength: 100)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
