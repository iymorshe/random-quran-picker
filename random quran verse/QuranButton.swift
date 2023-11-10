import SwiftUI

struct QuranButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.white)
                .padding(15)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.black))
                .compositingGroup()
                .shadow(color: .black, radius: 3)
        }
    }
}
