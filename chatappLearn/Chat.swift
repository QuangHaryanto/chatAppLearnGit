//
//  Chat.swift
//  chatappLearn
//
//  Created by Haryanto Salim on 17/04/23.
//

import SwiftUI

//let navBarAppearence = UINavigationBarAppearance()

struct Chat: View {
    @ObservedObject var model = ChatModel()
    let navBarAppearence = UINavigationBarAppearance()
    var title: String
    
    init(title: String) {
        self.title = title
        navBarAppearence.configureWithOpaqueBackground()
            navBarAppearence.backgroundColor = .systemCyan
            navBarAppearence.titleTextAttributes = [.foregroundColor: UIColor.black]
            navBarAppearence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
                   
            UINavigationBar.appearance().standardAppearance = navBarAppearence
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearence
        }
    
    var body: some View {
        NavigationStack{
            GeometryReader { geo in
                VStack {
                    //MARK:- ScrollView
                    CustomScrollView(scrollToEnd: true) {
                        LazyVStack {
                            ForEach(0..<model.arrayOfMessages.count, id:\.self) { index in
                                ChatBubble(position: model.arrayOfPositions[index], color: model.arrayOfPositions[index] == BubblePosition.right ?.orange : .blue) {
                                    Text(model.arrayOfMessages[index])
                                        .padding(8).background(.white).cornerRadius(22)
                                }
                            }
                        }
                    }.padding(.top)
                    //MARK:- text editor
                    HStack {
                        ZStack {
                            TextEditor(text: $model.text)
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                                .foregroundColor(.gray)
                        }.frame(height: 50)
                        
                        
                        Button("send") {
                            if model.text != "" {
                                model.position = model.position == BubblePosition.right ? BubblePosition.left : BubblePosition.right
                                model.arrayOfPositions.append(model.position)
                                model.arrayOfMessages.append(model.text)
                                model.text = ""
                            }
                        }
                    }.padding()
                }
            }
        }.navigationTitle(title)
            .navigationBarItems(trailing:
                                    HStack {
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                }
                
                
            })
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat(title: "Room Title")
    }
}
