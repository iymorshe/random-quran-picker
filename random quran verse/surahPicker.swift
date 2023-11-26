//
//  ContentView.swift
//  swiftuidev15ios
//
//  Created by Cairocoders
//

import SwiftUI

struct surahPicker: View {
    let surahNames = random_quran_verse.surahNames
    @State private var selectedSurahIndex: Int
    let labelText: String
    @Binding var selectedSurah: Int // Added binding variable
    
    init(labelText: String, selectedSurah: Binding<Int>) {
        self.labelText = labelText
        self._selectedSurah = selectedSurah
        self._selectedSurahIndex = State(initialValue: selectedSurah.wrappedValue)
    }

    var body: some View {
        Form {
            Section() {
                Picker(labelText, selection: $selectedSurahIndex) {
                    ForEach(1..<115) { index in
                        Text("\(index). \(surahNames[index])")
                    }
                }
            }
        }
        .onChange(of: selectedSurahIndex) { newValue in
            selectedSurah = newValue // Update the binding variable
        }
    }
}

struct surahPicker_Previews: PreviewProvider {
    static var previews: some View {
        surahPicker(labelText: "Starting Surah", selectedSurah: .constant(6))
    }
}

