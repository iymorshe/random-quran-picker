import SwiftUI

struct VerseButtonView: View {
    @ObservedObject var viewModel: QuranVerseViewModel

    var body: some View {
        Button("Generate") {
            viewModel.newUpdateVerse()
        }
        .buttonStyle(DefaultButtonStyle()) // Replace with your custom button style if needed
    }
}

struct DefaultButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
