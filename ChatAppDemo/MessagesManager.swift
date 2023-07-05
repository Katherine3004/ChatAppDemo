//
//  MessagesManager.swift
//  ChatAppDemo
//
//  Created by Katherine Chambers on 2023/06/30.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessageManager: ObservableObject {
    
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    
    let database = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        database.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetch documents: \(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                }
                catch {
                    print("Error decoding document into Message: \(error)")
                    return nil
                }
            }
            
            self.messages.sort { $0.timeStamp < $1.timeStamp}
            
            if let id = self.messages.last?.id {
                self.lastMessageId = id
                
            }
        }
    }
    
    func sendMessage(text: String) {
        do {
            let newMessage = Message(id: "\(UUID())", text: text, recieved: false, timeStamp: Date())
            
            try database.collection("messages").document().setData(from: newMessage)
        }
        catch {
            print("Error adding message to FireStore: \(error)")
        }
    }
}
