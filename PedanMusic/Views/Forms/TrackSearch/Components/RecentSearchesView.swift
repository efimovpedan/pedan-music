//
//  RecentSearchesView.swift
//  PedanMusic
//
//  Created by Andrey Pedan on 03.10.2024.
//

import SwiftUI

struct RecentSearchesView: View {
    var _tracks: [TrackInfo] = []
    @ObservedObject var viewModel : SearchViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0){
            Text("Recent searches")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            TracksContainerView(viewModel: viewModel, tracks: _tracks)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .padding()
    }
}

#Preview {
    RecentSearchesView(_tracks: [TrackInfo.TestTrack, TrackInfo.TestTrack], viewModel: SearchViewModel())
}
