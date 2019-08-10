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
    
    
}
