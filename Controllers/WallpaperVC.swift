//
//  WallpaperVC.swift
//  Quotes in History
//
//  Created by Samyak Pawar on 27/09/20.
//

import UIKit

class WallpaperVC: UIViewController {
    
    var person : Person?
    var index : Int?

    @IBOutlet weak var wallpaperView: UIView!
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var downloadimg: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        downloadimg.layer.cornerRadius = 20
        
        pic.image = person?.pic
        quote.text = person?.quotes[index!]
        
        
    }
    
    @IBAction func backbtn(_ sender: UIButton) {
        //go back.
    }
    
    @IBAction func download(_ sender: UIButton) {
        //download wallpaper.
        UIGraphicsBeginImageContext(wallpaperView.frame.size)
        wallpaperView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}
