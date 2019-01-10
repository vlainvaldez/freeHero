//
//  PhotographRequest.swift
//  freeHero
//
//  Created by alvin joseph valdez on 09/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import Foundation
import Moya

public enum PhotographRequest {
    case getImages(page: Int)
}


extension PhotographRequest: TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.unsplash.com/")!
    }
    
    public var path: String {
        switch self {
        case .getImages(_):
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
        case .getImages(let page):
                return .requestParameters(
                    parameters: [
                        "page": page,
                        "per_page": 20
                    ],
                    encoding: URLEncoding.queryString
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
