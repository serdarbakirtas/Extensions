/import Foundation

public extension Collection {

    /// Safe subscript, returns the element if index within bounds, nil otherwise
    ///
    /// - Parameter index: Index of the desired element
    public subscript(safe index: Index) -> Element? {

        return indices.contains(index) ? self[index] : nil
    }
}


