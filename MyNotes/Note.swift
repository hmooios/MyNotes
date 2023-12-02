//
//  Note.swift
//  MyNotes
//
//  Created by Hmoo Myat Theingi on 20/11/2023.
//

import Foundation

struct Note:Codable,Identifiable{
        var id = UUID()
        var title: String
        var content: String
        var date: Date
        var category: String
    
    static let example = Note(title:"Unknown title", content: "Unknown content", date: Date(),category: "Unknown category")
}


