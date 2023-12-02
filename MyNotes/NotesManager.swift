//
//  NotesManager.swift
//  MyNotes
//
//  Created by Hmoo Myat Theingi on 20/11/2023.
//

import Foundation

class NotesManager: ObservableObject {
    @Published var notes: [Note] = []

    init() {
        loadNotes()
    }

    private var fileURL: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentsDirectory.appendingPathComponent("notes.json")
    }

    func addNote(_ note: Note) {
        notes.append(note)
        saveNotes()
    }

    func deleteNote(at index: Int) {
        notes.remove(at: index)
        saveNotes()
    }

    private func loadNotes() {
        do {
            let data = try Data(contentsOf: fileURL)
            notes = try JSONDecoder().decode([Note].self, from: data)
        } catch {
            print("Error loading notes: \(error)")
        }
    }

    private func saveNotes() {
        do {
            let data = try JSONEncoder().encode(notes)
            try data.write(to: fileURL, options: .atomic)
        } catch {
            print("Error saving notes: \(error)")
        }
    }
}
