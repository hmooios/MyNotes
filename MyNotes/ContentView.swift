

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
    @State private var isEditing = false
    @State private var selectedCategory: String?


    var body: some View {
        NavigationView {
            List {
                ForEach(notesManager.notes) { note in
                    NavigationLink(destination: NoteDetailView(note: note)) {
                        VStack(alignment:.leading){
                            
                                Text(note.title)
                            
                            Text(note.date, formatter: dateFormatter)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete{indexSet in
                    notesManager.deleteNote(at: indexSet.first!)
                    
                }
            }

            .navigationTitle("My notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            isEditing.toggle()
                        }
                }
                ToolbarItem {
                    Button {
                        isShowingNewNoteFormView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingNewNoteFormView) {
                NewNoteFormView(notesManager: notesManager, isShowingNewNoteFormView: $isShowingNewNoteFormView,
                                categorySelectionHandler: { selectedCategory  in
                                    self.selectedCategory = selectedCategory
                                }
                )
            }
        }
    }

    private var dateFormatter: DateFormatter  {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }

    func deleteEntry(at index: IndexSet) {
        notesManager.notes.remove(atOffsets: index)
    }

   
    }



#Preview {
    ContentView()
}
