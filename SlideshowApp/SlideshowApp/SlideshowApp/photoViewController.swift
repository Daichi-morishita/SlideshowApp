//
//  photoViewController.swift
//  SlideshowApp
//
//  Created by 森下大地 on 2020/08/21.
//  Copyright © 2020 daichi.morishita. All rights reserved.
//

import UIKit

class photoViewController: UIViewController {

    
    let image1:UIImage = UIImage(named:"flowers-21708_1920.jpg")!
       let image2:UIImage = UIImage(named:"sea-2730871_1920.jpg")!
       let image3:UIImage = UIImage(named: "woman-5347089_1920.jpg")!
     
       var images: [UIImage] = []
    
    @IBOutlet weak var bigphoto: UIImageView!
    
     var selectedImage :UIImage!
    
     var x:Int = 0
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         images = [image1, image2, image3]

        
        bigphoto.image = self.selectedImage
        // Do any additional setup after loading the view.
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
