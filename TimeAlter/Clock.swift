//
//  Clock.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/03.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
import UIKit

/**
 * @brief アナログ時計を表現するクラス
 */
class AnalogClock: UIView {
    public var testView: UIView
    override init(frame: CGRect) {
        testView = UIView(frame: frame)
        // superViewよりも前でプロパティを初期化するのはなぜか
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
