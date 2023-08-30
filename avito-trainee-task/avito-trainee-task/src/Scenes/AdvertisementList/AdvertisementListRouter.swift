//
//  AdvertisementListRouter.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/24/23.
//

import UIKit

final class AdvertisementListRouter {
    // MARK: - Properties
    weak var view: UIViewController?
}

// MARK: - RoutingLogic
extension AdvertisementListRouter: AdvertisementListRoutingLogic {
    func routeToAdvertisementDetailsScene() {
        view?.navigationController?.pushViewController(AdvertisementDetailsAssembly.build(), animated: true)
    }
}
