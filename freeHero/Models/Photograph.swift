//
//  Photograph.swift
//  freeHero
//
//  Created by alvin joseph valdez on 09/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import Foundation

public struct CoverPhotoURLS: Decodable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}


public struct CoverPhoto: Decodable {
    let width: Int
    let height: Int
    let urls: CoverPhotoURLS
}


public final class Photograph: NSObject, Decodable {
    
    // MARK: - Enums
    public enum CodingKeys: String, CodingKey {
        case title
        case imageDescription = "description"
        case coverPhoto = "cover_photo"
    }
    
    // MARK: - Initializer
    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Photograph.CodingKeys> = try decoder.container(
            keyedBy: Photograph.CodingKeys.self
        )
        
        self.title = try container.decode(String.self, forKey: Photograph.CodingKeys.title)
        self.coverPhoto = try container.decode(CoverPhoto.self, forKey: Photograph.CodingKeys.coverPhoto)
        
        if let photoDescription = try container.decode(String?.self, forKey: Photograph.CodingKeys.imageDescription) {
            self.imageDescription = photoDescription
        } else {
            self.imageDescription = "No Description Found"
        }
        
        super.init()
        
        
    }
    
    // MARK: Stored Properties
    public let title: String
    public let imageDescription: String
    public let coverPhoto: CoverPhoto
}

