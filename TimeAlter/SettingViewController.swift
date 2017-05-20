//
//  SettingViewController.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/08.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
//
//  ViewController.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/01.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var hpdLabel: UILabel!
    @IBOutlet weak var hpdSlider: UISlider!
    @IBOutlet weak var darkThemeButton: UISwitch!
    @IBAction func didClickcameraRollButton(_ sender: Any) {
        let actionSheet = UIAlertController(title:"Image", message: "Select the image", preferredStyle: UIAlertControllerStyle.actionSheet)
        let actionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {action in
        })
        let actionNormal = UIAlertAction(title: "From Album", style: UIAlertActionStyle.default, handler: {action in
            self.pickImageFromLibrary()
        })
        actionSheet.addAction(actionCancel)
        actionSheet.addAction(actionNormal)
        self.present(actionSheet, animated: true, completion: nil)
    }
    @IBAction func didChangeDarkThemeButton(_ sender: Any) {
        if ( (sender as AnyObject).isOn ) {
            AnalogClock.conf.theme = .monokai
            return
        }
        AnalogClock.conf.theme = .white
    }
    @IBAction func didTapClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didChangeSlider(_ sender: UISlider) {
        let hpd: Int = Int(sender.value + 0.5)
        self.hpdLabel.text = "\(hpd)時間 / 日"
        AnalogClock.conf.hpd = hpd
        self.darkThemeButton.isOn = AnalogClock.conf.theme == .monokai ? true : false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let hpd = AnalogClock.conf.hpd
        self.hpdLabel.text   = "\(hpd)時間 / 日";
        self.hpdSlider.value = Float(hpd);
        self.darkThemeButton.isOn = AnalogClock.conf.theme == .monokai ? true : false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    func pickImageFromLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(controller, animated: true, completion: nil)
        }
    }
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        picker.dismiss(animated: true, completion: nil)
        if info[UIImagePickerControllerOriginalImage] != nil {
            // アップ用画像の一時保存
            let tookImage: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            var imagePath = NSHomeDirectory()
            imagePath = (imagePath as NSString).appendingPathComponent("Documents/upload.jpeg")
            let imageData: NSData = UIImageJPEGRepresentation(tookImage, 0.3)! as NSData
            
            let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            let documentDirectory = paths[0]
            let myFilePath = (documentDirectory as NSString).appendingPathComponent("lastimage")
            let isSuccess = imageData.write(toFile: myFilePath, atomically: true)
            if isSuccess {
                // 画像ファイルに対する処理
            }
        }
    }
}
