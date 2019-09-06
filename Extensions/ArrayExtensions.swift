/import Foundation

public extension Collection {

    /// Safe subscript, returns the element if index within bounds, nil otherwise
    ///
    /// - Parameter index: Index of the desired element
    public subscript(safe index: Index) -> Element? {

        return indices.contains(index) ? self[index] : nil
    }
}

public extension Array where Element: Hashable {

    /// Item that is sitting at given amount of index after of the given item
    ///
    /// - Parameters:
    ///   - position: Index that will be added to given item's index
    ///   - item: Item
    /// - Returns: The item if it's there, nil if index out of bounds
    public func item(after position: Index, of item: Element) -> Element? {

        if let index = self.index(of: item) {

            return self[safe: index + position]
        }

        return nil
    }

}