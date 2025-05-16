//
//  ContentView.swift
//  Products
//
//  Created by Benjamin Rojo on 15/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color("AccentColor"), .white]),
                    startPoint: .top,
                    endPoint: .bottom
                        
                 )
                .ignoresSafeArea()
                
         Text("Catálogo de Productos")
                .font(.largeTitle)
                .foregroundColor(.white)
            
        }

    }
}
struct Product: View{
    let id = UUID()
       let nombre: String
       let precio: Double
       let imagenLocal: String
       let imagenWeb: String
    
    var body: some View{
    }
}
struct ProductRowView: View{
    var body: some View{
        HStack{
            Image(imagenLocal)
                .frame(width: 80, height: 80)
            Text(nombre)
                .bold()
                .font(.headline)
            Text(precio)
                .foregroundColor(.gray)
            Spacer()
            Button(action: {
                print("Producto favorito: NombreDelProducto")
            }) {
                Label("Button", systemImage: "heart.fill")
                    .foregroundColor(.red)
            }
        }
    }
}



#Preview {
    ContentView()
}
