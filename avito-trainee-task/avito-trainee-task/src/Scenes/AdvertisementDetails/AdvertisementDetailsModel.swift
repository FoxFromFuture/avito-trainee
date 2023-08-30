//
//  AdvertisementDetailsModel.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/24/23.
//

enum AdvertisementDetailsModel {
    
    enum Start {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum GetAdvertisementDetails {
        struct Request { }
        struct Response {
            let details: AdvertisementDetails
        }
        struct ViewModel {
            let details: AdvertisementDetails
        }
    }
    
    enum LoadingFailure {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum AdvertisementList {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    struct AdvertisementDetails: Decodable {
        let id: String?
        let title: String?
        let price: String?
        let location: String?
        let image_url: String?
        let created_date: String?
        let description: String?
        let email: String?
        let phone_number: String?
        let address: String?
    }
}
