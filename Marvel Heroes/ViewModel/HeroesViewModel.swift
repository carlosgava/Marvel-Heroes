//
//  HeroesViewModel.swift
//  Marvel Heroes
//
//  Created by Carlos Henrique Gava on 29/12/20.
//

import Foundation
import Alamofire

class HeroesViewModel {
    private var data: DataResponse!
    private var heroes: [Heroes] = []
    private var service: NetworkService!
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func numberOfItems() -> Int {
        return self.heroes.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> HeroesViewModel {
        return HeroCellViewModel(service: self.service, hero: self.heroes[indexPath.row])
    }
    
    func detailViewModel(for indexPath: IndexPath) -> HeroesDetailViewModel {
        return HeroesDetailViewModel(service: self.service, heroes: self.heroes[indexPath.row])
    }
    
    func fetchIfNeeded(for indexPath: IndexPath, name: String? = nil, completionHandler: @escaping () -> Void) {
        if self.data.hasMore() && indexPath.row == self.numberOfItems() - 1 {
            self.fetchHeroes(offset: 0, name: name, completionHandler: completionHandler)
        }
    }
    
    func fetchHeroes(offset: Int, name: String? = nil, completionHandler: @escaping () -> Void)  {
        if offset == 0 {
            self.heroes = []
        }
        
        self.service.heroes(offset: offset, name: name) { (result) in

            if let value = result.value {
                self.data = value.data
                self.heroes += value.data.results.filter({ (character) -> Bool in
                    return !character.thumbnail.path.contains("image_not_available")
                })
            }
            
            completionHandler()
        }
    }
    
    func fetchHeroesByName(name: String, completionHandler: @escaping () -> Void) {
        self.heroes = []
        self.fetchHeroes(offset: 0, name: name, completionHandler: completionHandler)
    }
}
