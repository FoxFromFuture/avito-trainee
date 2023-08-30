//
//  AdvertisementListWorker.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/27/23.
//

import UIKit

final class AdvertisementListWorker {
    // MARK: - Private Properties
    private let session: URLSession = URLSession.shared
}

// MARK: - WorkerLogic
extension AdvertisementListWorker: AdvertisementListWorkerLogic {
    func getAds(_ request: Model.GetAds.Request, completion: @escaping (Result<Model.Ads, Error>) -> ()) {
        session.getJsonDataByURL(from: "https://www.avito.st/s/interns-ios/main-page.json") { (result: Result<Model.Ads, Error>) in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
