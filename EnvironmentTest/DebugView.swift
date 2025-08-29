//
//  DebugView.swift
//  Dev
//
//  Created by Harshit Singh on 8/29/25.
//

import SwiftUI

struct DebugView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Debug View")
                
                Button("Dismiss") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    DebugView()
}
