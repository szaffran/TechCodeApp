//
//  MEnuItem.swift
//  TechCodeApp
//
//  Created by Mac on 14/01/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class MenuItem: NSObject
{
    var title : String
    var selector : Selector
    
    init(title : String, selector : String)
    {
        self.title = title
        self.selector = Selector(selector)
    }
    
//    init( json: [String : Any])
//    {
//        self.title = json["title"] as! String
//        self.selector = Selector(json["selector"] as! String)
//    }
//
//    static func loadSampleFromPlist() -> [MenuItem]
//    {
//        var sampleEmojis : [MenuItem] = []
//
//        var emojiArray : [Any] = []
//
//        if let path = Bundle.main.path(forResource: "defaultMenuItems", ofType: "plist")
//        {
//            emojiArray = NSArray(contentsOf: URL(fileURLWithPath: path)) as! [Any] // we get the array from the file here!!!!!!!
//        }
//        if let array : [Dictionary<String,Any>] = emojiArray as! [Dictionary<String, Any>] {
//            // Use your dict here
//
//            for dict in array
//            {
//                let newEmoji = MenuItem(json: dict)
//                sampleEmojis.append(newEmoji)
//            }
//        }
//
//        return sampleEmojis
//    }
    
}
