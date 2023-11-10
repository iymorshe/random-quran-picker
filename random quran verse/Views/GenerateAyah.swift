import SwiftUI

struct GenerateAyah: View {
    @StateObject private var viewModel = QuranVerseViewModel()
    @State private var isGenerated = false

    var body: some View {
        VStack {
            VerseDisplayView(verse: viewModel.displayed,
                             translation: viewModel.translation,
                             reference: viewModel.ayahID)
            Button("Generate") {
                viewModel.updateVerse()
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
        GenerateAyah()
    }
}
