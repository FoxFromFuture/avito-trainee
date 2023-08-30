//
//  AdvertisementListProtocols.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/30/23.
//

// MARK: - DisplayLogic
protocol AdvertisementListDisplayLogic: AnyObject {
    typealias Model = AdvertisementListModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    func displayAds(_ viewModel: Model.GetAds.ViewModel)
    func displayAdvertisementDetailsScene(_ viewModel: Model.AdvertisementDetailsScene.ViewModel)
    func displayLoadingFailure(_ viewModel: Model.LoadingFailure.ViewModel)
}

// MARK: - BusinessLogic
protocol AdvertisementListBusinessLogic {
    typealias Model = AdvertisementListModel
    func loadStart(_ request: Model.Start.Request)
    func loadAdvertisements(_ request: Model.GetAds.Request)
    func loadAdvertisementDetailsScene(_ request: Model.AdvertisementDetailsScene.Request)
}

// MARK: - PresentationLogic
protocol AdvertisementListPresentationLogic {
    typealias Model = AdvertisementListModel
    func presentStart(_ response: Model.Start.Response)
    func presentAds(_ response: Model.GetAds.Response)
    func presentAdvertisementDetailsScene(_ response: Model.AdvertisementDetailsScene.Response)
    func presentLoadingFailure(_ response: Model.LoadingFailure.Response)
}

// MARK: - RoutingLogic
protocol AdvertisementListRoutingLogic {
    func routeToAdvertisementDetailsScene()
}

// MARK: - WorkerLogic
protocol AdvertisementListWorkerLogic {
    typealias Model = AdvertisementListModel
    func getAds(
        _ request: Model.GetAds.Request,
        completion: @escaping (Result<Model.Ads, Error>) -> ()
    )
}
