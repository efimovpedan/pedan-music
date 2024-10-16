//
//  TracksContainerView.swift
//  PedanMusic
//
//  Created by Andrey Pedan on 07.10.2024.
//

import SwiftUI

struct TracksContainerView: View {
    var tracks: [TrackInfo] = []
    @EnvironmentObject var searchViewModel : SearchViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(tracks) { track in
                    if case .track = track.processedWrapperType {
                        TrackPreviewView(trackInfo: track)
                            .environmentObject(searchViewModel)
                    }
                }
            }
            .padding()
        }
    }
}
    
#Preview {
    TracksContainerView(tracks: [TrackInfo.TestTrack, TrackInfo.TestTrack])
}
