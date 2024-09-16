//
//  UIImageView+Remote.swift
//  DragonBallHeroes
//
//  Created by Diego Herreros Parron on 16/9/24.
//


import UIKit


extension UIImageView {
    
    func setImage(url: URL) {
        downloadWithURLSession(url: url) { [weak self] image in
            DispatchQueue.main.async {
                self?.image = image
            }
            
        }
    }
    
    
    
    private func downloadWithURLSession(url: URL, completion: @escaping (UIImage?) -> Void) {
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, _ in
            guard let data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }
        .resume()
    }
    
}
