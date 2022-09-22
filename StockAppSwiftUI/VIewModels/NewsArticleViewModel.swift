//
//  NewsArticleViewModel.swift
//  StockAppSwiftUI
//
//  Created by karlis.stekels on 22/09/2022.
//

import Foundation

struct NewsArticleViewModel {
    let article: Article
    
    var imageURL: String {
        return self.article.imageURL
    }
    
    var title: String {
        return self.article.title
    }
    
    var publication: String {
        return self.article.publication.uppercased()
    }
    
}
