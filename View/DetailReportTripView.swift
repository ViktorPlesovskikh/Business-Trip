//
//  DetailReportTripView.swift
//  Business trip
//
//  Created by Viktor on 01.02.2023.
//

import SwiftUI

struct DetailReportTripView: View {
    var body: some View {
        NavigationView {
            VStack{
                Form{
                    Section("Дата документа") {
                        Text("25.04.22")
                    }
                    Section("Компания (выдавшая чек)") {
                        Text("Компания (выдавшая чек)")
                    }
                    Section("Описание") {
                        Text("Описание")
                    }
                    Section("Сумма чека") {
                        Text("Сумма")
                    }
                }
                
            }
            .navigationBarTitle("Описание затрат", displayMode: .inline)
        }
        
    }
}

struct DetailReportTripView_Previews: PreviewProvider {
    static var previews: some View {
        DetailReportTripView()
    }
}
