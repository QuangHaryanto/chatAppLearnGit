//
//  ContentView.swift
//  chatappLearn
//
//  Created by Haryanto Salim on 17/04/23.
//

import SwiftUI

let navBarAppearence = UINavigationBarAppearance()

struct ContentView: View {
    init() {
            navBarAppearence.configureWithOpaqueBackground()
            navBarAppearence.backgroundColor = .systemCyan
            navBarAppearence.titleTextAttributes = [.foregroundColor: UIColor.black]
            navBarAppearence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                   
            UINavigationBar.appearance().standardAppearance = navBarAppearence
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearence
        }
    
    var body: some View {
        TabView {
            ChatList()
                .tabItem {
                    Label("Chats", systemImage: "bubble.left.and.bubble.right")
                }
            ChatList()
                .tabItem {
                    Label("Faves", systemImage: "star")
                }
            ChatList()
                .tabItem {
                    Label("Stickers", systemImage: "square.and.pencil")
                }
            ChatList()
                .tabItem {
                    Label("Activity", systemImage: "list.clipboard")
                }
            ChatList()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
