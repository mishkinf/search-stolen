#!/usr/bin/env ruby
require("launchy")

DEFAULT_MILES_FROM_HOME = 5

# NOTE: EDIT THESE WITH YOUR OWN LOCATION INFORMATION
ZIP_CODE = "94704"
LATITUDE = "37.868358762963"
LONGITUDE = "-122.25646574074"

website, miles_from_home = ARGV
miles_from_home ||= DEFAULT_MILES_FROM_HOME

unless website
  puts "> search_stolen "
  puts "You must pass a website parameter (craigslist or ebay)"
  exit 0
end

def craigslist_search_url(item_name, miles_from_home = 5)
  "https://sfbay.craigslist.org/search/sss?query=#{item_name.gsub(" ", "+")}&sort=rel&hasPic=1&postedToday=1&bundleDuplicates=1&search_distance=#{miles_from_home}&postal=#{ZIP_CODE}"
end

def ebay_search_url(item_name, miles_from_home = 5)
  "https://www.ebay.com/sch/i.html?_from=R40&_trksid=p2334524.m570.l1313.TR11.TRC1.A0.H0.X2013+#{item_name.gsub(" ", "+")}.TRS0&_nkw=#{item_name.gsub(" ", "+")}&_sacat=0&LH_TitleDesc=0&LH_PrefLoc=99&_fsrp=1&_sadis=#{miles_from_home}&_fspt=1&_osacat=0&_odkw=#{item_name.gsub(" ", "+")}&rt=nc&_dcat=111422&LH_TitleDesc=0&_stpos=#{ZIP_CODE}&_oaa=1"
end

def offerup_search_url(item_name, miles_from_home = 5)
  "https://offerup.com/search/?q=#{item_name.gsub(" ", "+")}&radius=#{miles_from_home}&delivery_param=p_s"
end

def facebook_search_url(item_name, miles_from_home = 5)
  km_from_home = (miles_from_home * 1.60934).round
  "https://www.facebook.com/marketplace/320152908114578/search?query=#{item_name.gsub(" ", "+")}&latitude=#{latitude}&longitude=#{longitude}&radiusKM=#{km_from_home}&vertical=C2C"
end

def perform_craigslist_search(search_terms, miles_from_home)
  search_terms.each { |term| Launchy.open craigslist_search_url(term, miles_from_home) }
end

def perform_ebay_search(search_terms, miles_from_home)
  search_terms.each { |term| Launchy.open ebay_search_url(term, miles_from_home) }
end

def perform_offerup_search(search_terms, miles_from_home)
  search_terms.each { |term| Launchy.open offerup_search_url(term, miles_from_home) }
end

def perform_facebook_search(search_terms, miles_from_home)
  search_terms.each { |term| Launchy.open facebook_search_url(term, miles_from_home) }
end

case website.downcase
when "craigslist"
  perform_craigslist_search([
    "macbook pro 15",
    "sony",
    "dji",
    "zhiyun",
    "ring",
    "mindshift",
    "nd filter",
    "watch",
  ], miles_from_home)
when "ebay"
  perform_ebay_search([
    "2013 macbook pro 15",
    "2018 macbook pro 15",
    "dji mavic pro 2",
    "sony a7sii",
    "zhiyun crane",
    "nd filter",
    "mindshift",
    "sony fdr x3000",
    "sony 55 lens",
    "sony 24-70",
    "sony 16-35",
    "sony 24-105",
    "watch",
  ], miles_from_home)
when "offerup"
  perform_offerup_search([
    "macbook pro 15",
    "sony",
    "dji",
    "zhiyun",
    "ring",
    "mindshift",
    "nd filter",
    "watch",
  ], miles_from_home)
when "facebook"
  perform_facebook_search([
    "macbook pro 15",
    "sony",
    "dji",
    "zhiyun",
    "ring",
    "mindshift",
    "nd filter",
    "watch",
  ], miles_from_home)
end
