require 'watir'
require 'nokogiri'
require 'open-uri'


@page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
@browser = Watir::Browser.new(:firefox)
@browser.goto 'https://coinmarketcap.com/all/views/all/'


###################### On détermine le nombre de clic
def number_click_load_more
    number_coin = @page.xpath('/html/body/div[1]/div[1]/div[1]/div[1]/div[1]/div/div[1]/span[1]/a')
    number_click_load = 0
    number_coin.each {|num_coin|
        number_click_load = num_coin.content.tr(",", "")
    }
    number_click_load = number_click_load.to_f.round(half: :down)
    number_click_load /= 200
    return number_click_load
end

###################### On charge l'ensemble des données
def load_information(number_click_load)
    for n in 1..number_click_load
        # On Click sur le bouton load more
        @browser.scroll.to :bottom
        @browser.driver.manage.timeouts.implicit_wait = 10000
        load_more_button = @browser.element(:xpath => "//div[@class='cmc-table-listing__loadmore']/button").click
        @browser.driver.manage.timeouts.implicit_wait = 10000

        # on charge les données tous les 500 px
        i=500
        while i < 9999 * n
            @browser.scroll.to [0, i]
            @browser.driver.manage.timeouts.implicit_wait = 10000
            i += 500
        end
    end
end


###################### On récupére les informations qui nous intéresse
def retrieve_information
    coins_names = @browser.tds(class:"cmc-table__cell--sort-by__symbol")
    coins_values = @browser.tds(class:"cmc-table__cell--sort-by__price")
    hash_names_coins = Hash[coins_names.zip(coins_values)]
    return hash_names_coins
end


def perform
    click = number_click_load_more
    load_information(click)
    hash = retrieve_information
    return hash
end

perform