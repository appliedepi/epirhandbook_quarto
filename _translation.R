# NEW LANGUAGE TRANSLATION PROTOCOL ------------------------------------------------------------------------

# 0. Create a new branch for a new language

# 1. First install the babeldown package
#install.packages('babeldown', repos = c('https://ropensci.r-universe.dev', 'https://cloud.r-project.org'))

# 2. Register new language in _quarto.yml
# From a book whose main language is English, register a new language in the Quarto configuration _quarto.yml
babelquarto::register_main_language(main_language = "en")
babelquarto::register_further_languages(further_languages = "de")
# https://docs.ropensci.org/babeldown/articles/quarto.html

# 3. Translate the book
# babeldown helps you translate each book chapter. It will translate chapters one by one with babeldown before having a human review the translation.

# Setup the environment variable
Sys.setenv("DEEPL_API_URL" = "https://api.deepl.com")
Sys.setenv(DEEPL_API_KEY = "287d5481-9d96-8500-228c-6f98cfb3c576")

# Rendering new language
# Translate a cover page
babeldown::deepl_translate_quarto(
     book_path = here::here(),
     chapter = "index.qmd",
     force = TRUE,
     render = FALSE, # Whether to run babelquarto::render_bool() after translation.
     source_lang = "EN",
     target_lang = "DE",
     formality = "less")

# Translate chapter page
chapter_list = c("editorial_style.qmd", "data_used.qmd", "basics.qmd", "transition_to_R.qmd", "packages_suggested.qmd", "r_projects.qmd", "importing.qmd", #"cleaning.qmd", 
                 "dates.qmd", #"characters_strings.qmd", 
                 "factors.qmd", "pivoting.qmd", "grouping.qmd", "joining_matching.qmd", "deduplication.qmd", "iteration.qmd", "tables_descriptive.qmd", "stat_tests.qmd", "regression.qmd", "missing_data.qmd", 
                 "standardization.qmd", "moving_average.qmd", "time_series.qmd", "epidemic_models.qmd", "contact_tracing.qmd", "survey_analysis.qmd", "survival_analysis.qmd", "gis.qmd", "tables_presentation.qmd", "ggplot_basics.qmd", "ggplot_tips.qmd", "epicurves.qmd", "age_pyramid.qmd", "heatmaps.qmd", "diagrams.qmd", "combination_analysis.qmd", "transmission_chains.qmd", "phylogenetic_trees.qmd", "interactive_plots.qmd", "rmarkdown.qmd", "reportfactory.qmd", "flexdashboard.qmd", "shiny_basics.qmd", "writing_functions.qmd", "directories.qmd", "collaboration.qmd", "errors.qmd", "help.qmd", "network_drives.qmd", "data_table.qmd")

# Write a loop to run the translation for each chapter based on chapter_list
for (i in 1:length(chapter_list)) {
     babeldown::deepl_translate_quarto(
          book_path = here::here("new_pages"),
          chapter = chapter_list[i],
          force = TRUE,
          render = FALSE, # Whether to run babelquarto::render_bool() after translation.
          source_lang = "EN",
          target_lang = "DE",
          formality = "less")
}

# 4. Review the translation, make a PR and re-render the book

# 5. Re-render chapter that has changes
chapters_changed = c("factors.qmd")
chapters_changesd_update = c("factors.fr.qmd", 
                             "factors.es.qmd", 
                             "factors.jp.qmd", 
                             "factors.pt.qmd", 
                             "factors.tr.qmd", 
                             "factors.ru.qmd", 
                             "factors.vn.qmd", 
                             "factors.de.qmd")
target_lang = c("FR", "ES", "JA", "PT-PT", "TR", "RU", "VN", "DE")

# Write a loop to run the updated translation for each chapter based on chapter_changes_update, noted that the target_lang argument should be also adapted based on target_lang 

for (i in 1:length(chapter_changes)) {
        for (j in 1:length(target_lang)) {
                babeldown::deepl_update(
                        path = here::here("new_pages", chapter_changes[i]),
                        out_path = here::here("new_pages", chapter_changes_update[j]),
                        source_lang = "EN",
                        target_lang = target_lang[j],
                        formality = "less",
                        yaml_fields = NULL)
        }}


babeldown::deepl_update(
     path = here::here("new_pages", "factors.qmd"),
     out_path = here::here("new_pages", "factors.de.qmd"),
     source_lang = "EN",
     target_lang = "DE",
     formality = "less",
     yaml_fields = NULL)




# 
# babeldown::deepl_translate_quarto(
#         book_path = here::here("new_pages"),
#         chapter = "cleaning.qmd",
#         force = TRUE,
#         render = FALSE, # Whether to run babelquarto::render_bool() after translation.
#         source_lang = "EN",
#         target_lang = "DE",
#         formality = "less")
# babeldown::deepl_translate_quarto(
#         book_path = here::here("new_pages"),
#         chapter = "characters_strings.qmd",
#         force = TRUE,
#         render = FALSE, # Whether to run babelquarto::render_bool() after translation.
#         source_lang = "EN",
#         target_lang = "DE",
#         formality = "less")

