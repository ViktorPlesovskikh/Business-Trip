//
//  AddViewModel.swift
//  Business trip
//
//  Created by Viktor on 01.02.2023.
//

import SwiftUI

struct AddViewModel: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses = Expenses()
    @State private var nameExpense = ""
    @State private var typeExpense = "Personal"
    @State private var countExpense = ""
    
    //создание массива для пикера
    let typesExpense = ["Expense of the company", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                Section("Добавить") {
                    TextField("Название", text: $nameExpense)
                    Picker("Тип", selection: $typeExpense) {
                        ForEach(self.typesExpense, id: \.self){
                            Text($0)
                        }
                    }
                    TextField("Сумма затрат", text: $countExpense)
                        .keyboardType(.numberPad)
                }
                .navigationBarTitle("Добавление расходов")
                .navigationBarItems(trailing: Button("Сохранить", action: {
                    if let actualcountExpense = Int(self.countExpense){
                        let item = ExpenseItem(nameExpense: self.nameExpense, typeExpense: self.typeExpense, countExpense: actualcountExpense)
                        self.expenses.items.append(item)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }))
            }
        }
    }
}

struct AddViewModel_Previews: PreviewProvider {
    static var previews: some View {
        AddViewModel()
    }
}
