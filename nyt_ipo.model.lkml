connection: "nyt_ipo"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: nyt_ipo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: nyt_ipo_default_datagroup

explore: nyt_data {}
explore: nyt_data_updated {}
