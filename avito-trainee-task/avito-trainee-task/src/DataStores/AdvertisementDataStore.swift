//
//  AdvertisementDataStore.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/28/23.
//

final class AdvertisementDataStore {
    
    static let shared = AdvertisementDataStore()
    var advertisementForDetailsID: String?
    
    private init() { }
}
