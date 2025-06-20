import Foundation
import Capacitor
import UIKit

@objc(NavigationBarPlugin)
public class NavigationBarPlugin: CAPPlugin {
    private var currentColor: UIColor = .black
    private var isTransparent: Bool = false

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": value
        ])
    }

    private func getTargetViewController() -> UIViewController? {
        // Try navigation controller first
        if let navController = self.bridge?.viewController?.navigationController {
            return navController
        }
        // Fallback to rootViewController
        if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
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
            } else if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
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
            } else if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
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

extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 1.0
        let length = hexSanitized.count
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
        } else if length == 8 {
            a = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            r = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x000000FF) / 255.0
        } else {
            return nil
        }
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    func toHexString() -> String {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb: Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        if a < 1.0 {
            let argb: Int = (Int)(a*255)<<24 | rgb
            return String(format: "#%08X", argb)
        } else {
            return String(format: "#%06X", rgb)
        }
    }
}
