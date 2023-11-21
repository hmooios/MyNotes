//
//  ContentView.swift
//  MyNotes
//
//  Created by Hmoo Myat Theingi on 20/11/2023.
//


import SwiftUI

struct ContentView: View {
    @ObservedObject var notesManager = NotesManager()
    @State private var isShowingNewNoteFormView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(notesManager.notes) { note in
                    NavigationLink(destination: NoteDetailView()) {
                        Text(note.title)
                    }
                }
            }
            .navigationTitle("My notes")
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingNewNoteFormView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingNewNoteFormView) {
                NewNoteFormView(notesManager: notesManager, isShowingNewNoteFormView: $isShowingNewNoteFormView)
            }
          
           
        }
    }
}

#Preview {
    ContentView()
}


