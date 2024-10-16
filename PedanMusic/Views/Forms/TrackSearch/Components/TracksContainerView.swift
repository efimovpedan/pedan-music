//
//  TracksContainerView.swift
//  PedanMusic
//
//  Created by Andrey Pedan on 07.10.2024.
//

import SwiftUI

struct TracksContainerView: View {
    @ObservedObject var viewModel : SearchViewModel
    var tracks: [TrackInfo] = []
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(tracks) { track in
                    TrackPreviewView(trackInfo: track, searchViewModel: viewModel)
                }
            }
            .padding()
        }
    }
}
    
#Preview {
    TracksContainerView(viewModel: SearchViewModel(), tracks: [TrackInfo.TestTrack, TrackInfo.TestTrack])
}
