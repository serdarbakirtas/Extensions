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
    
    
}
