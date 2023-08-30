//
//  AdvertisementCell.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/26/23.
//

import UIKit

// MARK: - AdvertisementCell
final class AdvertisementCell: UICollectionViewCell {
    
    // MARK: - Private Properties
    private let imageView = URLImageView()
    private let titleLabel = UILabel()
    private let favoutitesImageView = UIImageView()
    private let settingsImageView = UIImageView()
    private let priceLabel = UILabel()
    private let locationLabel = UILabel()
    private let createdDateLabel = UILabel()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func configureUI() {
        backgroundColor = .clear
        configureImageView()
        configureTitleLabel()
        configureFavouritesImageView()
        configureSettingsImageView()
        configurePriceLabel()
        configureLocationLabel()
        configureCreatedDateLabel()
    }
    
    private func configureImageView() {
        addSubview(imageView)
        imageView.pin(to: self, [.top: 0, .left: 0, .right: 0])
        imageView.pinWidth(to: imageView.heightAnchor, 1.0)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
    }
    
    private func configureTitleLabel() {
        addSubview(titleLabel)
        titleLabel.pinTop(to: self.imageView.bottomAnchor, 5)
        titleLabel.pin(to: self, [.right: 35, .left: 0])
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    private func configureFavouritesImageView() {
        addSubview(favoutitesImageView)
        favoutitesImageView.pinTop(to: self.imageView.bottomAnchor, 5)
        favoutitesImageView.pin(to: self, [.right: 0])
        favoutitesImageView.image = UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(scale: .medium))
        favoutitesImageView.tintColor = .black
        favoutitesImageView.backgroundColor = .clear
    }
    
    private func configureSettingsImageView() {
        addSubview(settingsImageView)
        settingsImageView.pinTop(to: self.favoutitesImageView.bottomAnchor, 10)
        settingsImageView.pinCenter(to: favoutitesImageView.centerXAnchor)
        settingsImageView.image = UIImage(systemName: "ellipsis", withConfiguration: UIImage.SymbolConfiguration(scale: .medium))
        settingsImageView.tintColor = .gray
        settingsImageView.backgroundColor = .clear
    }
    
    private func configurePriceLabel() {
        addSubview(priceLabel)
        priceLabel.pinTop(to: self.titleLabel.bottomAnchor, 7)
        priceLabel.pin(to: self, [.right: 20, .left: 0])
        priceLabel.numberOfLines = 0
        priceLabel.textColor = .black
        priceLabel.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    private func configureLocationLabel() {
        addSubview(locationLabel)
        locationLabel.pinTop(to: self.priceLabel.bottomAnchor, 7)
        locationLabel.pin(to: self, [.right: 20, .left: 0])
        locationLabel.numberOfLines = 0
        locationLabel.textColor = .gray
        locationLabel.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    private func configureCreatedDateLabel() {
        addSubview(createdDateLabel)
        createdDateLabel.pinTop(to: self.locationLabel.bottomAnchor, 3)
        createdDateLabel.pin(to: self, [.right: 20, .left: 0])
        createdDateLabel.numberOfLines = 0
        createdDateLabel.textColor = .gray
        createdDateLabel.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    // MARK: - Override Methods
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        titleLabel.text = nil
        priceLabel.text = nil
        locationLabel.text = nil
        createdDateLabel.text = nil
    }
    
    // MARK: - Internal Methods
    func configure(imageURL: String, title: String, price: String, location: String, createdDate: String) {
        titleLabel.text = title
        priceLabel.text = price
        locationLabel.text = location
        createdDateLabel.text = createdDate
        imageView.loadImageByURL(url: imageURL, placeholder: UIImage(systemName: "rectangle.on.rectangle.slash.fill") ?? UIImage())
    }
}
