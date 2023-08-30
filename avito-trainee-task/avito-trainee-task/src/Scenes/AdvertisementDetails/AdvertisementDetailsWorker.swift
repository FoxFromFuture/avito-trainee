//
//  AdvertisementDetailsWorker.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/28/23.
//

import UIKit

final class AdvertisementDetailsWorker {
    // MARK: - Private Properties
    private let session: URLSession = URLSession.shared
}

// MARK: - WorkerLogic
extension AdvertisementDetailsWorker: AdvertisementDetailsWorkerLogic {
    func getAdvertisementDetails(_ request: Model.GetAdvertisementDetails.Request, completion: @escaping (Result<Model.AdvertisementDetails, Error>) -> ()) {
        guard let id = AdvertisementDataStore.shared.advertisementForDetailsID else {
            return
        }
        session.getJsonDataByURL(from: "https://www.avito.st/s/interns-ios/details/\(id).json") { (result: Result<Model.AdvertisementDetails, Error>) in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
