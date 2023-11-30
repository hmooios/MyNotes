//
//  NotesManager.swift
//  MyNotes
//
//  Created by Hmoo Myat Theingi on 20/11/2023.
//

import SwiftUI

class NotesManager:ObservableObject{
    @Published var notes:[Note] = []
    
    init(){
        decodeNote()
    }
    
    func addNote(title:String,content:String){
        let newNote = Note(date: Date(), title: title, content: content)
        notes.append(newNote)
        encodeNote()
    }
    
    func deleteNote(at index:Int){
        notes.remove(at: index)
        encodeNote()
    }
    
    private func decodeNote(){
        let fileURL = getDocumentDirectory().appendingPathComponent("notes.txt")
        do {
            let data = try Data(contentsOf: fileURL)
          notes = try JSONDecoder().decode([Note].self, from: data)
        } catch  {
            print("Error loading notes\(error)")
        }
    }
    
    
    private func encodeNote(){
        let fileURL = getDocumentDirectory().appendingPathComponent("notes.txt")
        do {
            let data = try JSONEncoder().encode(notes)
            try data.write(to: fileURL, options: .atomic)
        } catch  {
            print("Error saving notes \(error)")
        }
    }
    
    private func getDocumentDirectory()->URL{
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return url
    }
}
