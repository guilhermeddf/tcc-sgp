rails g scaffold language name
rails g scaffold ability name description:text scope:integer
rails g scaffold function name
rails g scaffold local name country state city
rails g scaffold project name size:integer start_date:date end_date:date local:references
rails g scaffold theme name project:references
rails generate devise user admin:boolean name schedule local:references
rails g scaffold function_user_project project:references function:references user:references
rails g scaffold release version deliver_date:date project:references
rails g scaffold user_language language:references user:references
rails g scaffold sprint project:references start_date:date end_date:date planning_start_date:date planning_end_date:date 
execution_start_date:date execution_end_date:date review_meeting_date:date retrospective_meeting_date:date release:references
rails g scaffold user_story description:text business_value:integer status:integer story_points:integer theme:references
rails g scaffold user_story_acceptance_criterion description:text status:integer user_story:references
rails g scaffold task description:text end_date:date status:integer user_story:references
rails g scaffold user_ability user:references ability:references
rails g scaffold task_requirement task:references ability:references level:integer
rails g scaffold user_task user:references task:references

