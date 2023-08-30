//
//  AdvertisementDetailsRouter.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/24/23.
//

import UIKit

final class AdvertisementDetailsRouter {
    // MARK: - Properties
    weak var view: UIViewController?
}

// MARK: - RoutingLogic
extension AdvertisementDetailsRouter: AdvertisementDetailsRoutingLogic {
    func routeToAdvertisementListScene() {
        view?.navigationController?.popViewController(animated: true)
    }
}
