//
//  DataLoadOperation.swift
//  freeHero
//
//  Created by alvin joseph valdez on 09/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import Foundation

class DataLoadOperation: Operation {
    
    var photograph: Photograph?
    var loadingCompletionHandler: ((Photograph) -> Void)?
    
    private let _photograph: Photograph
    
    init(_ photograph: Photograph) {
        _photograph = photograph
    }
    
    override func main() {
        
        if isCancelled { return }
        
        let randomDelayTime = Int.random(in: 500..<2000)
        usleep(useconds_t(randomDelayTime * 1000))
        
        if isCancelled { return }
        
        photograph = _photograph
        
        if let loadingCompleteHandler = loadingCompletionHandler {
            DispatchQueue.main.async {
                loadingCompleteHandler(self._photograph)
            }
        }
        
    }
    
}
