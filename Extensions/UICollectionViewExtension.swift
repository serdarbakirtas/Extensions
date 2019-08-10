import UIKit

// MARK: - Register&Dequeue

public extension UICollectionView {
    
    // MARK: - Register & Dequeue
    
    /// Registers a `NibLoadable`, `Reusable` cell
    ///
    /// - Parameter type: Type of the table view cell
    func cuiRegisterCell<T: NibLoadable & Reusable>(type: T.Type) {
        
        register(type.nib, forCellWithReuseIdentifier: type.reuseIdentifier)
    }
    
    /// Registers a `NibLoadable`, `Reusable` header footer view
    ///
    /// - Parameter type: Type of the header footer view
    func cuiRegisterHeaderFooterView<T: NibLoadable & Reusable>(type: T.Type) {
        
        register(type.nib, forCellWithReuseIdentifier: type.reuseIdentifier)
    }
    
    /// Dequeues a `Reusable` cell
    ///
    /// - Parameter indexPath: Index path of the cell
    /// - Returns: A `Reusable` cell instance
    func cuiDequeueCell<T: Reusable>(for indexPath: IndexPath) -> T {
        
        // swiftlint:disable force_cast
        let dequeued = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
        return dequeued
    }
    
    /// Returns cell which is visible
    ///
    /// - Parameter indexPath: Index path of the cell
    /// - Returns: A `Reusable` cell instance or nil if not available
    func cuiCell<T: Reusable>(for indexPath: IndexPath) -> T? {
        
        if let visibleCell = cellForItem(at: indexPath) as? T {
            return visibleCell
        }
        return nil
    }
}
