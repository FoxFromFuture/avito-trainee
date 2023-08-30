//
//  AdvertisementDetailsPresenter.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/24/23.
//

final class AdvertisementDetailsPresenter {
    // MARK: - Properties
    weak var view: AdvertisementDetailsDisplayLogic?
}

// MARK: - PresentationLogic
extension AdvertisementDetailsPresenter: AdvertisementDetailsPresentationLogic {
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart(Model.Start.ViewModel())
    }
    
    func presentAdvertisementDetails(_ response: Model.GetAdvertisementDetails.Response) {
        view?.displayAdvertisementDetails(Model.GetAdvertisementDetails.ViewModel(details: response.details))
    }
    
    func presentLoadingFailure(_ response: Model.LoadingFailure.Response) {
        view?.displayLoadingFailure(Model.LoadingFailure.ViewModel())
    }
    
    func presentAdvertisementListScene(_ response: Model.AdvertisementList.Response) {
        view?.displayAdvertisementListScene(Model.AdvertisementList.ViewModel())
    }
}
