//import SwiftUI
//
//struct StartingPoint: View {
//    @State private var listItems: [String] = []
//    @State private var isCreating = false
//    @State private var newItemName = ""
//    @State private var newStart = ""
//    @State private var newEnd = ""
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(listItems, id: \.self) { item in
//                    NavigationLink(destination: ContentView(start: newStart, end: newEnd)) {
//                        Text(item)
//                    }
//                }
//            }
//            .navigationBarTitle("Select a Random Picker")
//            .navigationBarItems(trailing: Button("Add New") {
//                isCreating = true
//            })
//            .sheet(isPresented: $isCreating) {
//                NewItemView(isCreating: $isCreating, newItemName: $newItemName, newStart: $newStart, newEnd: $newEnd, listItems: $listItems)
//            }
//        }
//    }
//}
//
//struct NewItemView: View {
//    @Binding var isCreating: Bool
//    @Binding var newItemName: String
//    @Binding var newStart: String
//    @Binding var newEnd: String
//    @Binding var listItems: [String]
//
//    var body: some View {
//        VStack {
//            TextField("Name", text: $newItemName)
//            TextField("Starting Surah", text: $newStart)
//            TextField("Ending Surah", text: $newEnd)
//            Button("Submit") {
//                if !newItemName.isEmpty {
//                    listItems.append(newItemName)
//                    newItemName = ""
//                    isCreating = false
//                }
//            }
//            Button("Cancel") {
//                isCreating = false
//            }
//        }
//        .padding()
//    }
//}
//
//struct StartingPoint_Previews: PreviewProvider {
//    static var previews: some View {
//        StartingPoint()
//    }
//}
