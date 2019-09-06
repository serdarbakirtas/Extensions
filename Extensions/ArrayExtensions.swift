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

    /// Item that is sitting at given amount of index before of the given item
    ///
    /// - Parameters:
    ///   - position: Index that will be substracted from the given item's index
    ///   - item: Item
    /// - Returns: The item if it's there, nil if index out of bounds
    public func item(before position: Index, of item: Element) -> Element? {

        return self.item(after: -position, of: item)
    }

}

public extension Array {

    /// Removes the given item (equatable) from the array
    ///
    /// - Parameter item: Item
    public mutating func remove<T: Equatable>(_ item: T) {

        self = filter { $0 as? T != item }
    }
}
