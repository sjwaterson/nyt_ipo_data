connection: "nyt_ipo"
label: "Tech Company IPOs"

# include all the views
include: "*.view"

week_start_day: wednesday

datagroup: nyt_ipo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: nyt_ipo_default_datagroup

explore: nyt_data_basic {
  label: "Tech Company IPOs"
  description: "NYT Demo data with light modeling to add understandable names, create measures, etc."
}
explore: nyt_data_default_looker {
  label: "Tech Company IPOs, unmodeled"
  description: "This is what the NYT Demo data looks like when it is just pulled into Looker."
}
