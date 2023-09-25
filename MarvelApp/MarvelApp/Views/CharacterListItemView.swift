//
//  CharacterListItemView.swift
//  MarvelApp
//
//  Created by Sarkis Tchalekian on 21/09/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterListItemView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var utilities = Utilities()
    @State var character: Character
    
    var body: some View {
        NavigationLink(destination: {
            
            CharacterDetailView(character: character)
            
        }, label: {
           
            HStack {
                
                WebImage(url: utilities.extractThumbnail(data: character.thumbnail))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150, alignment: .leading)
                    .cornerRadius(16)
                    .padding()
                
                Text(character.name)
                    .font(.title)
                    .padding()
                
            }

        })
            .frame(width: 350, height: 150, alignment: .leading)
            .padding()
            .foregroundColor(.primary)
            .background(colorScheme == .dark ? Color(.gray).opacity(0.25) : Color(.black).opacity(0.05))
            .cornerRadius(16)

            
    }
}

//struct CustomListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterListItem()
//    }
//}
