//
//  TrackPlayerView.swift
//  PedanMusic
//
//  Created by Andrey Pedan on 03.10.2024.
//

import SwiftUI

struct TrackPlayerView: View {
    let trackInfo : TrackInfo
    @StateObject var previewViewModel = TrackPreviewViewModel()
    
    var body: some View {
        VStack {
            VStack {
                Text(trackInfo.collectionName)
                    .fontWeight(.bold)
                    .padding(25)
                if let image = previewViewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 343, height: 343)
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                } else {
                    ProgressView()
                }
            }
      
            VStack(alignment: .leading) {
                Text(trackInfo.trackName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(trackInfo.artistName)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
          
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 100, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: .zero, alignment: .leading)
            .padding(25)
            
            HStack {
                Button(action: {
                    
                }) {
                    Image(systemName: "backward.fill")
                        .font(.system(size: 29))
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    
                }) {
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 68))
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    
                }) {
                    Image(systemName: "forward.fill")
                        .font(.system(size: 29))
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.backgroundSecondary))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        .onAppear {
            previewViewModel.tryFetchImageByUrl(for: trackInfo.artworkUrl100)
        }
    }
}

#Preview {
    TrackPlayerView(trackInfo: TrackInfo.TestTrack)
}
