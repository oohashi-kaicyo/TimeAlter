//
//  Numeral.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/04.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
import UIKit

/**
 * @breif 文字盤の数値ひとつを表現するクラス
 */
class Numeral: UIView {
    let numeralLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 30));
    init(width: Int, hpd: Int, numeral: Int, fontColor: UIColor) {
        var width = width
        if width > Screen.width {
            width = Screen.width
        }
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: width))
        func numeralLabelInit(fontColor: UIColor) {
            self.numeralLabel.text = String(numeral)
            self.numeralLabel.textAlignment = .center
            self.numeralLabel.font = UIFont(name: "KohinoorTelugu-Light", size: 32)
            self.numeralLabel.textColor = fontColor
            self.numeralLabel.center = CGPoint(x: width / 2, y: 20)
            self.addSubview(self.numeralLabel)
            let en: Double = 360.0
            let angle:Double = (en / Double(hpd)) * Double(numeral)
            self.transform = self.transform.rotated(by: CGFloat((angle * .pi) / 180.0))
            self.numeralLabel.transform = self.numeralLabel.transform.rotated(by: -(CGFloat((angle * .pi) / 180.0)))
        }
        numeralLabelInit(fontColor: fontColor);
    }
    convenience init(hpd: Int, numeral: Int) {
        self.init(width: Screen.width, hpd: hpd, numeral: numeral, fontColor: .black)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
