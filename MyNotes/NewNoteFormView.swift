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
    @State private var showAlert=false
    @State private var selectedCategory = "Personal"
    let categories = ["Personal", "Education", "Finance", "Work", "Others"]
    var categorySelectionHandler: ((String) -> Void)?

    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Title", text: $title)
                    Picker("Category", selection: $selectedCategory) {
                                   ForEach(categories, id: \.self) { category in
                                       Text(category)
                                   }
                               }
                               .pickerStyle(MenuPickerStyle())
                               .padding()
                               
                   TextField("Wrtie something...", text: $content)

                }
                Section{
                    Button("Save") {
                        
                        if title.isEmpty{
                            showAlert=true
                        }else{
                            let newNote = Note(date: Date(), title: title, content: content)
                            notesManager.notes.append(newNote)
                            categorySelectionHandler?(selectedCategory) // Call the closure
                            dismiss()
                        }
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Fill the form"),
                    message: Text("You must fill at least title or content"),
                    dismissButton: .default(Text("I got it"))
                )
            }
        }
    }
}
//
//#Preview {
//    NewNoteFormView(note: Note.example)
//}
