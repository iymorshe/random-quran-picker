import SwiftUI

struct VerseDisplayView: View {
    var verse: String
    var translation: String
    var reference: String

    var body: some View {
        VStack {
            Text(verse)
                .font(.title)
                .padding()
                .multilineTextAlignment(.center)

            Text(translation)
                .font(.subheadline)
                .padding()
                .multilineTextAlignment(.center)

            Text(reference)
                .font(.subheadline)
                .padding()
                .multilineTextAlignment(.center)
        }
    }
}

struct VerseDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        VerseDisplayView(verse: "In the name of Allah, the Entirely Merciful, the Especially Merciful.",
                         translation: "Bismillahirrahmanirrahim",
                         reference: "1:1")
    }
}
