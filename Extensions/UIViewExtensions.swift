import Foundation
import UIKit

extension UIView {
    
    func applyBorder(
        color: UIColor = .black,
        width: CGFloat = AppState.UI.View.borderWidth
        ) {

        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }

    func roundCorners(cornerRadius: CGFloat = AppState.UI.View.cornerRadius) {

        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    
    func animateVisible(_ setVisible: Bool, duration: TimeInterval = 0.3) {
        
        if setVisible {
            alpha = 0.0
            isHidden = false
        }
        
        UIView.animate(
            withDuration: duration,
            animations: {
                let alpha: CGFloat = setVisible ? 1.0 : 0.0
                self.alpha = alpha
        },
            completion: { (isDoneAnimating) in
                
                if isDoneAnimating {
                    self.isHidden = !setVisible
                }
        })
    }
    
    func animateAlpha(_ setVisible: Bool, duration: TimeInterval = 0.3) {
        
        if setVisible {
            alpha = 0.0
        }
        
        UIView.animate(
            withDuration: duration,
            animations: {
                let alpha: CGFloat = setVisible ? 1.0 : 0.0
                self.alpha = alpha
        },
            completion: { (isDoneAnimating) in
                
                if isDoneAnimating {
                }
        })
    }
    
    func animatePosition(_ setVisible: Bool, duration: TimeInterval = 0.3) {
        
        if setVisible {
            alpha = 0.0
            isHidden = false
        }
        
        self.transform = CGAffineTransform(
            translationX: -150,
            y: 0)
        
        UIView.animate(
            withDuration: duration,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 1 ,
            options: .curveEaseOut,
            animations: {
                
                self.transform = CGAffineTransform(
                    translationX: 0,
                    y: 0)
        })
        
        UIView.animate(
            withDuration: duration,
            animations: {
                let alpha: CGFloat = setVisible ? 1.0 : 0.0
                self.alpha = alpha
        },
            completion: { (isDoneAnimating) in
                
                if isDoneAnimating {
                    self.isHidden = !setVisible
                }
        })
    }
}

public extension UIView {
    
    /// Pins view to superview
    ///
    /// - Parameters:
    ///   - insets: Edge insets (defaults to .zero)
    ///   - shouldRespectSafeArea: Whether safe area should be respected or not (defaults to true)
    /// - Returns: Added layout constraints array. In leading, trailing, top, bottom order
    /// - Example: view.cuiPinToSuperView(with: UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0))
    /// - Warning: Uses insets.left for leading and insets.right for trailing everytime (even layout direction is right to left)
    @discardableResult
    func cuiPinToSuperview(
        with insets: UIEdgeInsets = .zero,
        shouldRespectSafeArea: Bool = true
        ) -> [NSLayoutConstraint] {
        
        guard superview != nil else {
            return []
        }
        
        var constraints: [NSLayoutConstraint] = []
        
        if let leading = cuiPinLeadingToSuperView(
            constant: insets.left,
            shouldRespectSafeArea: shouldRespectSafeArea
            ) {
            
            constraints.append(leading)
        }
        
        if let trailing = cuiPinTrailingToSuperView(
            constant: insets.right,
            shouldRespectSafeArea: shouldRespectSafeArea
            ) {
            constraints.append(trailing)
        }
        
        if let top = cuiPinTopToSuperView(
            constant: insets.top,
            shouldRespectSafeArea: shouldRespectSafeArea
            ) {
            constraints.append(top)
        }
        
        if let bottom = cuiPinBottomToSuperView(
            constant: insets.bottom,
            shouldRespectSafeArea: shouldRespectSafeArea
            ) {
            constraints.append(bottom)
        }
        
        return constraints
    }
    
