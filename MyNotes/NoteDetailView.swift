//
//  NoteDetailView.swift
//  MyNotes
//
//  Created by Hmoo Myat Theingi on 20/11/2023.
//

import SwiftUI

struct NoteDetailView: View {
    var note:Note
    var body: some View {
        NavigationView{
            Text(note.content)
        }.navigationTitle(note.title)

    }
}

#Preview {
    NoteDetailView(note: Note.example)
}


#Preview {
    NoteDetailView()
}
