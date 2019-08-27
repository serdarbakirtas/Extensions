import Foundation

extension Date {
    
    func daysBetween(date: Date) -> Int {
        return Date.daysBetween(start: self, end: date)
    }
    
    static func daysBetween(start: Date, end: Date) -> Int {
        let calendar = Calendar.current
        
        
        let date1 = calendar.startOfDay(for: start)
        let date2 = calendar.startOfDay(for: end)
        
        let a = calendar.dateComponents([.day], from: date1, to: date2)
        return a.value(for: .day)!
    }
    
    func currentDate() -> Date {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: date)
        
        
        // TODO - remove guard let
        let now = dateFormatter.date(from: formattedDate)
        guard let nowDate = now else { return Date() }
        return nowDate
    }
}
