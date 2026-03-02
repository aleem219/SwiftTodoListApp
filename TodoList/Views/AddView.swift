//
//  AddView.swift
//  TodoList
//
//  Created by Abdul Aleem on 02/03/26.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFiledText:String = ""
    @State var alertTitle:String = ""
    @State var showAlert:Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here..", text: $textFiledText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                    .cornerRadius(10)
                
                Button(action: saveButtonPress) {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                
            }
            .padding(14)
        }
        .navigationTitle("Add an item 🖋️")
        .alert(isPresented: $showAlert,content: getAlert)
    }
    
    func saveButtonPress() {
        if textIsAppropriate(){
            listViewModel.addItem(title: textFiledText)
            presentationMode.wrappedValue.dismiss()
        }
   
        
    }
    func textIsAppropriate() -> Bool {
        if textFiledText.count < 3 {
            alertTitle = "You new todo item must be at least 3 charecters long !!! 😨😰😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
