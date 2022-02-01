//
//  SettingsView.swift
//  Fructus
//
//  Created by Frannck Villanueva on 02/12/21.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
                VStack (spacing: 20){
                    // MARK: - SECTION 1
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                    ) {
                        Divider().padding(.vertical, 4)
                        HStack (alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins and much more.")
                                .font(.footnote)
                        }
                    }
                    // MARK: - SECTION 2
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
                    ){
                        Divider().padding(.vertical, 4)
                        Text("If you want you can restart the application by toogle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 16)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    }
                    // MARK: - SECTION 3
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                    ) {
                        SettingsRowView(name: "Developer", content: "FrannckV")
                        SettingsRowView(name: "Designer", content: "FrannckV")
                        SettingsRowView(name: "Compatibility", content: "iOS 15")
                        SettingsRowView(name: "Instagram", linkLabel: "@frannckv", linkDestination: "instagram.com/frannckv")
                        SettingsRowView(name: "Twitter", linkLabel: "@FrannckV", linkDestination: "twitter.com/frannckv")
                        SettingsRowView(name: "SwiftUI", content: "2.0")
                        SettingsRowView(name: "Version", content: "1.1.0")
                    }//: BOX
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Academic", labelImage: "bookmark")
                    ){
                        Divider().padding(.vertical, 4)
                            Text("This development was part of the SwiftUI Masterclass imparted by Udemy.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 16)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        SettingsRowView(name: "Udemy", linkLabel: "udemy.com", linkDestination: "www.udemy.com/course/swiftui-masterclass-course-ios-development-with-swift")
                    }
                }//: VSTACK
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "xmark")
                        }
                )
                .padding()
            }
        }//: NAVIGATION
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
