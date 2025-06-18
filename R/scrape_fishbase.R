scrape_fish_base <- function(url) {
  
  pjs_session$go(url)
  rendered_source <- pjs_session$getSource()
  html_document <- read_html(rendered_source)
  
  sci_xpath <- '//*[@id="ss-sciname"]/h1'
  sci_text <- html_document %>%
    html_node(xpath = sci_xpath) %>%
    html_text(trim = T)
  
  comm_xpath <- '//*[@id="ss-sciname"]/span'
  comm_text <- html_document %>%
    html_node(xpath = comm_xpath) %>%
    html_text(trim = T)
  
  env_xpath <- '//*[@id="ss-main"]/div[2]/span'
  evn_text <- html_document %>%
    html_node(xpath = env_xpath) %>%
    html_text(trim = T)
  
  threat_path <- '#ss-main > div.rlalign.sonehalf > div > span'
  threat_text <- html_document %>%
    html_node(threat_path) %>%
    html_text(trim = T)
  
  uses_xpath1 <- '//*[@id="ss-main"]/div[13]'
  uses_text1 <- html_document %>%
    html_node(xpath = uses_xpath1) %>%
    html_text(trim = T)
  
  uses_xpath2 <- '//*[@id="ss-main"]/div[12]'
  uses_text2 <- html_document %>%
    html_node(xpath = uses_xpath2) %>%
    html_text(trim = T)
  
  iucn_xpath <- '#ss-main > div.sleft.sonehalf > div > span'
  iucn_text <- html_document %>%
    html_node(iucn_xpath) %>%
    html_text(trim = T)
  
  phys_xpath <- '//*[@id="ss-main"]/div[4]/span'
  phys_text <- html_document %>%
    html_node(xpath = phys_xpath) %>%
    html_text(trim = T)
  
  model_xpath <- '//*[@id="ss-main"]/div[20]'
    model_text <- html_document %>% 
      html_node(xpath = model_xpath) %>% 
      html_text(trim = T)
  
  article <- data.frame(
    url = url,
    sci_name = sci_text,
    common_name = comm_text,
    habitat = evn_text,
    threat_to_humans = threat_text,
    human_uses1 = uses_text1,
    human_uses2 = uses_text2,
    IUCN_red_list_status = iucn_text,
    physical_characters = phys_text,
    model_predictions = model_text
  )
  
  return(article)
}
