//
//  Heroes.swift
//  Marvel Heroes
//
//  Created by Carlos Henrique Gava on 29/12/20.
//

import Foundation

struct `Heroes`: Codable {
    var id: Int
    var name: String
    var description: String
    var modified: String
    var thumbnail: Thumbnail
    var resourceURI: String
}
