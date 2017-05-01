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
        NSLog("hpd: \(time.hpd)")
        NSLog("mph: \(Time.mph)")
        NSLog("spm: \(time.spm)")
        time.hpd = 24
        NSLog("hpd: \(time.hpd)")
        NSLog("mph: \(Time.mph)")
        NSLog("spm: \(time.spm)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
