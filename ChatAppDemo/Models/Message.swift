//
//  Message.swift
//  ChatAppDemo
//
//  Created by Katherine Chambers on 2023/06/30.
//

import SwiftUI

struct Message: Identifiable, Codable {
    
    var id: String
    var text: String
    var recieved: Bool
    var timeStamp: Date
    
}
