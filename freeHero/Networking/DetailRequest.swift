//
//  DetailRequest.swift
//  freeHero
//
//  Created by FFUF Alvin on 10/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import Foundation

import Foundation
import Moya

public enum DetailRequest {
    case getDetail(id: String)
}


extension DetailRequest: TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.unsplash.com/")!
    }

    public var path: String {
        switch self {
        case .getDetail(let id):
            return "/photos/\(id)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .getDetail:
            return Moya.Method.get
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .getDetail(_):
            return .requestPlain            
        }
    }


    public var headers: [String : String]? {
        return [
            "Content-Type": "application/json",
            "Authorization": "Client-ID \(UnplashAccessToken)"
        ]
    }

}
