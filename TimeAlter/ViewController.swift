//
//  ViewController.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/01.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let time:Time = Time(hpd: 26);
        var hour: Int;
        var minute: Int;
        var second: Int;
        (hour, minute, second) = time.calcNowTime()
        NSLog("nowTime is \(hour):\(minute):\(second)");
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
