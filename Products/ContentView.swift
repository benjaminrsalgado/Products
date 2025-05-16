//
//  ContentView.swift
//  Products
//
//  Created by Benjamin Rojo on 15/05/25.
//

import SwiftUI

//  Modelo de Producto
struct Product: Identifiable {
    let id = UUID()
    let nombre: String
    let precio: String
    let imagenLocal: String
    let imagenWeb: String
}

// Vista Principal
struct ContentView: View {
    // Lista de productos para mostrar
    let productos = [
        Product(nombre: "iPhone 16 Pro Max", precio: "$999.99", imagenLocal: "iPhoneMax", imagenWeb: "https://www.apple.com/newsroom/images/2024/09/apple-debuts-iphone-16-pro-and-iphone-16-pro-max/tile/Apple-iPhone-16-Pro-hero-240909-lp.jpg.news_app_ed.jpg"),
        Product(nombre: "iPhone 16e", precio: "$799.99", imagenLocal: "16e", imagenWeb: "https://webonline.macstore.mx/img/sku/iphone744_FZ.jpg")
    ]
    
    var body: some View {
        ZStack {
            // Fondo con gradiente
            LinearGradient(
                gradient: Gradient(colors: [Color("AccentColor"), .white]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                // Título de la aplicación
                Text("Catálogo de Productos")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                // Lista de productos
                ProductListView(ventas: productos)
                    .padding(.horizontal)
            }
        }
    }
}


// Vista para Mostrar Cada Producto
struct ProductRowView: View {
    var product: Product
    
    var body: some View {
        HStack {
            // Imagen del producto
            Image(product.imagenLocal)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            
            // Información del producto
            VStack(alignment: .leading) {
                Text(product.nombre)
                    .bold()
                    .font(.headline)
                Text(product.precio)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Botón de favorito
            Button(action: {
                print("Producto favorito: \(product.nombre)")
            }) {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

// Lista de Productos
struct ProductListView: View {
    let ventas: [Product]
    
    var body: some View {
        List(ventas) { product in
            ProductRowView(product: product)
        }
    }
}

#Preview {
    ContentView()
}
