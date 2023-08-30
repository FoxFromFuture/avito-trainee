//
//  AdvertisementListAssembly.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/24/23.
//

import UIKit

enum AdvertisementListAssembly {
    static func build() -> UIViewController {
        let router: AdvertisementListRouter = AdvertisementListRouter()
        let presenter: AdvertisementListPresenter = AdvertisementListPresenter()
        let worker: AdvertisementListWorker = AdvertisementListWorker()
        let interactor: AdvertisementListInteractor = AdvertisementListInteractor(presenter: presenter, worker: worker)
        let viewController: AdvertisementListViewController = AdvertisementListViewController(
            router: router,
            interactor: interactor
        )
        
        router.view = viewController
        presenter.view = viewController
        
        return viewController
    }
}
