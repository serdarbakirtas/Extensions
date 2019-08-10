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
}
