//
//  ChatBubble.swift
//  chatappLearn
//
//  Created by Haryanto Salim on 17/04/23.
//

import SwiftUI

enum BubblePosition {
    case left
    case right
}

class ChatModel: ObservableObject {
    var text = ""
    @Published var arrayOfMessages : [String] = []
    @Published var arrayOfPositions : [BubblePosition] = []
    @Published var position = BubblePosition.right
}

struct ChatBubble<Content>: View where Content: View {
    let position: BubblePosition
    let color : Color
    let content: () -> Content
    init(position: BubblePosition, color: Color, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.color = color
        self.position = position
    }
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: position == .left ? .leading: .trailing){
                content()
                    .padding(.all, 3)
                    .foregroundColor(Color.black)
                    .background(color)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .shadow(color: color.opacity(1), radius: 6, x: 0, y: 3)
                
//                    .overlay(
//                        Image(systemName: "arrowtriangle.left.fill")
//                            .foregroundColor(color)
//                            .rotationEffect(Angle(degrees: position == .left ? -50 : -130))
//                            .offset(x: position == .left ? -5 : 5)
//                        ,alignment: position == .left ? .bottomLeading : .bottomTrailing)

                    GeometryReader { proxy in
                        HStack{
                            HStack{
                                Image(systemName: "person")
                                    .padding(.all, 5)
                                    .overlay(
                                        Capsule()
                                            .stroke(color, lineWidth: 3)
                                    )
                            }
                            .background(.white)
                            .clipShape(Capsule())
                            .shadow(color: color.opacity(0.5), radius: 6, x: 0, y: 3)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(color)
                            .font(.system(size: 17, weight: .bold))
                            .offset(x:position == .left ? proxy.size.width - 300 : proxy.size.width - 40 , y:-13)
                            
                            HStack{
                                HStack{
                                    Image(systemName: "heart")
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.red)
                                        .font(.system(size: 17, weight: .bold))
                                    Text("2")
                                        .font(.system(size: 12, weight: .bold))
                                }
                                .padding(.all, 5)
                                .overlay(
                                    Capsule()
                                        .stroke(color, lineWidth: 3)
                                )
                                
                            }
                                .background(.white)
                                .clipShape(Capsule())
                                .shadow(color: color.opacity(0.5), radius: 6, x: 0, y: 3)
                            .offset(x:position == .left ? proxy.size.width - 305 : proxy.size.width - 130 , y:-13)
                        }//.background(.yellow)
                    }//.background(.cyan)

            }
        }
        .padding(position == .left ? .leading : .trailing , 15)
        .padding(position == .right ? .leading : .trailing , 60)
        .frame(width: UIScreen.main.bounds.width, alignment: position == .left ? .leading : .trailing)
        
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(position: .left
                   , color: .blue, content: {
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.").padding(8).background(.white).cornerRadius(22)
        })
    }
}
