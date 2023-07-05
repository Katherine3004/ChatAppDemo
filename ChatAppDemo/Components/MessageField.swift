//
//  MessageField.swift
//  ChatAppDemo
//
//  Created by Katherine Chambers on 2023/06/30.
//

import SwiftUI

struct MessageField: View {
    
    @EnvironmentObject var messagesManager: MessageManager
    
    @State private var message = ""
    
    var body: some View {
        HStack {
            CustomTextField(text: $message, placeholder: Text("Enter your message here"))
            
            Button(action: {
                messagesManager.sendMessage(text: message)
                message = ""
            }, label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("Peach"))
                    .cornerRadius(50)
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
            .environmentObject(MessageManager())
    }
}

struct CustomTextField: View {
    
    @Binding var text: String
    
    var placeholder: Text
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
