//
//  AdvertisementListModel.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/24/23.
//

import UIKit

enum AdvertisementListModel {
    
    enum Start {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum GetAds {
        struct Request { }
        struct Response {
            var ads: Ads
        }
        struct ViewModel {
            var ads: Ads
        }
    }
    
    enum AdvertisementDetailsScene {
        struct Request {
            let id: String?
        }
        struct Response { }
        struct ViewModel { }
    }
    
    enum LoadingFailure {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    struct Ads: Decodable {
        let advertisements: [Advertisement]?
    }
    
    struct Advertisement: Decodable {
        let id: String?
        let title: String?
        let price: String?
        let location: String?
        let image_url: String?
        let created_date: String?
    }
}
