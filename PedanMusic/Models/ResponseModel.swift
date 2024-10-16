//
//  TrackModel.swift
//  PedanMusic
//
//  Created by Andrey Pedan on 07.10.2024.
//

import Foundation

struct TrackInfo: Codable, Identifiable {
    static let TestTrack = TrackInfo(wrapperType: "track", artistName: "long_long_long_artist_name", collectionName: "long colection name", kind: "song", trackId: 0, trackName: "track name", artworkUrl100: "https://picsum.photos/200", artworkUrl60: "https://picsum.photos/200", previewUrl: "")
    
    var id: String { trackId == nil ? UUID().uuidString : String(trackId!)}
    let wrapperType : String
    var artistName : String
    var collectionName : String
    
    let kind : String?
    let trackId: Int?
    private var trackName : String?
    
    var processedTrackName : String {
        trackName ?? "no_name"
    }
    
    var artworkUrl100 : String?
    var processedUrl100 : String {
        artworkUrl100 ?? ""
    }
    var artworkUrl60 : String?
    var processedUrl60 : String {
        artworkUrl60 ?? ""
    }
    var previewUrl : String?

    
}

struct TracksResponse: Decodable {
    let resultCount : Int
    let resultsTracks : [TrackInfo]
}
