//
//  ResultViewController.swift
//  SlideShowApp_2
//
//  Created by 秋山剛成 on 2021/03/02.
//

import UIKit

class ResultViewController: UIViewController {

    var img0 = UIImage(named:"image0.jpeg")!
        
    var img1 = UIImage(named:"image1.jpeg")!
        
    var img2 = UIImage(named:"image2.jpeg")!
        
    lazy var img_list = [self.img0, self.img1, self.img2]
        
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImage!

    // 受け取るためのプロパティ（変数）を宣言しておく
    @IBOutlet weak var image: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        image1.image = image
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
