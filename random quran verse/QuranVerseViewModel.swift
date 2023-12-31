import Foundation

class QuranVerseViewModel: ObservableObject {
    var startingSurah: Int
    var endingSurah: Int
    
    init(startingSurah: Int, endingSurah: Int) {
        self.startingSurah = startingSurah
        self.endingSurah = endingSurah
    }
    @Published var displayed: String = "Get a Random Ayah!"
    @Published var translation: String = ""
    @Published var ayahID: String = ""
    
    @Published var currentSurah: Int = 1
    @Published var nextAyah: Int = 1
    
//    func updateVerse() {
//        fetchQuranVerse(start: 0, end: 113) { [weak self] resultList in
//            DispatchQueue.main.async {
//                guard let self = self, let resultList = resultList else { return }
//                self.displayed = resultList[0]
//                self.translation = resultList[1]
//                self.ayahID = resultList[2]
//                self.parseAyahID()
//                print(self.ayahID)
//            }
//        }
//    }
    func newUpdateVerse() {
        fetchQuranVerse(start: startingSurah, end: endingSurah) { [weak self] resultList in
            DispatchQueue.main.async {
                guard let self = self, let resultList = resultList else { return }
                print(resultList)
                self.displayed = resultList[0]
                self.translation = resultList[1]
                self.ayahID = resultList[2]
                self.parseAyahID()
            }
        }
    }
    func parseAyahID() {
        let parts = ayahID.split(separator: " ")
        if parts.count >= 2, let lastPart = parts.last {
            let numbers = lastPart.split(separator: ":")
            if numbers.count == 2, let surah = Int(numbers[0]), let ayah = Int(numbers[1]) {
                self.currentSurah = surah
                self.nextAyah = ayah
                // Call nextVerse with these numbers
            }
        }
    }
    
    func nextVerse() {
        nextQuranVerse(surahNumber: self.currentSurah, verseNumber: self.nextAyah+1) { [weak self] resultList in
            DispatchQueue.main.async {
                guard let self = self, let resultList = resultList else { return }
                self.displayed = resultList[0]
                self.translation = resultList[1]
                self.ayahID = resultList[2]
                self.parseAyahID()
                print(self.ayahID)
            }
            
        }
    }
}
