import SwiftUI

struct GenerateAyah: View {
    @Binding var start: Int
    @Binding var end: Int
    @StateObject private var viewModel: QuranVerseViewModel

    init(start: Binding<Int>, end: Binding<Int>) {
        _viewModel = StateObject(wrappedValue: QuranVerseViewModel(startingSurah: start.wrappedValue , endingSurah: end.wrappedValue ))
        _start = start
        _end = end
    }
    @State private var isGenerated = false

    var body: some View {
        VStack {
            VerseDisplayView(verse: viewModel.displayed,
                             translation: viewModel.translation,
                             reference: viewModel.ayahID)
            Button("Generate") {
                viewModel.newUpdateVerse()
                isGenerated = true
                //
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            

            if isGenerated {
                NextButton(action: {
                    viewModel.nextVerse()
                    
                })
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

struct GenerateAyah_Previews: PreviewProvider {
    static var previews: some View {
        GenerateAyah(start:.constant(50),end:.constant(50))
    }
}
