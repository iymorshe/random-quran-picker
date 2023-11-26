//
//  ContentView.swift
//  swiftuidev15ios
//
//  Created by Cairocoders
//

import SwiftUI

struct endSurahPicker: View {
    let surahNames = random_quran_verse.surahNames
    @State private var selectedSurahIndex: Int
    let labelText: String
    @Binding var selectedSurah: Int // Added binding variable
    @Binding var validStart: Int // Added validStart parameter
    
    init(labelText: String, selectedSurah: Binding<Int>, validStart: Binding<Int>) {
        self.labelText = labelText
        self._selectedSurah = selectedSurah
        self._selectedSurahIndex = State(initialValue: selectedSurah.wrappedValue)
        self._validStart = validStart}

    var body: some View {
        Form {
            Section() {
                Picker(labelText, selection: $selectedSurahIndex) {
                    ForEach(validStart..<115, id: \.self) { index in
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

struct endSurahPicker_Previews: PreviewProvider {
    static var previews: some View {
        endSurahPicker(labelText: "Starting Surah", selectedSurah: .constant(33), validStart: .constant(20))
    }
}
