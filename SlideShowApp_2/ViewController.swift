//
//  ViewController.swift
//  SlideShowApp_2
//
//  Created by 秋山剛成 on 2021/03/02.
//

import UIKit

class ViewController: UIViewController {
    
    var img0 = UIImage(named:"image0.jpeg")!
    var img1 = UIImage(named:"image1.jpeg")!
    var img2 = UIImage(named:"image2.jpeg")!
    var num: Int = 0
    var button_num = 0
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    lazy var img_list = [self.img0, self.img1, self.img2]
    var timer_sec: Float = 0
    // タイマー
    var timer: Timer!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImage!
    
    lazy var bgImageWidth = image2.size.width
    lazy var bgImageHeight = image2.size.height
    lazy var scale = self.height / self.bgImageHeight
    @IBOutlet weak var segue_button: UIButton!
    
    @IBAction func button_change(_ sender: UIButton) {
        self.button_num = (self.button_num + 1) % 2
        if self.button_num == 0{
            sender.setTitle("再生", for: .normal)
            prev.isEnabled = true
            Next.isEnabled = true
        }
        else{
            sender.setTitle("停止", for: .normal)
            prev.isEnabled = false
            Next.isEnabled = false
        }
    }
    
    @IBAction func segue_stop(_ sender: UIButton) {
        if self.timer != nil {
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
        }
        if self.button_num != 0 {
            self.button.setTitle("再生", for: .normal)
            self.button_num = (self.button_num + 1) % 2
            prev.isEnabled = true
            Next.isEnabled = true
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        image1.image = self.img_list[self.num]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // segueから遷移先のResultViewControllerを取得する
    let resultViewController:ResultViewController = segue.destination as! ResultViewController
    // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
    resultViewController.image = image1.image
    }

    @IBOutlet weak var prev: UIButton!
    @IBAction func prev(_ sender: UIButton) {
        self.num = (self.num + 2) % 3
        if self.button_num == 0 {
            image1.image = self.img_list[self.num]
        }
    }
    @IBOutlet weak var Next: UIButton!
    @IBAction func Next(_ sender: UIButton) {
        self.num = (self.num + 1) % 3
        if self.button_num == 0 {
            image1.image = self.img_list[self.num]
        }
    }
    @IBOutlet weak var button: UIButton!
    
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 2
        self.num = (self.num + 1) % 3
        if self.button_num != 0 {
            image1.image = self.img_list[self.num]
        }
    }
    @IBAction func startTimer(_ sender: Any) {
        
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil && self.button_num % 2 != 0 {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }
    }
    @IBAction func pauseTimer(_ sender: Any) {
            
        if self.timer != nil && self.button_num % 2 == 0 {
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
        }
    }
}

