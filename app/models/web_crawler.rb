class WebCrawler
    require 'nokogiri'
    require 'open-uri'

    def self.search
        url_base = "https://quotes.toscrape.com"
       
        while true 
            page = Nokogiri::HTML(open(url_base))

            if page.present?
                quotes = page.css(".quote")

                quotes.each do |quote|                    
                    quote_text = quote.css(".text").children.text
                    author = quote.css(".author").children.text
                    about = quote.search("a")[0].attributes.values[0].value
                    tags = ""

                    max_tag = quote.css(".tag").size

                    tags_array = quote.css(".tag").map {|a|[a.text]}

                    tags_array.each_with_index do |tag,index|                        
                        tags = tags + "#{tag[0]}#{max_tag != index + 1 ? ',' : ''}"
                    end

                    Quote.create(quote: quote_text, author: author, author_about: about, tags: tags.split(","))
                end

                if page.css(".next").present?
                    next_page = page.css(".next")[0].css('a')[0].attributes["href"].value                

                    url_base = "https://#{url_base.split("/")[2]}"

                    url_base = url_base + next_page

                    puts page.css(".next")[0].css('a')[0].attributes["href"].value
                else
                    puts 'SAINDO DO LOOP'
                    break
                end
            else
                puts 'SAINDO DO LOOP'
                break
            end
        end       
    end
end
