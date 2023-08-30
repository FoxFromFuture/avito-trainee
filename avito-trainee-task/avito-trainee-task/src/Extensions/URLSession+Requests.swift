//
//  URLSession+Requests.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/28/23.
//

import UIKit

extension URLSession {
    func getJsonDataByURL<T: Decodable>(from url: String, completion: @escaping (Result<T, Error>) -> ()) {
        guard let _url = URL(string: url) else {
            return
        }
        self.dataTask(with: _url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(object))
                } catch let decoderError {
                    completion(.failure(decoderError))
                }
            }
        }.resume()
    }
    
    func getImageByURL(from url: String, completion: @escaping (Result<UIImage, Error>) -> ()) {
        guard let _url = URL(string: url) else {
            return
        }
        self.dataTask(with: _url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data, let object = UIImage(data: data) {
                completion(.success(object))
            } else {
                print("Couldn't load image from url: \(_url)")
            }
        }.resume()
    }
}
