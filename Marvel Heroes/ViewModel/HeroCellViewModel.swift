//
//  HeroCellViewModel.swift
//  Marvel Heroes
//
//  Created by Carlos Henrique Gava on 29/12/20.
//

import Foundation
import Alamofire

class HeroCellViewModel {
    
    var service: NetworkService!
    var hero: Heroes!
    
    var thumbnailURL: String {
        return self.hero.thumbnail.urlPath(type: .portraitMedium)
    }
    
    init(service: NetworkService, hero: Heroes) {
        self.service = service
        self.hero = hero
    }
}
