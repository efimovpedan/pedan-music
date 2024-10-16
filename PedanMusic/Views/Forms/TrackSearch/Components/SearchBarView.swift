//
//  SearchBarView.swift
//  PedanMusic
//
//  Created by Andrey Pedan on 03.10.2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.backgroundPrimary))
                .frame(height: 50.0)
                .overlay {
                    HStack{
                        ZStack{
                            Rectangle()
                                .fill(Color(.searchBarBackground))
                                .cornerRadius(8)
                                .frame(width: 280, height: 30)
                            
                            HStack{
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor((.gray))
                                        .padding(10)
                                }
                                TextField("What do you want to listen to?", text: $searchText)
                                    .padding(-10)
                                
                            }
                            
                            .frame(width: 285, height: 30)
                        }
                        .padding(5)
                        Button("Cancel"){
                            searchText = ""
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
        }
    }
}

struct SearchBarView_Preview: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
