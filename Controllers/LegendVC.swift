//
//  LegendVC.swift
//  Quotes in History
//
//  Created by Samyak Pawar on 25/09/20.
//

import UIKit
import SafariServices
import youtube_ios_player_helper

class LegendVC: UIViewController {
    
    var person : Person?
    var picIndex = 0

    @IBOutlet weak var legendName: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        
        legendName.text = person?.name
        
        
        ytPlayer.load(withVideoId: person!.videoid, playerVars: ["playsinline" : 1])
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func knowMore(_ sender: UIButton) {
        let safariVC = SFSafariViewController(url: person!.link)
        present(safariVC, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "to_wallpaper" {
            let VC = segue.destination as! WallpaperVC
            VC.person = person
            VC.index = picIndex
            
        }
    }
    
    @IBAction func goBack(segue : UIStoryboardSegue){
        
        
    }
    
    @IBOutlet weak var ytPlayer: YTPlayerView!
    
    
    
}


extension LegendVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return person!.quotes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let legendCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PersonCVCell
        
        legendCell.wallpaperImg.image = person!.pic
        legendCell.quotes.text = person!.quotes[indexPath.row]
        
        return legendCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        picIndex = indexPath.row
        performSegue(withIdentifier: "to_wallpaper", sender: self)
    }
    
    
}
