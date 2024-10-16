//
//  ContentView.swift
//  PedanMusic
//
//  Created by Andrey Pedan on 02.10.2024.
//

import SwiftUI
import SwiftData

struct TrackSearchView: View {
    @State private var searchText: String = ""
    @StateObject private var viewModel = SearchViewModel()
    
    @State var isValidString: Bool = false;
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(searchText: $searchText).onChange(of: searchText) { newValue in
                    isValidString = viewModel.isValidString(_string: newValue)
                    if(isValidString){
                        viewModel.tryFetchTracksByKeyWords(_string: newValue)
                    }
                }
                if(isValidString){
                    if viewModel.isLoading {
                        ProgressView()
                            .padding()
                    } else {
                        SearchResultsView(_tracks: viewModel.tracksInfos, viewModel: viewModel)
                    }
                } else {
                    RecentSearchesView(_tracks: viewModel.searchModel.resentSearches, viewModel: viewModel)
                }
                Spacer()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(Color(.backgroundSecondary))
        }
        .navigationTitle("Track Search")
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TrackSearchView()
}
