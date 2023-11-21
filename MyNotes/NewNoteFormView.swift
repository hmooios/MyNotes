//
//  NewNoteFormView.swift
//  MyNotes
//
//  Created by Hmoo Myat Theingi on 20/11/2023.
//

import SwiftUI

struct NewNoteFormView: View {
    
    @ObservedObject var notesManager:NotesManager
    @Binding var isShowingNewNoteFormView:Bool
    @State private var title = ""
    @State private var content = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Title", text: $title)
                    TextEditor(text: $content)
                }
                Section{
                    Button("Save") {
                        let newNote = Note(title: title, content: content)
                        notesManager.notes.append(newNote)
                        dismiss()
                    }
                }
            }
        }
    }
}
//
//#Preview {
//    NewNoteFormView(note: Note.example)
//}
