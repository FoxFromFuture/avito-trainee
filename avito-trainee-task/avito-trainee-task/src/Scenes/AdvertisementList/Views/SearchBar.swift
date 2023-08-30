//
//  SearchBar.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/25/23.
//

import UIKit

// MARK: - SearchBar
final class SearchBar: UITextField {
    
    // MARK: - Private Properties
    private let padding = UIEdgeInsets(top: 0, left: 45, bottom: 0, right: 45)
    private let searchImageView = UIImageView()
    private let filtersImageView = UIImageView()
    
    // MARK: - Initializers
    init(placeholder: String) {
        super.init(frame: .zero)
        configureSearchBar(placeholder: placeholder)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    // MARK: - Private Methods
    private func configureSearchBar(placeholder: String) {
        textColor = .black
        
        layer.cornerRadius = 18
        layer.backgroundColor = UIColor(hex: "F0F1F2").cgColor
        
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        font = .systemFont(ofSize: 16)
        
        setHeight(to: 50)
        tintColor = .black
        
        addSubview(searchImageView)
        searchImageView.pinLeft(to: self, 15)
        searchImageView.pinCenter(to: self.centerYAnchor)
        searchImageView.image = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(scale: .medium))
        searchImageView.tintColor = UIColor.gray
        searchImageView.backgroundColor = UIColor.clear
        
        addSubview(filtersImageView)
        filtersImageView.pinRight(to: self, 15)
        filtersImageView.pinCenter(to: self.centerYAnchor)
        filtersImageView.image = UIImage(systemName: "slider.horizontal.3", withConfiguration: UIImage.SymbolConfiguration(scale: .medium))
        filtersImageView.tintColor = UIColor.black
        filtersImageView.backgroundColor = UIColor.clear
    }
}
