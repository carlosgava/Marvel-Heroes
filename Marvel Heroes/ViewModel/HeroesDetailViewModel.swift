//
//  HeroesDetailViewModel.swift
//  Marvel Heroes
//
//  Created by Carlos Henrique Gava on 29/12/20.
//

import Foundation
import Alamofire

class HeroesDetailViewModel {
    
    private var service: NetworkService!
    private var heroes: Heroes!

    var thumbnailURL: String {
        return self.heroes.thumbnail.urlPath(type: .portraitFantastic)
    }
    
    func characterName() -> String {
        return self.heroes.name
    }
    
    func characterDescription() -> String {
        return self.heroes.description
    }
    
    init(service: NetworkService, heroes: Heroes) {
        self.service = service
        self.heroes = heroes
    }
}
