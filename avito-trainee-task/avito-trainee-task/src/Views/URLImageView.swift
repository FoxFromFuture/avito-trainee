//
//  URLImageView.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/29/23.
//
//  Instead of using this custom class, the SDWebImage can be used.
//

import UIKit

// MARK: - URLImageView
final class URLImageView: UIImageView {
    
    // MARK: - Private Properties
    private let imageCache = NSCache<AnyObject, UIImage>()
    private let session: URLSession = URLSession.shared
    
    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal Methods
    func loadImageByURL(url: String, placeholder: UIImage) {
        self.image = placeholder
        
        if let cachedImage = self.imageCache.object(forKey: url as AnyObject) {
            self.image = cachedImage
            return
        }
        
        session.getImageByURL(from: url) { (result: Result<UIImage, Error>) in
            switch result {
            case .success(let image):
                DispatchQueue.main.async { [weak self] in
                    self?.imageCache.setObject(image, forKey: url as AnyObject)
                    self?.image = image
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
