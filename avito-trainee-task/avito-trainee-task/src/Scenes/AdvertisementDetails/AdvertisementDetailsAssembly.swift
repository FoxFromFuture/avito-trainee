//
//  AdvertisementDetailsAssembly.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/24/23.
//

import UIKit

enum AdvertisementDetailsAssembly {
    static func build() -> UIViewController {
        let router: AdvertisementDetailsRouter = AdvertisementDetailsRouter()
        let presenter: AdvertisementDetailsPresenter = AdvertisementDetailsPresenter()
        let worker: AdvertisementDetailsWorker = AdvertisementDetailsWorker()
        let interactor: AdvertisementDetailsInteractor = AdvertisementDetailsInteractor(presenter: presenter, worker: worker)
        let viewController: AdvertisementDetailsViewController = AdvertisementDetailsViewController(
            router: router,
            interactor: interactor
        )
        
        router.view = viewController
        presenter.view = viewController
        
        return viewController
    }
}
