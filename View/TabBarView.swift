//
//  TabBarView.swift
//  Business trip
//
//  Created by Viktor on 01.02.2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            Text("календарь командировок")
                .tag("1")
                .tabItem {
                    Image(systemName: "calendar")
                }
            DepartureView()
                .tag("2")
                .tabItem {
                    Image(systemName: "airplane.departure")
                }
            ReportTripView()
                .tag("3")
                .tabItem {
                    Image(systemName: "doc.text")
                }
            ProfileView()
                .tag("4")
                .tabItem {
                    Image(systemName: "person")
                }
            ContactsView()
                .tag("5")
                .tabItem {
                    Image(systemName: "phone")
                }
            
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
