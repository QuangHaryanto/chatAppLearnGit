//
//  ChatList.swift
//  chatappLearn
//
//  Created by Haryanto Salim on 17/04/23.
//

import SwiftUI

struct PlayerView: View {
    let name: String

    var body: some View {
        Text("Selected player: \(name)")
            .font(.largeTitle)
    }
}


struct ChatList: View {
    @State var isSearchBar: Bool = false
    @State private var searchText = ""
    
    let friends = [
        "Rogie",
        "Justin",
        "Kurniawan",
        "Rogie, Justin",
        "Jamie, Roy",
        "Athoya",
        "Haryanto"
    ]
    
    var body: some View {
        
        NavigationStack {
            
            List(searchResults, id: \.self) { player in
                NavigationLink {
                    Chat()
                } label: {
                    Text(player)
                }
            }
            .navigationTitle("Chats")
//            .navigationBarItems(trailing:
//                                    HStack {
//                Button {
//                    isSearchBar.toggle()
//                } label: {
//                    Image(systemName: "magnifyingglass")
//                }
//
//
//            })
            
        }
        .searchable(text: $searchText) {
//            ForEach(searchResults, id: \.self) { result in
//                Text("\(result)").searchCompletion(result)
//            }
        }
    }
    
    var searchResults: [String] {
            if searchText.isEmpty {
                return friends
            } else {
                return friends.filter { $0.contains(searchText) }
            }
        }
    
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}
