//
//  TrackModel.swift
//  PedanMusic
//
//  Created by Andrey Pedan on 07.10.2024.
//

import Foundation

struct TrackInfo: Codable, Identifiable {
    static let TestTrack = TrackInfo(trackName: "Test Name (feat.nipsey Hussle & johoholor) & long long name", artistName: "Test Artist", artworkUrl100: "https://picsum.photos/200", artworkUrl60: "https://picsum.photos/200", previewUrl: "Demo Url", trackId: 0)
    
    var id: Int {trackId}
    var trackName = ""
    var artistName = ""
    var artworkUrl100 = ""
    var artworkUrl60 = ""
    var previewUrl = ""
    let trackId: Int
    var collectionName = ""
}

struct TracksResponse: Decodable {
    let resultCount : Int
    let results : [TrackInfo]
}
