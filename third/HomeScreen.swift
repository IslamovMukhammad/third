//
//  HomeScreen.swift
//  third
//
//  Created by Muhammad Islamov on 17/02/22.
//

import SwiftUI

struct HomeScreen: View {
    @State var showAlert = false
    @State var showSheet = false
    
    var actionSheet: ActionSheet {
        let title = "iOS"
        let message = "Here we go"
        return ActionSheet(title: Text(title), message: Text(message),
                           buttons: [
                            .default(Text("OK")),
                            .destructive(Text("NO"))
                           ])
    }
    
    var body: some View {
        TabView{
            //Alert Button
            Button(action: {
                self.showAlert = true
            }, label: {
                Text("Alert Dialog")
                    .font(.title)
            }).tabItem({
                Image(systemName: "circle")
                Text("Alert")
            }).alert(isPresented: $showAlert){
                let title = "iOS"
                let message = "Here we go"
                return Alert(title: Text(title), message: Text(message),
                             primaryButton: .destructive(Text("NO")), secondaryButton: .default(Text("OK")))
            }
                .tag(0)
    
            //Sheet Button
            Button(action: {
                self.showSheet = true
            }, label: {
                Text("Action Sheet")
                    .font(.title)
            }).tabItem({
                Image(systemName: "circle")
                Text("Sheet")
            }).actionSheet(isPresented: $showSheet, content: {
                self.actionSheet
            })
                .tag(1)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}


