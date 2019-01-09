//
//  extensions.swift
//  freeHero
//
//  Created by alvin joseph valdez on 09/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

//extension UIImageView {
//    public func imageFromUrl(urlString: String) {
//        if let url = URL(string: urlString) {
//            let request = URLRequest(url: url as URL)
//            
//            
//            NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) {
//                (response: URLResponse!, data: Data!, error: Error!) -> Void in
//                self.image = UIImage(data: data)
//            }
//        }
//    }
//}


