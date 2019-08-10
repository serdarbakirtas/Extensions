import UIKit
import Foundation

// MARK: - Register&Dequeue

public extension UITableView {
    
    // MARK: - Register & Dequeue
    
    /// Registers a `NibLoadable`, `Reusable` cell
    ///
    /// - Parameter type: Type of the table view cell
    func cuiRegisterCell<T: NibLoadable & Reusable>(type: T.Type) {
        
        register(type.nib, forCellReuseIdentifier: type.reuseIdentifier)
    }
    
    /// Registers a `NibLoadable`, `Reusable` header footer view
    ///
    /// - Parameter type: Type of the header footer view
    func cuiRegisterHeaderFooterView<T: NibLoadable & Reusable>(type: T.Type) {
        
        register(type.nib, forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
    }
    
    /// Dequeues a `Reusable` cell
    ///
    /// - Parameter indexPath: Index path of the cell
    /// - Returns: A `Reusable` cell instance
    func cuiDequeueCell<T: Reusable>(for indexPath: IndexPath) -> T {
        
        // swiftlint:disable force_cast
        let dequeued = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
        return dequeued
    }
    
    /// Returns cell which is visible
    ///
    /// - Parameter indexPath: Index path of the cell
    /// - Returns: A `Reusable` cell instance or nil if not available
    func cuiCell<T: Reusable>(for indexPath: IndexPath) -> T? {
        
        if let visibleCell = cellForRow(at: indexPath) as? T {
            return visibleCell
        }
        return nil
    }
    
    /// Dequeues a `Reusable` header footer view
    ///
    /// - Returns: A `Reusable` header footer view instance
    func cuiDequeueHeaderFooterView<T: Reusable>() -> T {
        
        // swiftlint:disable force_cast
        let dequeued = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T
        return dequeued
    }
}

public extension UITableView {
    
    // MARK: - Header & Footer Helpers
    
    /// Sets given auto layout view as header view
    ///
    /// - Parameter headerView: Header view
    func setAutoLayoutHeaderView(_ headerView: UIView) {
        
        tableHeaderView = createAutolayoutContainer(for: headerView)
    }
    
    /// Sets given auto layout view as footer view
    ///
    /// - Parameter footerView: Footer view
    func setAutoLayoutFooterView(_ footerView: UIView) {
        
        tableFooterView = createAutolayoutContainer(for: footerView)
    }
    
    func createAutolayoutContainer(for view: UIView) -> UIView {
        
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        let height = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        
        var frame = view.frame
        frame.size.height = height
        frame.origin.x = 0.0
        frame.origin.y = 0.0
        view.frame = frame
        
        let containerView = UIView(frame: frame)
        containerView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.cuiPinToSuperview()
        
        return containerView
    }
}
