//
//  Person.swift
//  Quotes in History
//
//  Created by Samyak Pawar on 24/09/20.
//

import Foundation
import UIKit

struct Person {
    var name : String
    var pic : UIImage
    var desc : String
    var quotes : [String]
    var link : URL
    var videoid : String
    
    
    init(name : String, picture pic : UIImage, summary desc : String, quotes : [String], link : String, videoid : String) {
        self.name = name
        self.pic = pic
        self.desc = desc
        self.quotes = quotes
        self.link = URL(string: link)!
        self.videoid = videoid
    }
}
