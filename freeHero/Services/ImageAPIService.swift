//
//  ImageService.swift
//  freeHero
//
//  Created by alvin joseph valdez on 09/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import Foundation
import Moya
import Result

public struct ImageAPIService {
    
    // MARK: - Store Properties
    private let imageProvider: MoyaProvider = MoyaProvider<ImageRequest>()
    
    public func getImages() {
        
        self.imageProvider.request(ImageRequest.getImages) { (result: Result<Response, MoyaError>) -> Void in
            switch result {
            case .success(let response):
                
                guard
                    let photographs: [Photograph] = try? JSONDecoder().decode([Photograph].self, from: response.data)
                else { return }
                
                for photograph in photographs {
                    print("title: \(photograph.title)")
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
    
}
