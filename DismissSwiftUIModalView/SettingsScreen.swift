//
//  SettingsScreen.swift
//  DismissSwiftUIModalView
//
//  Created by Vladimir Butko on 03/10/2021.
//

import SwiftUI

struct SettingsScreen: View {
    var dismissAction: (() -> Void)
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 16) {
                Button("**UIKit** - using passed action from UIViewController") {
                    dismissAction()
                }
                
                Button("**iOS 13** - using SwiftUI environment value `presentationMode`") {
                    presentationMode.wrappedValue.dismiss()
                }
                
                Button("**iOS 15** - using SwiftUI environment value `dismiss`") {
                    dismiss()
                }
                
                Spacer()
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        if #available(iOS 15.0, *) {
                            dismiss()
                        } else {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen(dismissAction: {
            print("dismiss tapped")
        })
    }
}
