//
//  AdvertisementDetailsInteractor.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/24/23.
//

final class AdvertisementDetailsInteractor {
    // MARK: - Private Properties
    private let presenter: AdvertisementDetailsPresentationLogic
    private let worker: AdvertisementDetailsWorkerLogic
    
    // MARK: - Initializers
    init(presenter: AdvertisementDetailsPresentationLogic, worker: AdvertisementDetailsWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

// MARK: - BusinessLogic
extension AdvertisementDetailsInteractor: AdvertisementDetailsBusinessLogic {
    func loadStart(_ request: Model.Start.Request) {
        presenter.presentStart(Model.Start.Response())
    }
    
    func loadAdvertisementDetails(_ request: Model.GetAdvertisementDetails.Request) {
        worker.getAdvertisementDetails(request) { [weak self] result in
            switch result {
            case .success(let details):
                self?.presenter.presentAdvertisementDetails(Model.GetAdvertisementDetails.Response(details: details))
            case .failure(_):
                self?.presenter.presentLoadingFailure(Model.LoadingFailure.Response())
            }
        }
    }
    
    func loadAdvertisementListScene(_ request: Model.AdvertisementList.Request) {
        presenter.presentAdvertisementListScene(Model.AdvertisementList.Response())
    }
}
