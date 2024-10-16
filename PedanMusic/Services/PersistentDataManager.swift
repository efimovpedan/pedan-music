//
//  DataManager.swift
//  PedanMusic
//
//  Created by Andrey Pedan on 15.10.2024.
//

import Foundation

protocol DataManager {
    func loadRecentSearchesInfos() -> [TrackInfo]
    func saveRecentSearchesInfos(tracksInfos: [TrackInfo])
}

class PersistentDataManager : DataManager{
    func saveRecentSearchesInfos(tracksInfos: [TrackInfo]) {
        saveResentSearches(tracksInfos: tracksInfos)
    }
    
    func loadRecentSearchesInfos() -> [TrackInfo] {
        return loadResentSearches()
    }
    
    private let fileName = "recent_searches.json"
    
    private func saveResentSearches(tracksInfos: [TrackInfo]) {
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(tracksInfos)
            let fileUrl = getDocumentsDirectory().appendingPathComponent(fileName)
            try jsonData.write(to: fileUrl)
        } catch {
            print("cant save data reason: \(error)")
        }
    }
    
    private func loadResentSearches() -> [TrackInfo] {
        let fileUrl = getDocumentsDirectory().appendingPathComponent(fileName)
        
        do {
            let data = try Data(contentsOf: fileUrl)
            let decoder = JSONDecoder()
            let tracksInfos = try decoder.decode([TrackInfo].self, from: data)
            return tracksInfos
        } catch {
            print("cant load data reason: \(error)")
            return []
        }
    }
    
    
    private func getDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
