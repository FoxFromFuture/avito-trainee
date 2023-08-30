//
//  AdvertisementListInteractor.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/24/23.
//

import UIKit

final class AdvertisementListInteractor {
    // MARK: - Private Properties
    private let presenter: AdvertisementListPresentationLogic
    private let worker: AdvertisementListWorkerLogic
    
    // MARK: - Initializers
    init(presenter: AdvertisementListPresentationLogic, worker: AdvertisementListWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

// MARK: - BusinessLogic
extension AdvertisementListInteractor: AdvertisementListBusinessLogic {
    func loadStart(_ request: Model.Start.Request) {
        presenter.presentStart(Model.Start.Response())
    }
    
    func loadAdvertisements(_ request: Model.GetAds.Request) {
        worker.getAds(request) { [weak self] result in
            switch result {
            case .success(let ads):
                self?.presenter.presentAds(Model.GetAds.Response(ads: ads))
            case .failure(_):
                self?.presenter.presentLoadingFailure(Model.LoadingFailure.Response())
            }
        }
    }
    
    func loadAdvertisementDetailsScene(_ request: Model.AdvertisementDetailsScene.Request) {
        AdvertisementDataStore.shared.advertisementForDetailsID = request.id
        presenter.presentAdvertisementDetailsScene(Model.AdvertisementDetailsScene.Response())
    }
}
