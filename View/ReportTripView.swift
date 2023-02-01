//
//  ReportTripView.swift
//  Business trip
//
//  Created by Viktor on 01.02.2023.
//

import SwiftUI

struct ReportTripView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.nameExpense)
                                .font(.headline)
                            Text(item.typeExpense)
                        }
                        Spacer()
                        Text("\(item.countExpense) ₽")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Затраты за командировку", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                self.showingAddExpense = true
            }) {
                Image(systemName: "plus")
            }
            )
            //преход с помощью листа
            .sheet(isPresented: $showingAddExpense) {
                AddViewModel(expenses: self.expenses)
            }
        }
        
        }
    func removeItems(as offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ReportTripView_Previews: PreviewProvider {
    static var previews: some View {
        ReportTripView()
    }
}
