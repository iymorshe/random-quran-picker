import SwiftUI

struct ItemInformation {
    var title: String
    var startingPoint: Int
    var endingPoint: Int
}

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    @State private var text: String = ""
    @State private var start: Int = 0
    @State private var end: Int  = 113
    @State private var items: [ItemInformation] = []
    
    var body: some View {
        
        NavigationView {
           
            ZStack {
                VStack {
                    Text("My Quran Pickers")
                        .font(.title)
                        .padding(.top, 20) // Add padding to the top
                    
                    Spacer() // Add spacer to create space between the title and the list
                    
                    List(self.items, id: \.title) { item in
                        NavigationLink(destination: GenerateAyah(start: .constant(item.startingPoint), end: .constant(item.endingPoint))) {
                            Text("\(item.title) \(item.startingPoint-1) \(item.endingPoint-1)")
                        }
                    }
                }
                
                AZAlert(title: "Add Item", isShown: $isPresented, text: $text, start: $start, end: $end, onDone: { text, start, end in
                    let newItem = ItemInformation(title: text, startingPoint: start+1, endingPoint: end+1)
                    self.items.append(newItem)
                    printItems() // Print items list to console
                })
                
            }
            
            .navigationBarItems(trailing: Button("Add Item") {
                self.isPresented = true
            })
            .navigationBarItems(trailing: Button("Edit") { // Add Edit button
                self.items.removeAll()
                printItems() // Print items list to console
            })
         
        }
    }
    
    // Function to delete items
    private func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        printItems() // Print items list to console
    }
    
    // Function to print items list to console
    private func printItems() {
        print("Items List:")
        for item in items {
            print("\(item.title) \(item.startingPoint) \(item.endingPoint)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
