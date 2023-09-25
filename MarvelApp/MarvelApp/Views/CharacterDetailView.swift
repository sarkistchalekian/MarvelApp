//
//  CharacterDetailView.swift
//  MarvelApp
//
//  Created by Sarkis Tchalekian on 21/09/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterDetailView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var viewModel = CharacterDetailViewModel()
    var utilities = Utilities()
    
    @State var character: Character
    @State var loadingText = "Character is Loading"
    
    @State var charSeries = [Series]()
    @State var comics = [Comic]()
    @State var events = [Event]()
    @State var stories = [Story]()
    
    @State var isLoading = true
    @State var errorOccured = false
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    
                    HStack {
                        WebImage(url: utilities.extractThumbnail(data: character.thumbnail))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150, alignment: .leading)
                            .cornerRadius(16)
                            .padding()
                        
                        Text("#\(character.id)")
                    }
                    .padding()
                    
                    if !character.description.isEmpty {
                        Text(character.description)
                            .padding()
                    }
                    
                    if comics.count != 0 {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Comics")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            ScrollView(.horizontal) {

                                HStack {
                                    ForEach(comics) { comic in
                                        
                                        VStack(alignment: .leading) {
                                            
                                            WebImage(url: utilities.extractThumbnail(data: comic.thumbnail))
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 100, height: 100, alignment: .leading)
                                                .cornerRadius(16)
                                                .padding()
                                            
                                            Text(comic.title)
                                                .frame(width: 100, height: 70)
                                        }
                                    }
                                }
                            }
                            
                        }
                        .frame(alignment: .leading)
                        .padding()
                        .background(colorScheme == .dark ? Color(.gray).opacity(0.25) : Color(.black).opacity(0.05))
                        .cornerRadius(16)
                    }


                    if charSeries.count != 0 {
                        
                        
                        VStack(alignment: .leading) {

                            Text("Series")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            ScrollView(.horizontal) {

                                HStack {
                                    ForEach(charSeries) { series in
                                        
                                        VStack(alignment: .leading) {
                                            
                                            WebImage(url: utilities.extractThumbnail(data: series.thumbnail))
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 100, height: 100, alignment: .leading)
                                                .cornerRadius(16)
                                                .padding()
                                            
                                            Text(series.title)
                                                .frame(width: 100, height: 70)
                                        }
                                    }
                                }
                            }
                        }
                        .frame(alignment: .leading)
                        .padding()
                        .background(colorScheme == .dark ? Color(.gray).opacity(0.25) : Color(.black).opacity(0.05))
                        .cornerRadius(16)
                    }
                    
                    if stories.count != 0 {
                        
                        
                        VStack(alignment: .leading) {

                            Text("Stories")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            ScrollView(.horizontal) {

                                HStack {
                                    ForEach(stories) { story in
                                        
                                        VStack(alignment: .leading) {
                                            
                                            WebImage(url: utilities.extractThumbnail(data: story.thumbnail))
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 100, height: 100, alignment: .leading)
                                                .cornerRadius(16)
                                                .padding()
                                            
                                            Text(story.title)
                                                .frame(width: 100, height: 70)
                                        }
                                    }
                                }
                            }
                        }
                        .frame(alignment: .leading)
                        .padding()
                        .background(colorScheme == .dark ? Color(.gray).opacity(0.25) : Color(.black).opacity(0.05))
                        .cornerRadius(16)
                    }
                    
                    if events.count != 0 {
                        
                        
                        VStack(alignment: .leading) {

                            Text("Events")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            ScrollView(.horizontal) {

                                HStack {
                                    ForEach(events) { event in
                                        
                                        VStack(alignment: .leading) {
                                            
                                            WebImage(url: utilities.extractThumbnail(data: event.thumbnail))
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 100, height: 100, alignment: .leading)
                                                .cornerRadius(16)
                                                .padding()
                                            
                                            Text(event.title)
                                                .frame(width: 100, height: 70)
                                        }
                                    }
                                }
                            }
                        }
                        .frame(alignment: .leading)
                        .padding()
                        .background(colorScheme == .dark ? Color(.gray).opacity(0.25) : Color(.black).opacity(0.05))
                        .cornerRadius(16)
                    }
                    
                }
            }
            .onAppear {
                viewModel.getComics(id: character.id) { result in
                    switch result {
                    case .success(let comics):
                        self.comics = comics
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
                viewModel.getEvents(id: character.id) { result in
                    switch result {
                    case .success(let events):
                        self.events = events
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
                viewModel.getStories(id: character.id) { result in
                    switch result {
                    case .success(let stories):
                        self.stories = stories
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
                viewModel.getSeries(id: character.id) { result in
                    switch result {
                    case .success(let series):
                        self.charSeries = series
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
        .navigationTitle(character.name)
    }
    
}


