//
//  DepartureView.swift
//  Business trip
//
//  Created by Viktor on 01.02.2023.
//
import Foundation
import SwiftUI
import UIKit
import WebKit


struct DepartureView: View {
    @State private var showWebView = false
    
    private let urlString: String = "https://www.s7.ru"
    private let urlStringAeroflot: String = "https://www.aeroflot.ru/ru-ru"
    
    
    var body: some View {
//        Text("Должен быть переход на WebView на сайт S7")
        VStack(spacing: 10){
            WebView(url: URL(string: urlString)!)
                .frame(height: 650.0)
                .shadow(color: .black.opacity(0.3), radius: 20, x: 5, y: 5)
            Button {
                showWebView.toggle()
            } label: {
                Text("Открыть билеты аэрофлота")
            }
            .sheet(isPresented: $showWebView) {
                WebView(url: URL(string: urlStringAeroflot)!)
            }

        }.padding()
    }
}

struct WebView: UIViewRepresentable {
    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    func updateUIView(_ webView: WKWebView, context: Context) {
        let reqest = URLRequest(url: url)
        webView.load(reqest)
    }
}
struct DepartureView_Previews: PreviewProvider {
    static var previews: some View {
        DepartureView()
    }
}
