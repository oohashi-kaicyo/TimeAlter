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
        self.backgroundColor = UIColor.red
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
