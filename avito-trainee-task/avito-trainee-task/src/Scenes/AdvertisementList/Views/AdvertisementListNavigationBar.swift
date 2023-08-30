//
//  AdvertisementListNavigationBar.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/25/23.
//

import UIKit

// MARK: - AdvertisementListNavigationBar
final class AdvertisementListNavigationBar: UIView {
    
    // MARK: - Private Properties
    private let searchBar = SearchBar(placeholder: "Поиск в Москве")
    private let cartImageView = UIImageView()
    
    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        configureAdvertisementListNavigationBar()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func configureAdvertisementListNavigationBar() {
        setHeight(to: 70)
        layer.backgroundColor = UIColor.white.cgColor
        configureSearchBar()
        configureCartImageView()
    }
    
    private func configureSearchBar() {
        addSubview(searchBar)
        searchBar.pinBottom(to: self.bottomAnchor, 10)
        searchBar.pin(to: self, [.left: 15, .right: 60])
    }
    
    private func configureCartImageView() {
        addSubview(cartImageView)
        cartImageView.pinRight(to: self, 20)
        cartImageView.pinBottom(to: self, 25)
        cartImageView.image = UIImage(systemName: "cart", withConfiguration: UIImage.SymbolConfiguration(scale: .medium))
        cartImageView.tintColor = UIColor.black
        cartImageView.backgroundColor = UIColor.clear
    }
}
