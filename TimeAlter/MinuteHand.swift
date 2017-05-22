//
//  MinuteHand.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/03.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
import UIKit

class MinuteHand: Hand {
    override init(width: Int) {
        super.init(width: width)
        self.handWidth  = 2
        self.handLength = 60
        changeHand(color: .black)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
