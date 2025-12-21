import Foundation
import Capacitor
import UIKit

@objc(NavigationBarPlugin)
public class NavigationBarPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "NavigationBarPlugin"
    public let jsName = "NavigationBar"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "show", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "hide", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "setColor", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "setTransparency", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "getColor", returnType: CAPPluginReturnPromise)
    ]
    
    private var currentColor: UIColor = .black
    private var isTransparent: Bool = false

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": value
        ])
    }

    private func getKeyWindow() -> UIWindow? {
        if #available(iOS 15.0, *) {
            return UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        }
    }

    private func getTargetViewController() -> UIViewController? {
        // Try navigation controller first
        if let navController = self.bridge?.viewController?.navigationController {
            return navController
        }
        // Fallback to rootViewController
        if let window = getKeyWindow() {
            return window.rootViewController
        }
        return nil
    }

    @objc func show(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            if let navController = self.bridge?.viewController?.navigationController {
                navController.setNavigationBarHidden(false, animated: true)
                self.notifyListeners("onShow", data: [:])
                call.resolve()
                return
            }
            // Fallback: nothing to show, but resolve
            self.notifyListeners("onShow", data: [:])
            call.resolve()
        }
    }

    @objc func hide(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            if let navController = self.bridge?.viewController?.navigationController {
                navController.setNavigationBarHidden(true, animated: true)
                self.notifyListeners("onHide", data: [:])
                call.resolve()
                return
            }
            // Fallback: nothing to hide, but resolve
            self.notifyListeners("onHide", data: [:])
            call.resolve()
        }
    }

    @objc func setColor(_ call: CAPPluginCall) {
        guard let colorHex = call.getString("color") else {
            call.reject("Color hex string is required")
            return
        }
        let darkButtons = call.getBool("darkButtons") ?? false
        DispatchQueue.main.async {
            let color = UIColor(hex: colorHex) ?? .black
            self.currentColor = color
            if let navController = self.bridge?.viewController?.navigationController {
                let navBar = navController.navigationBar
                navBar.barTintColor = color
                navBar.isTranslucent = false
                navBar.tintColor = darkButtons ? .black : .white
                navBar.titleTextAttributes = [.foregroundColor: darkButtons ? UIColor.black : UIColor.white]
            } else if let window = self.getKeyWindow() {
                window.rootViewController?.view.backgroundColor = color
            }
            self.notifyListeners("onColorChange", data: ["color": colorHex])
            call.resolve()
        }
    }

    @objc func setTransparency(_ call: CAPPluginCall) {
        let isTransparent = call.getBool("isTransparent") ?? false
        DispatchQueue.main.async {
            if let navController = self.bridge?.viewController?.navigationController {
                let navBar = navController.navigationBar
                if isTransparent {
                    navBar.setBackgroundImage(UIImage(), for: .default)
                    navBar.shadowImage = UIImage()
                    navBar.isTranslucent = true
                    navBar.backgroundColor = .clear
                } else {
                    navBar.setBackgroundImage(nil, for: .default)
                    navBar.shadowImage = nil
                    navBar.isTranslucent = false
                    navBar.backgroundColor = self.currentColor
                }
            } else if let window = self.getKeyWindow() {
                if isTransparent {
                    window.rootViewController?.view.backgroundColor = .clear
                } else {
                    window.rootViewController?.view.backgroundColor = self.currentColor
                }
            }
            self.isTransparent = isTransparent
            call.resolve()
        }
    }

    @objc func getColor(_ call: CAPPluginCall) {
        let hex = self.currentColor.toHexString()
        call.resolve(["color": hex])
    }
}
