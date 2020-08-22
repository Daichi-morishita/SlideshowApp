//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 森下大地 on 2020/08/21.
//  Copyright © 2020 daichi.morishita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slideshow: UIImageView!
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }    // タイマー
       var timer: Timer!

       // タイマー用の時間のための変数
       var timer_sec: Float = 0

    
    let image1:UIImage = UIImage(named:"flowers-21708_1920.jpg")!
       let image2:UIImage = UIImage(named:"sea-2730871_1920.jpg")!
       let image3:UIImage = UIImage(named: "woman-5347089_1920.jpg")!
     
       var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        images = [image1, image2, image3]
        
        slideshow.isUserInteractionEnabled = true
        
       }
    //タップ時の処理
    @IBAction func tap(_ sender: Any) {
        
        self.performSegue(withIdentifier: "NextSegue", sender: nil)
               
    }
    @objc  func tapped(_ sender: UITapGestureRecognizer){
        
        self.performSegue(withIdentifier: "NextSegue", sender: nil)
        
    }
    
    var index = 0
    
    var tappedImage :UIImage?
    
    //時間の経過とともに行う処理
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 2
        index += 1
        if index >= images.count{
            index = 0
        }
        slideshow.image = images[index]
        
    }
    
    
    
   
    //ボタン系
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func nextButton(_ sender: Any) {
        index += 1
        if index >= images.count{
            index = 0
        }
        slideshow.image = images[index]
    }
    
    @IBOutlet weak var backButton: UIButton!
    @IBAction func backButton(_ sender: Any) {
        index -= 1
        if index < 0{
            index = 2
        }
        slideshow.image = images[index]
    }
    
    
    @IBOutlet weak var startstopButton: UIButton!
    @IBAction func startstopButton(_ sender: Any) {
        
        if self.timer == nil {
             startstopButton.setTitle("停止", for: .normal)//再生ボタンの追加
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
            //ボタンの使用不可
            nextButton.isEnabled = false
            backButton.isEnabled = false
            
        }else{self.timer.invalidate()   // タイマーを停止する
            self.timer = nil
            startstopButton.setTitle("再生", for: .normal)//停止ボタン
            
            //ボタンの使用可能
            nextButton.isEnabled = true
            backButton.isEnabled = true
            

        }
    }
    
    
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // segueから遷移先のResultViewControllerを取得する
    if segue.identifier == "NextSegue"{
   let displayPhoto:photoViewController = segue.destination as! photoViewController
   // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        
        displayPhoto.selectedImage = self.slideshow.image!
    }
   
    
}
    
    
    
    
  
}
