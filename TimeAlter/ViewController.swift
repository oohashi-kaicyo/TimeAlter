//
//  ViewController.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/01.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let time:Time = Time(hpd: 24);
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        timer.invalidate()
    }
    func update(tm: Timer) {
        updateHand(time: self.time)
    }
    /**
     * @brief 時計描画更新処理
     */
    func updateHand(time: Time) {
        func updateHourHand(hour: Int) {
            // 回転角度を計算
            // アニメーション
        }
        func updateMinuteHand(minute: Int) {
            // 回転角度を計算
            // アニメーション
        }
        func updateSecondHand(second: Int) {
            // 回転角度を計算
            // アニメーション
        }
        var hour: Int;
        var minute: Int;
        var second: Int;
        (hour, minute,second) = time.calcNowTime()
        print("\(hour):\(minute):\(second)")
        
    }
}
