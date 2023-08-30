//
//  AdvertisementListPresenter.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/24/23.
//

final class AdvertisementListPresenter {
    // MARK: - Properties
    weak var view: AdvertisementListDisplayLogic?
}

// MARK: - PresentationLogic
extension AdvertisementListPresenter: AdvertisementListPresentationLogic {
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart(Model.Start.ViewModel())
    }
    
    func presentAds(_ response: Model.GetAds.Response) {
        view?.displayAds(Model.GetAds.ViewModel(ads: response.ads))
    }
    
    func presentAdvertisementDetailsScene(_ response: Model.AdvertisementDetailsScene.Response) {
        view?.displayAdvertisementDetailsScene(Model.AdvertisementDetailsScene.ViewModel())
    }
    
    func presentLoadingFailure(_ response: Model.LoadingFailure.Response) {
        view?.displayLoadingFailure(Model.LoadingFailure.ViewModel())
    }
}
