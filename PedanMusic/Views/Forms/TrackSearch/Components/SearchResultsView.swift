//
//  SearchResultsView.swift
//  PedanMusic
//
//  Created by Andrey Pedan on 03.10.2024.
//

import SwiftUI

struct SearchResultsView: View {
    var _tracks: [TrackInfo] = []
    @EnvironmentObject var searchViewModel : SearchViewModel
    var errorMessage: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0){
            Text("Results")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            if let str = errorMessage {
                Text(str)
                    .padding()
            }
            
            TracksContainerView(tracks:_tracks)
                .environmentObject(searchViewModel)
            Spacer()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .padding()
    }
}

#Preview {
    SearchResultsView(_tracks: [TrackInfo.TestTrack, TrackInfo.TestTrack])
}