    /// Pins leading anchor to superview's leading anchor
    ///
    /// - Parameters:
    ///   - constant: Constant to be applied between anchors
    ///   - shouldRespectSafeArea: Whether safe area should be respected or not (defaults to true)
    /// - Returns: Already activated `NSLayoutConstraint` instance or nil if view has no superview
    @discardableResult
    func cuiPinLeadingToSuperView(
        constant: CGFloat = 0.0,
        shouldRespectSafeArea: Bool = true
        ) -> NSLayoutConstraint? {
        
        guard let superview = superview else {
            return nil
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        guard #available(iOS 11.0, *),
            superview.responds(to: #selector(getter: safeAreaLayoutGuide)) else {
                
                return leadingAnchor.cuiDock(
                    to: superview.leadingAnchor,
                    constant: constant
                )
        }
        
        return leadingAnchor.cuiDock(
            to: shouldRespectSafeArea ? superview.safeAreaLayoutGuide.leadingAnchor : superview.leadingAnchor,
            constant: constant
        )
    }
    
    /// Pins trailing anchor to superview's trailing anchor
    ///
    /// - Parameters:
    ///   - constant: Constant to be applied between anchors
    ///   - shouldRespectSafeArea: Whether safe area should be respected or not (defaults to true)
    /// - Returns: Already activated `NSLayoutConstraint` instance or nil if view has no superview
    @discardableResult
    func cuiPinTrailingToSuperView(
        constant: CGFloat = 0.0,
        shouldRespectSafeArea: Bool = true
        ) -> NSLayoutConstraint? {
        
        guard let superview = superview else {
            return nil
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        guard #available(iOS 11.0, *),
            superview.responds(to: #selector(getter: safeAreaLayoutGuide)) else {
                
                return trailingAnchor.cuiDock(
                    to: superview.trailingAnchor,
                    constant: constant
                )
        }
        
        return trailingAnchor.cuiDock(
            to: shouldRespectSafeArea ? superview.safeAreaLayoutGuide.trailingAnchor : superview.trailingAnchor,
            constant: constant
        )
    }
    
    /// Pins top anchor to superview's top anchor
    ///
    /// - Parameters:
    ///   - constant: Constant to be applied between anchors
    ///   - shouldRespectSafeArea: Whether safe area should be respected or not (defaults to true)
    /// - Returns: Already activated `NSLayoutConstraint` instance or nil if view has no superview
    @discardableResult
    func cuiPinTopToSuperView(
        constant: CGFloat = 0.0,
        shouldRespectSafeArea: Bool = true
        ) -> NSLayoutConstraint? {
        
        guard let superview = superview else {
            return nil
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        guard #available(iOS 11.0, *),
            superview.responds(to: #selector(getter: safeAreaLayoutGuide)) else {
                
                return topAnchor.cuiDock(
                    to: superview.topAnchor,
                    constant: constant
                )
        }
        
        return topAnchor.cuiDock(
            to: shouldRespectSafeArea ? superview.safeAreaLayoutGuide.topAnchor : superview.topAnchor,
            constant: constant
        )
    }
    
    /// Pins bottom anchor to superview's bottom anchor
    ///
    /// - Parameters:
    ///   - constant: Constant to be applied between anchors
    ///   - shouldRespectSafeArea: Whether safe area should be respected or not (defaults to true)
    /// - Returns: Already activated `NSLayoutConstraint` instance or nil if view has no superview
    @discardableResult
    func cuiPinBottomToSuperView(
        constant: CGFloat = 0.0,
        shouldRespectSafeArea: Bool = true
        ) -> NSLayoutConstraint? {
        
        guard let superview = superview else {
            return nil
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        guard #available(iOS 11.0, *),
            superview.responds(to: #selector(getter: safeAreaLayoutGuide)) else {
                
                return bottomAnchor.cuiDock(
                    to: superview.bottomAnchor,
                    constant: constant
                )
        }
        
        return bottomAnchor.cuiDock(
            to: shouldRespectSafeArea ? superview.safeAreaLayoutGuide.bottomAnchor : superview.bottomAnchor,
            constant: constant
        )
    }
    
    /// Centers view in superview
    ///
    /// - Returns: Added layout constraints array (centerX, centerY order) or nil if it has no superview
    /// - Example: view.cuiCenterInSuperView()
    @discardableResult
    func cuiCenterInSuperview() -> [NSLayoutConstraint] {
        
        var constraints: [NSLayoutConstraint] = []
        
        if let centerXConstraint = cuiCenterHorizontallyInSuperView() {
            constraints.append(centerXConstraint)
        }
        
        if let centerYConstraint = cuiCenterVerticallyInSuperView() {
            constraints.append(centerYConstraint)
        }
        
        return constraints
    }
    
    /// Centers view horizontally in superview
    ///
    /// - Returns: Added layout constraint or nil if it has no superview
    /// - Example: view.cuiCenterHorizontallyInSuperView
    @discardableResult
    func cuiCenterHorizontallyInSuperView() -> NSLayoutConstraint? {
        
        guard let superview = superview else {
            return nil
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        return centerXAnchor.cuiDock(to: superview.centerXAnchor)
    }
    
    /// Centers view veritcally in superview
    ///
    /// - Returns: Added layout constraint or nil if it has no superview
    /// - Example: view.cuiCenterVerticallyInSuperView
    @discardableResult
    func cuiCenterVerticallyInSuperView() -> NSLayoutConstraint? {
        
        guard let superview = superview else {
            return nil
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        return centerYAnchor.cuiDock(to: superview.centerYAnchor)
    }
}
