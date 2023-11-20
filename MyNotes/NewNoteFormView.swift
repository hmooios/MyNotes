//
//  NewNoteFormView.swift
//  MyNotes
//
//  Created by Hmoo Myat Theingi on 20/11/2023.
//

import SwiftUI

struct NewNoteFormView: View {
    @State private var title = ""
    @State private var content = ""
    
    

    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Title", text: $title)
                    TextEditor(text: $content)
                }
                Section{
                    Button("Save") {
                        <#code#>
                    }
                }
            }
        }
    }
}

#Preview {
    NewNoteFormView()
}
