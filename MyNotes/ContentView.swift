//
//  ContentView.swift
//  MyNotes
//
//  Created by Hmoo Myat Theingi on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var notesManager = NotesManager()
    @State private var isShowingAddNewNoteForm = false
    var body: some View {
        NavigationView{
            List{
                ForEach(notesManager.notes){note in
                    NavigationLink {
                        NoteDetailView()
                    } label: {
                        Text(note.title)
                    }
                }
            }
            .navigationTitle("My notes")
            .toolbar{
                ToolbarItem {
                    Button{
                        isShowingAddNewNoteForm=true
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddNewNoteForm) {
                                NewNoteFormView()
                                }
            
        }
    }
}
    
    #Preview {
        ContentView()
    }

