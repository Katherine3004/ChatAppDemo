//
//  MessageBubble.swift
//  ChatAppDemo
//
//  Created by Katherine Chambers on 2023/06/30.
//

import SwiftUI

struct MessageBubble: View {
    
    @State private var showTime = false
    
    var message: Message
    
    var alignment: Alignment {
        if message.recieved == true {
            return .leading
        }
        else {
            return .trailing
        }
    }
    
    var body: some View {
        VStack(alignment: message.recieved ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.recieved ? Color("Gray") : Color("Peach"))
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300, alignment: alignment)
            .onTapGesture {
                withAnimation {
                    showTime.toggle()
                }
            }
            if showTime {
                Text("\(message.timeStamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(message.recieved ? .leading : .trailing, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: alignment)
        .padding(message.recieved ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            MessageBubble(message: Message(id: "1", text: "Hello there", recieved: true, timeStamp: Date()))
            MessageBubble(message: Message(id: "2", text: "Hello there", recieved: false, timeStamp: Date()))
            MessageBubble(message: Message(id: "1", text: "Hello there", recieved: true, timeStamp: Date()))
            MessageBubble(message: Message(id: "2", text: "Hello there", recieved: false, timeStamp: Date()))
        }
    }
}
