//
//  extensions.swift
//  freeHero
//
//  Created by alvin joseph valdez on 09/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import Foundation

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(in: 0...1),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

let imageCache = NSCache<AnyObject, AnyObject>()

//extension UIImageView {
//    
//    func loadeImagefrom(url: URL) {
//        
//        image = nil
//        
//        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
//            self.image = imageFromCache
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
//            if error != nil {
//                print(error!.localizedDescription)
//                return
//            }
//            
//            DispatchQueue.main.async {
//                let cacheImage = UIImage(data: data!)
//                
//                imageCache.setObject(cacheImage!, forKey: url as AnyObject)
//                self.image = cacheImage
//            }
//        }.resume()
//        
//    }
//    
//}

