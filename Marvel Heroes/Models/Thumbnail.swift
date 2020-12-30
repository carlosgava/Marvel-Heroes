//
//  Thumbnail.swift
//  Marvel Heroes
//
//  Created by Carlos Henrique Gava on 29/12/20.
//

import Foundation

struct Thumbnail: Codable {
    
    var path: String
    var `extension`: String
    
    func urlPath(type: ThumbnailType)-> String {
        return "\(path)/\(type.rawValue).\(`extension`)"
    }
    
    enum ThumbnailType: String {
        case portraitSmall = "portrait_small"
        case portraitMedium = "portrait_medium"
        case portraitXLarge = "portrait_xlarge"
        case portraitFantastic = "portrait_fantastic"
        case portraitUncanny = "portrait_uncanny"
        case portraitIncredible = "portrait_incredible"

        case standardSmall = "standard_small"
        case standardMedium = "standard_medium"
        case standardLarge = "standard_large"
        case standardXLarge = "standard_xlarge"
        case standardFantastic = "standard_fantastic"
        case standardAmazing = "standard_amazing"

        case landscapeSmall = "landscape_small"
        case landscapeMedium = "landscape_medium"
        case landscapeLarge = "landscape_large"
        case landscapeXLarge = "landscape_xlarge"
        case landscapeAmazing = "landscape_amazing"
        case landscapeIncredible = "landscape_incredible"
        
        case detail = "detail"
        case fullSizeImage = "full-size image"
    }
}
