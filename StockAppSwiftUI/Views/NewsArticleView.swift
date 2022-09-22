//
//  NewsArticleView.swift
//  StockAppSwiftUI
//
//  Created by karlis.stekels on 22/09/2022.
//

import SwiftUI
import URLImage


struct NewsArticleView: View {
    
    let newsArticles: [NewsArticleViewModel]
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void
    
    var body: some View {
        
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment: .leading) {
            
            HStack {
                VStack(alignment: .leading) {
                    
                    Text("Top News")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(2)
                    
                    Text("From News")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(2)
                }
                Spacer()
            }.padding()
                .containerShape(Rectangle())
                .gesture(DragGesture()
                    .onChanged(self.onDragBegin)
                    .onEnded(self.onDragEnd))
            
            
            ScrollView {
                VStack {
                    ForEach(self.newsArticles, id: \.title) { article in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(article.publication)
                                    .font(.custom("Arial", size: 22))
                                    .fontWeight(.bold)
                                Text(article.title)
                                    .font(.custom("Arial", size: 22))
                            }
                            Spacer()
                            
                            URLImage(URL(string: article.imageURL)!, content: { image in
                                image.resizable()})
                                .frame(width: 100, height: 100)
                        }.padding(12)
                        
                    }
                }.frame(maxWidth: .infinity)
                
                
            }
            
        }.frame(width: screenSize.width, height: screenSize.height)
            .background(Color(red: 211/255, green: 211/255, blue: 211/255))
            .cornerRadius(20)
        
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        
        let article = Article(title: "News Title", imageURL: "https://prod.static9.net.au/_/media/2019/09/02/10/36/nine_news_melbourne_1600x900_fullstory_nightly6pm.jpg", publication: "The WallStreet Journal")
        
        return NewsArticleView(newsArticles: [NewsArticleViewModel(article: article)], onDragBegin: {_ in}, onDragEnd: {_ in})
    }
}
