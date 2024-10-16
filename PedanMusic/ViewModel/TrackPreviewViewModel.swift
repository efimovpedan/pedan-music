//
//  TrackPreviewViewModel.swift
//  PedanMusic
//
//  Created by Andrey Pedan on 15.10.2024.
//

import Foundation
import Combine
import SwiftUI

class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
}

class TrackPreviewViewModel : ObservableObject {
    @Published var image: UIImage? = nil
    private var networkManager = NetworkManager()
    
    func tryFetchImageByUrl(for url:String) {
        if let cachedImage = ImageCache.shared.object(forKey: url as NSString) {
            self.image = cachedImage;
        } else {
            
            networkManager.FetchImage(from: url)  { [weak self] result in
                DispatchQueue.main.async {
                    if let image = result {
                        ImageCache.shared.setObject(image, forKey: url as NSString)
                    }
                    self?.image = result
                }
            }
        }
    }
}
