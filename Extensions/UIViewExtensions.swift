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

    
}
