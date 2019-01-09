//
//  Photograph.swift
//  freeHero
//
//  Created by alvin joseph valdez on 09/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import Foundation

public final class Photograph: NSObject, Codable {
    
    // MARK: - Enums
    public enum CodingKeys: String, CodingKey {
        case title
    }
    
    // MARK: - Initializer
    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Photograph.CodingKeys> = try decoder.container(
            keyedBy: Photograph.CodingKeys.self
        )
        
        self.title = try container.decode(String.self, forKey: Photograph.CodingKeys.title)
        super.init()
    }
    
    // MARK: Stored Properties
    public let title: String
    
}
