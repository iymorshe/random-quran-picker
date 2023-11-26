//
//  surahRanger.swift
//  random quran verse
//
//  Created by Iman Morshed on 11/24/23.
//

import SwiftUI

struct surahRanger: View {
    var body: some View {
        VStack {
            surahPicker(labelText: "hamood", selectedSurah: .constant(0))
            surahPicker(labelText: "hamood", selectedSurah: .constant(0))
        }
    }
}

struct surahRanger_Previews: PreviewProvider {
    static var previews: some View {
        surahRanger()
    }
}
