import UIKit

public extension NSLayoutDimension {
    
    /// Sets dimension to a constant value
    ///
    /// - Parameters:
    ///   - constant: Value to set
    ///   - priority: Priority of the constraint (defaults to required)
    /// - Returns: Already activated NSLayoutConstraint instance
    /// - Example: view.widthAnchor.cuiSet(to: CGFloat(50.0))
    @discardableResult
    func cuiSet(
        to constant: CGFloat,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {
        
        let cons = constraint(equalToConstant: constant)
        cons.priority = priority
        cons.isActive = true
        return cons
    }
}
