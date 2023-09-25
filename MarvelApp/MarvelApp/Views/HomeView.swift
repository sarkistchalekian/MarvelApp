//
//  ContentView.swift
//  MarvelApp
//
//  Created by Sarkis Tchalekian on 21/09/2023.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    private var viewModel = HomeViewModel()
    
    @State var characters = [Character]()
    @State var loadingText = "Characters are Loading"
    
    @State var isLoading = true
    @State var errorOccured = false
    
    @State private var page = 1
    
    var body: some View {
        
        if isLoading {
            // ProgressView
            Text(loadingText)
                .onAppear {
                    viewModel.getCharacters(pageNumber: page) { response in
                        switch response {
                        case .success(let fetchedCharacters):
                            characters = fetchedCharacters
                            isLoading = false
                        case .failure(let error):
                            loadingText = error.localizedDescription
                            isLoading = false
                        }
                    }
                }
        } else {
            if !errorOccured {
                NavigationView {
                    ScrollView {
                        ForEach(characters) { character in
                            
                            CharacterListItemView(character: character)
                            
                        }
                        
                        Button("Load More") {
                            self.page += 1
                            viewModel.getCharacters(pageNumber: page) { result in
                                switch result {
                                case .success(let newCharacters):
                                    characters.append(contentsOf: newCharacters)
                                case .failure(let error):
                                    print(error.localizedDescription)
                                }
                            }
                        }
                        .padding()
                        .foregroundColor(.primary)
                        .background(colorScheme == .dark ? Color(.gray).opacity(0.25) : Color(.black).opacity(0.05))
                        .cornerRadius(16)
                        

                    }
                    .padding()
                    .navigationTitle("Marvel Characters")
                }
                
            } else {
                Text("tap to retry")
                    .onTapGesture {
                        isLoading = true
                    }
            }
        }
        
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
