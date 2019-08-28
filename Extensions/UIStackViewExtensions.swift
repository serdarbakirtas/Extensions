import Foundation
import UIKit

// MARK: - Register&Dequeue

public extension UIStackView {
    
    /// Dequeues a `Reusable` cell
    ///
    /// - Parameter indexPath: Index path of the cell
    /// - Returns: A `Reusable` cell instance
    
    func cuiArangeSubview<T: Reusable>(type: T.Type) -> T {
        
        let dequeued = UINib(nibName: T.reuseIdentifier, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! T
        addArrangedSubview(dequeued as! UIView)
        return dequeued
    }
}

