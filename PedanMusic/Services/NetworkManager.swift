//
//  NetworkManager.swift
//  PedanMusic
//
//  Created by Andrey Pedan on 14.10.2024.
//

import Foundation
import UIKit

class NetworkManager : ObservableObject {
    static let shared = NetworkManager()
    
    private static let imagesQueue = DispatchQueue(label: "com.pedanMusic.imageLoader", attributes: .concurrent)
    private static let semaphore = DispatchSemaphore(value: 15)
    
    static func FetchTracksInfo(searchTerm: String, completion: @escaping(Result<[TrackInfo], Error>) -> Void) {
        if let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)") {
            
            DispatchQueue.global(qos: .background).async {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    if let error = error {
                        completion(.failure(error))
                        return
                    }
                    
                    if let jsonData = data {
                        do {
                            /*  if let jsonString = String(data: jsonData, encoding: .utf8) {
                             print("recieved json: \(jsonString)")
                             }*/
                            let tracksResponse = try JSONDecoder().decode(TracksResponse.self, from: jsonData)
                            completion(.success(tracksResponse.results))
                        } catch {
                            completion(.failure(error))
                        }
                    }
                    return;
                }
                task.resume()
            }
        }
    }
    
    static func FetchImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            imagesQueue.async {
                self.semaphore.wait()
                guard let url = URL(string: urlString) else {
                    completion(nil)
                    self.semaphore.signal()
                    return
                }
                let task = URLSession.shared.dataTask(with: url) { data, responce, error in defer { self.semaphore.signal()}
                    if let data = data, let image = UIImage(data: data) {
                        completion(image)
                    } else {
                        completion(nil)
                    }
                }
                task.resume()
            }
        }
    }
}
