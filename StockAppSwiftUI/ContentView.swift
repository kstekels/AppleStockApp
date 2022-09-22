//
//  ContentView.swift
//  StockAppSwiftUI
//
//  Created by karlis.stekels on 21/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var stockListVM = StockListViewModel()
    
    init() {
//        UINavigationBar.appearance().backgroundColor = UIColor.black
//        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        UITableView.appearance().backgroundColor = UIColor.black
//        UITableViewCell.appearance().backgroundColor = UIColor.black
        stockListVM.load()
    }
    
    var body: some View {
        
        let filterStocks = self.stockListVM.searchTerm.isEmpty ? self.stockListVM.stocks : self.stockListVM.stocks.filter {
            $0.symbol.starts(with: self.stockListVM.searchTerm)
        }
        
        return NavigationView{
            ZStack(alignment: .leading) {
                Text("September 21 2022")
                    .font(.custom("Arial", size: 24))
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: -20, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -300)
                SearchView(searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -250)
                
                StockListView(stocks: filterStocks)
                    .offset(y: 250)
                
                NewsArticleView(newsArticles: self.stockListVM.news, onDragBegin: { value in
                    self.stockListVM.dragOffset = value.translation
                }, onDragEnd: { value in
                    
                    if value.translation.height < 0 {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 100)
                    } else {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 650)
                    }
                    
                })
                .animation(.spring())
                .offset(y: self.stockListVM.dragOffset.height)
            }
            .navigationTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
