//
//  test.swift
//  random quran verse
//
//  Created by Iman Morshed on 11/18/23.
//

import SwiftUI

struct inputButton: View {
    @State private var isCreating = false
    @State private var name = ""
    @State private var start = ""
    @State private var end = ""

    var body: some View {
        Button("New") {
            isCreating.toggle()
        }
        .alert("", isPresented: $isCreating) {
            TextField("Name", text: $name)
            Field("Starting Surah", text: $start)
            TextField("Ending Surah", text: $start)
            
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please enter your username and password.")
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        inputButton()
    }
}
