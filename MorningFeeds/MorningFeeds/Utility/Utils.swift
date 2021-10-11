//
//  Utils.swift
//  MorningFeeds
//
//  Created by Hiral Jotaniya on 01/10/21.
//

import Foundation
import SwiftUI
import SystemConfiguration


class Utils {
    public static func getFormattedDateString(someDate: Date?) -> String {
        if (someDate == nil) {
            return "Unknown"
        }
        
        let minute = 60.0, hour = 3600.0
        let now = Date(), difference = now.timeIntervalSince(someDate!)
        let formatter = DateFormatter()
        let calendar = Calendar(identifier: .gregorian)
        
        if difference < minute {
            return "Few seconds ago"
        } else if difference < hour {
            return "Few minutes ago"
        }
        
        if (calendar.isDateInToday(someDate!)) {
            formatter.dateFormat = "HH:mm"
            return "Today " + formatter.string(from: someDate!)
        } else if (calendar.isDateInYesterday(someDate!)) {
            formatter.dateFormat = "HH:mm"
            return "Yesterday " + formatter.string(from: someDate!)
        }
        
        formatter.dateFormat = "dd MMM HH:mm"
        return formatter.string(from: someDate!)
    }
}

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var onSearchButtonClicked: (() -> Void)? = nil
//    var onCancelClicked : (() -> Void)? = nil

    class Coordinator: NSObject, UISearchBarDelegate {

        let control: SearchBar

        init(_ control: SearchBar) {
            self.control = control
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            control.text = searchText
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            print("8888888888888888888888888")
            control.onSearchButtonClicked?()
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            print("0000000000000000000000")
//            control.onCancelClicked?()
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.placeholder = "Search.."
        searchBar.delegate = context.coordinator
        return searchBar
    }
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }

}

