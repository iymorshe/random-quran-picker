//
//  AZAlert.swift
//  HelloAlertSwiftUI
//
//  Created by Mohammad Azam on 7/29/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct AZAlert: View {
    
    let screenSize = UIScreen.main.bounds
    var title: String = ""
    @Binding var isShown: Bool
    @Binding var text: String
    @Binding var start: Int
    @Binding var end: Int
    var onDone: (String, Int, Int) -> Void = { _, _, _ in }
    var onCancel: () -> Void = { }
    
    
    var body: some View {
    
        VStack(spacing: 20) {
            Text(title)
                .font(.headline)
            TextField("Name", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .opacity(text.isEmpty ? 0.8 : 1.0)
            
//            surahPicker(labelText: "Starting Surah", selectedSurah: $start)
//            MultiComponentPicker(selectedSurahIndex: $start, selection: $start)
//            Text("Ending Surah")
//            endSurahPicker(labelText: "Ending Surah", selectedSurah: $end, validStart: $start)
            startSurahPicker(labelText: "Starting Surah", selectedSurah: $start, validStart: $end)
            endSurahPicker(labelText: "Ending Surah", selectedSurah: $end, validStart: $start)
//            MultiComponentPicker(
//                selectedSurahIndex: .constant(1),
//                selection: $start)
//            Text("Ending Surah")
//            MultiComponentPicker(
//                selectedSurahIndex: .constant(1),
//                selection: $end)
            HStack(spacing: 20) {
                Button("Done") {
                    self.isShown = false
                    self.onDone(self.text,self.start,self.end)
                }
                Button("Cancel") {
                    self.isShown = false
                    self.onCancel()
                }
            }
        }
        .padding()
        .frame(width: screenSize.width * 0.7, height: screenSize.height * 0.5)
        .background(Color(#colorLiteral(red: 0.9268686175, green: 0.9416290522, blue: 0.9456014037, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .offset(y: isShown ? 0 : screenSize.height)
//        .animation(.spring())
        .shadow(color: Color(#colorLiteral(red: 0.8596749902, green: 0.854565084, blue: 0.8636032343, alpha: 1)), radius: 6, x: -9, y: -9)

    }
}

struct AZAlert_Previews: PreviewProvider {
    static var previews: some View {
        AZAlert(title: "Add Item", isShown: .constant(true), text: .constant(""), start: .constant(0), end: .constant(113))
    }
}
