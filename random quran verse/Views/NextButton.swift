import SwiftUI

struct NextButton: View {
    var action: () -> Void

    var body: some View {
        Button("Next", action: action)
    }
}

struct NextButton_Previews: PreviewProvider {
    static var previews: some View {
        NextButton(action: {})
    }
}
