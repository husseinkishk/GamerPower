//
//  Utilities.swift
//  GamerPower
//
//  Created by Hussein Kishk on 11/06/2024.
//

import UIKit

class UIHelpers {
    static func getStatusBarHeight() -> CGFloat {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            return windowScene.statusBarManager?.statusBarFrame.height ?? 0
        }
        return 0
    }
}

extension String {
    func formattedDate(from inputFormat: String = "yyyy-MM-dd HH:mm:ss", to outputFormat: String = "MMM dd, yyyy") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        guard let date = dateFormatter.date(from: self) else { return nil }
        dateFormatter.dateFormat = outputFormat
        return dateFormatter.string(from: date)
    }
}

extension Date {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: self)
    }
}

