//
//  TrackPreviewView.swift
//  PedanMusic
//
//  Created by Andrey Pedan on 07.10.2024.
//

import SwiftUI

struct TrackPreviewView: View {
    let trackInfo : TrackInfo
    @StateObject var previewViewModel = TrackPreviewViewModel()
    @EnvironmentObject var searchViewModel : SearchViewModel
    
    var body: some View {
        NavigationLink(destination: TrackPlayerView(trackInfo: trackInfo)
            .environmentObject(searchViewModel)) {
            
            HStack {
                if let image = previewViewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                } else {
                    ProgressView()
                        .frame(width: 48, height: 48)
                }
                Spacer()
                VStack {
                    Text(trackInfo.processedTrackName)
                        .font(.system(size: 16))
                        .padding(1)
                        .lineLimit(1)
                        .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    Text(trackInfo.artistName)
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                        .lineLimit(1)
                        .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
        .onAppear {
            previewViewModel.tryFetchImageByUrl(for: trackInfo.processedUrl60)
        }
    }
}

#Preview {
    TrackPreviewView(trackInfo: TrackInfo.TestTrack)
}
