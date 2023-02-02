//
//  ReportTripModel.swift
//  Business trip
//
//  Created by Viktor on 01.02.2023.
//

import Foundation


struct ExpenseItem: Codable, Identifiable {
    var id = UUID()
    let nameExpense: String
    let typeExpense: String 
    let countExpense: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem](){
        //для сохранения и отображения изменений:
        didSet{
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    //для отображения при запуске приложения:
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items){
                self.items = decoded
                return
            }
        }
    }
        
    
    
}
