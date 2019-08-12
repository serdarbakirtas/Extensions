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
    
    /// Sets dimension to a constant value as less than or equal to
    ///
    /// - Parameters:
    ///   - constant: Value to set
    ///   - priority: Priority of the constraint (defaults to required)
    /// - Returns: Already activated NSLayoutConstraint instance
    /// - Example: view.widthAnchor.cuiSet(lessThanOrEqualTo: CGFloat(50.0))
    @discardableResult
    func cuiSet(
        lessThanOrEqualTo constant: CGFloat,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {
        
        let cons = constraint(lessThanOrEqualToConstant: constant)
        cons.priority = priority
        cons.isActive = true
        return cons
    }
    
    /// Sets dimension to a constant value as greater than or equal to
    ///
    /// - Parameters:
    ///   - constant: Value to set
    ///   - priority: Priority of the constraint (defaults to required)
    /// - Returns: Already activated NSLayoutConstraint instance
    /// - Example: view.widthAnchor.cuiSet(greaterThanOrEqualTo: CGFloat(50.0))
    @discardableResult
    func cuiSet(
        greaterThanOrEqualTo constant: CGFloat,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {
        
        let cons = constraint(greaterThanOrEqualToConstant: constant)
        cons.priority = priority
        cons.isActive = true
        return cons
    }
    
    /// Sets dimension to another one with multiplier
    ///
    /// - Parameters:
    ///   - dimension: Dimension to set
    ///   - multiplier: Multiplier to be applied (defaults to 1)
    ///   - priority: Priority of the constraint (defaults to required)
    /// - Returns: Already activated NSLayoutConstraint instance
    /// - Example: view1.heightAnchor.cuiSet(to: view2.heightAnchor, multiplier: CGFloat(0.5))
    @discardableResult
    func cuiSet(
        to dimension: NSLayoutDimension,
        multiplier: CGFloat = CGFloat(1.0),
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {
        
        let cons = constraint(equalTo: dimension, multiplier: multiplier)
        cons.priority = priority
        cons.isActive = true
        return cons
    }
    
    /// Sets dimension to another one with multiplier as less than or equal to
    ///
    /// - Parameters:
    ///   - dimension: Dimension to set
    ///   - multiplier: Multiplier to be applied (defaults to 1)
    ///   - priority: Priority of the constraint (defaults to required)
    /// - Returns: Already activated NSLayoutConstraint instance
    /// - Example: view1.heightAnchor.cuiSet(lessThanOrEqualTo: view2.heightAnchor, multiplier: CGFloat(0.5))
    @discardableResult
    func cuiSet(
        lessThanOrEqualTo dimension: NSLayoutDimension,
        multiplier: CGFloat = CGFloat(1.0),
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {
        
        let cons = constraint(lessThanOrEqualTo: dimension, multiplier: multiplier)
        cons.priority = priority
        cons.isActive = true
        return cons
    }
    
    
}
