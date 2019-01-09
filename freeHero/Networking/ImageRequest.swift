//
//  ImageRequest.swift
//  freeHero
//
//  Created by alvin joseph valdez on 09/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import Foundation
import Moya

public enum ImageRequest {
    case getImages
}


extension ImageRequest: TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.unsplash.com/")!
    }
    
    public var path: String {
        switch self {
        case .getImages:
            return "/collections"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getImages:
            return Moya.Method.get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getImages:
                return .requestParameters(
                    parameters: [
                        "page": 1,
                        "per_page": 10
                    ],
                    encoding: JSONEncoding.default
                )
        }
    }
    
    public var headers: [String : String]? {
        return [
            "Content-Type": "application/json",
            "Authorization": "Client-ID \(UnplashAccessToken)"
        ]
    }
    
}
