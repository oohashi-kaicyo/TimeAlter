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
    let clock: AnalogClock = AnalogClock()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(clock)
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
        let en: Int = 360
        func updateHourHand(hour: Int) {
            let hourHandAngle: Int   = en / time.hpd * hour
            print("hourHandAngle: \(hourHandAngle)");
            // アニメーション
        }
        func updateMinuteHand(minute: Int) {
            let minuteHandAngle: Int = en / time.mph * minute
            print("minuteHandAngle: \(minuteHandAngle)");
            // アニメーション
        }
        func updateSecondHand(second: Int) {
            let secondHandAngle: Int = en / time.spm * second
            print("secondHandAngle: \(secondHandAngle)");
            // アニメーション
        }
        var hour:   Int;
        var minute: Int;
        var second: Int;
        (hour, minute,second) = time.calcNowTime()
        print("\(hour):\(minute):\(second)")
        updateHourHand(hour: hour);
        updateMinuteHand(minute: minute)
        updateSecondHand(second: second)
        LOG("\(Screen.width):\(Screen.height)")
    }
}
