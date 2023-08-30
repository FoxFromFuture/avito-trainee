//
//  AdvertisementDetailsProtocols.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/30/23.
//

// MARK: - DisplayLogic
protocol AdvertisementDetailsDisplayLogic: AnyObject {
    typealias Model = AdvertisementDetailsModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    func displayAdvertisementDetails(_ viewModel: Model.GetAdvertisementDetails.ViewModel)
    func displayLoadingFailure(_ viewModel: Model.LoadingFailure.ViewModel)
    func displayAdvertisementListScene(_ viewModel: Model.AdvertisementList.ViewModel)
}

// MARK: - BusinessLogic
protocol AdvertisementDetailsBusinessLogic {
    typealias Model = AdvertisementDetailsModel
    func loadStart(_ request: Model.Start.Request)
    func loadAdvertisementDetails(_ request: Model.GetAdvertisementDetails.Request)
    func loadAdvertisementListScene(_ request: Model.AdvertisementList.Request)
}

// MARK: - PresentationLogic
protocol AdvertisementDetailsPresentationLogic {
    typealias Model = AdvertisementDetailsModel
    func presentStart(_ response: Model.Start.Response)
    func presentAdvertisementDetails(_ response: Model.GetAdvertisementDetails.Response)
    func presentLoadingFailure(_ response: Model.LoadingFailure.Response)
    func presentAdvertisementListScene(_ response: Model.AdvertisementList.Response)
}

// MARK: - RoutingLogic
protocol AdvertisementDetailsRoutingLogic {
    func routeToAdvertisementListScene()
}

// MARK: - WorkerLogic
protocol AdvertisementDetailsWorkerLogic {
    typealias Model = AdvertisementDetailsModel
    func getAdvertisementDetails(
        _ request: Model.GetAdvertisementDetails.Request,
        completion: @escaping (Result<Model.AdvertisementDetails, Error>) -> ()
    )
}
