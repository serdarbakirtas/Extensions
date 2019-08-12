import UIKit

// MARK: - Hierarchy

public extension UINavigationController {
    
    func viewControllers<T>() -> [T] {
        
        return viewControllers.compactMap {
            $0 as? T
        }
    }
    
    func firstViewController<T>() -> T? {
        
        return viewControllers().first
    }
    
    func lastViewController<T>() -> T? {
        
        return viewControllers().last
    }
}

// MARK: - Push/Pop with completion blocks

public extension UINavigationController {
    
    func pushViewController(
        viewController: UIViewController,
        animated: Bool,
        completion: (() -> Void)? = nil
        ) {
        
        pushViewController(viewController, animated: animated)
        
        if let coordinator = transitionCoordinator, animated {
            coordinator.animate(alongsideTransition: nil) { _ in completion?() }
        } else {
            DispatchQueue.main.async { completion?() }
        }
    }
    
    func popViewController(
        animated: Bool,
        completion: (() -> Void)? = nil
        ) {
        
        popViewController(animated: animated)
        
        if let coordinator = transitionCoordinator, animated {
            coordinator.animate(alongsideTransition: nil) { _ in completion?() }
        } else {
            DispatchQueue.main.async { completion?() }
        }
    }
}
