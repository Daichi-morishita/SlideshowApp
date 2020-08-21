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
    
    let image1:UIImage = UIImage(named:"flowers-21708_1920.jpg")!
       let image2:UIImage = UIImage(named:"sea-2730871_1920.jpg")!
       let image3:UIImage = UIImage(named: "woman-5347089_1920.jpg")!
     
       var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        images = [image1, image2, image3]
        
    }
    
    
    
    var index = 0
    
    @IBAction func nextButton(_ sender: Any) {
        index += 1
        if index >= images.count{
            index = 0
        }
        slideshow.image = images[index]
    }
    
    @IBAction func backButton(_ sender: Any) {
        index -= 1
        if index < 0{
            index = 2
        }
        slideshow.image = images[index]
    }
    
}

