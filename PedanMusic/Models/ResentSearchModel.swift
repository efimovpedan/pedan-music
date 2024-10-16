//
//  SearchModel.swift
//  PedanMusic
//
//  Created by Andrey Pedan on 03.10.2024.
//

import Foundation

class ResentSearchModel: ObservableObject{
    @Published var resentSearches : [TrackInfo] = []
    private var dataManager : PersistentDataManager
    
    init(dataManager: PersistentDataManager) {
        self.dataManager = dataManager
        self.resentSearches = dataManager.loadRecentSearchesInfos();
    }
    
    private func isContainInfo (info : TrackInfo) -> Bool{
        let isContain = resentSearches.contains{ trackInfo in
            trackInfo.id == info.id
        }
        return isContain
    }
    
    public func tryAddNewElement(info: TrackInfo) -> Bool{
        let isContain = isContainInfo(info: info);
        if(!isContain) {
            resentSearches.append(info)
            dataManager.saveRecentSearchesInfos(tracksInfos: resentSearches)
            return true
        }
        return false
    }
}
