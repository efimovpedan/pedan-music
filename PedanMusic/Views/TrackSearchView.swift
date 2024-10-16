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
    @StateObject var searchViewModel = SearchViewModel()
    
    @State var isValidString: Bool = false;
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(searchText: $searchText).onChange(of: searchText) { newValue in
                    isValidString = searchViewModel.isValidString(_string: newValue)
                    if(isValidString){
                        searchViewModel.tryFetchTracksByKeyWords(_string: newValue)
                    }
                }
                if(isValidString){
                    if searchViewModel.isLoading {
                        ProgressView()
                            .padding()
                    } else {
                        SearchResultsView(_tracks: searchViewModel.tracksInfos)
                            .environmentObject(searchViewModel)
                    }
                } else {
                    /*Button(action: {
                        searchViewModel.clearAllResentSearches()
                    }) {
                        Text("clear all recent seraches")
                    }*/
                    RecentSearchesView(_tracks: searchViewModel.resentSearchModel.resentSearches)
                        .environmentObject(searchViewModel)
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
