
# Use these commands to actually render the handbook
# See format and content choices below  

babelquarto::render_book()



# Content translation
install.packages('babeldown', repos = c('https://ropensci.r-universe.dev', 'https://cloud.r-project.org'))


# babelquarto helps you render the book thanks to registering languages in the configuration.
# From a book whose main language is English, register a new language in the Quarto configuration _quarto.yml
babelquarto::register_main_language(main_language = "en")
babelquarto::register_further_languages(further_languages = "es")

# https://docs.ropensci.org/babeldown/articles/quarto.html



# babeldown helps you translate each book chapter. An ideal workflow is to first register languages in the configuration,after which translating chapters one by one with babeldown before having a human review the translation.

Sys.setenv("DEEPL_API_URL" = "https://api.deepl.com")
Sys.setenv(DEEPL_API_KEY = keyring::key_get("deepl"))
babeldown::deepl_translate_quarto(
        "intro.qmd",
        render = TRUE,
        source_lang = "EN",
        target_lang = "ES",
        formality = "less"
)



