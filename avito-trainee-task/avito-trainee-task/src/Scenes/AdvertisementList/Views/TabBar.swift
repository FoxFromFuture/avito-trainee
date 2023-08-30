//
//  TabBar.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/25/23.
//

import UIKit

// MARK: - TabBar
final class TabBar: UIView {
    
    // MARK: - Private Properties
    private let imageViewsStack = UIStackView()
    private let searchImageView = UIImageView()
    private let favouritesImageView = UIImageView()
    private let adsImageView = UIImageView()
    private let messagesImageView = UIImageView()
    private let profileImageView = UIImageView()
    
    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        configureTabBar()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func configureTabBar() {
        setHeight(to: 54)
        layer.backgroundColor = UIColor.white.cgColor
        configureSearchImageView()
        configureFavouritesImageView()
        configureAdsImageView()
        configureMessagesImageView()
        configureProfileImageView()
        configureImageViewsStack()
    }
    
    private func configureSearchImageView() {
        searchImageView.image = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        searchImageView.tintColor = UIColor.gray
        searchImageView.backgroundColor = UIColor.clear
    }
    
    private func configureFavouritesImageView() {
        favouritesImageView.image = UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        favouritesImageView.tintColor = UIColor.gray
        favouritesImageView.backgroundColor = UIColor.clear
    }
    
    private func configureAdsImageView() {
        adsImageView.image = UIImage(systemName: "note.text.badge.plus", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        adsImageView.tintColor = UIColor.gray
        adsImageView.backgroundColor = UIColor.clear
    }
    
    private func configureMessagesImageView() {
        messagesImageView.image = UIImage(systemName: "message", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        messagesImageView.tintColor = UIColor.gray
        messagesImageView.backgroundColor = UIColor.clear
    }
    
    private func configureProfileImageView() {
        profileImageView.image = UIImage(systemName: "person.crop.circle", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        profileImageView.tintColor = UIColor.gray
        profileImageView.backgroundColor = UIColor.clear
    }
    
    private func configureImageViewsStack() {
        addSubview(imageViewsStack)
        imageViewsStack.alignment = .center
        imageViewsStack.distribution = .equalCentering
        imageViewsStack.axis = .horizontal
        imageViewsStack.pin(to: self, [.left: 35, .bottom: 18, .right: 35])
        imageViewsStack.addArrangedSubview(searchImageView)
        imageViewsStack.addArrangedSubview(favouritesImageView)
        imageViewsStack.addArrangedSubview(adsImageView)
        imageViewsStack.addArrangedSubview(messagesImageView)
        imageViewsStack.addArrangedSubview(profileImageView)
    }
}
