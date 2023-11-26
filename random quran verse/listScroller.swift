import SwiftUI

struct MultiComponentPicker: View  {
    @Binding var selectedSurahIndex: Int

    var body: some View {
        GeometryReader { geometry in
            Picker("", selection: $selectedSurahIndex) {
                ForEach(Array(Array(surahNames[1...]).enumerated()), id: \.1) { index, surahName in
                    Text("\(index+1). \(surahName)")
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: geometry.size.width, height: geometry.size.height)
            .clipped()
        }
    }
}

// MARK: - Demo preview
struct MultiComponentPicker_Previews: PreviewProvider {
    static var previews: some View {
        MultiComponentPicker(selectedSurahIndex: .constant(1))
            .frame(height: 300)
            .previewLayout(.sizeThatFits)
    }
}
//slice surahnames to get from index [1:]

