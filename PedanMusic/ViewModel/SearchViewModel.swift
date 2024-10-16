//
//  SearchViewModel.swift
//  PedanMusic
//
//  Created by Andrey Pedan on 03.10.2024.
//

import Foundation

class SearchViewModel : ObservableObject {
    @Published var foundTracks: [TrackInfo] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let dataManager : DataManager
    private let networkManager = NetworkManager ()
    
    @Published var resentSearchModel : ResentSearchModel
    
    init() {
        dataManager = PersistentDataManager()
        self.resentSearchModel = ResentSearchModel(dataManager: PersistentDataManager())
    }
    
    public func isValidString(_string: String) -> Bool {
        let minCharsCount = 3
        
        return _string.count >= minCharsCount
    }
    
    public func tryFetchTracksByKeyWords(_string: String) {
        isLoading = true;
        errorMessage = nil;
        
        NetworkManager.FetchTracksInfo(searchTerm: _string) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false;
                
                switch result {
                case .success(let tracks):
                    self?.foundTracks = tracks
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    public func onAudioTrackSelect(trackInfo : TrackInfo){
        let result = resentSearchModel.tryAddNewElement(info: trackInfo)
        if(result){
            dataManager.saveRecentSearchesInfos(tracksInfos: resentSearchModel.resentSearches)
        }
    }
    
    public func clearAllResentSearches() {
        dataManager.clearAll()
    }
}
